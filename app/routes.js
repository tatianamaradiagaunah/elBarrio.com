module.exports = function(app, passport) {
    app.get('/', function(req, res) {
        res.render('index.ejs');
    });

    app.get('/login', function(req, res) {
        res.render('login.ejs', { message: req.flash('loginMessage') });
    });

    app.post('/login', passport.authenticate('local-login', {
            successRedirect: '/localizacion',
            failureRedirect: '/login',
            failureFlash: true
        }),
        function(req, res) {
            if (req.body.remember) {
                req.session.cookie.maxAge = 1000 * 60 * 3;
            } else {
                req.session.cookie.expires = false;
            }
            res.redirect('/');
        });

    app.get('/login', function(req, res) {
        res.render('login.ejs', { message: req.flash('signupMessage') });
    });

    app.post('/signup', passport.authenticate('local-signup', {
        successRedirect: '/menu',
        failureRedirect: '/login',
        failureFlash: true
    }));


    app.get('/menu', isLoggedIn, function(req, res) {
        res.render('Localizacion.ejs', {
            user: req.user
        });
    });
    app.get('/localizacion', isLoggedIn, function(req, res) {
        res.render('Localizacion.ejs', {
            user: req.user
        });
    });
    app.get('/Regislocalizacion', function(req, res) {
        res.render('Localizacion.ejs', {
            user: req.user
        });
    });

    //aqui se hace la consulta a la base de datos para mostrar las empresas
    var mysql = require('mysql');
    var dbconfig = require('../config/database');
    var bcrypt = require('bcrypt-nodejs');
    var nodemailer = require('nodemailer'); /* Esto se agrego 10/12/2018*/
    var connection = mysql.createConnection(dbconfig.connection);
    connection.query('USE ' + dbconfig.database);

    app.get('/', function(req, res) {
        res.render('index.ejs');
    });

    /* ************************************ Esto se agrego 10 / 12 / 2018 ******************/
    app.get('/contrasena', function(req, res) {
        res.render('contrasena.ejs');
    });

    app.post('/enviarCorreo', function(req, res) {
        var enviarCorreo = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'soportegobus@gmail.com',
                pass: 'gobus1234'
            }
        });

        var mailOptions = {
            from: '<soportegobus@gmail.com>',
            to: req.body.correo,
            subject: 'Cambio de contraseña',
            html: "Pulse aqui <a href='http://localhost:8011/contrasena'>cambio contrasena</a> para cambiar contraseña"
        };

        enviarCorreo.sendMail(mailOptions, function(error) {
            if (error) {
                console.log(error);
            } else {
                console.log('El mensaje fue enviado con exito');
            }
        });
    });

    app.post('/cambioContrasena', function(req, res) {
        connection.query(`
        UPDATE tbl_usuario SET ? WHERE id = id`, [bcryt.hashSync(req.body.contrasena, null, null)],
            function(error, data, fields) {
                res.send(data);
                res.end();
            }
        );
    });
    //*********************************************HASTA AQUI***************************************************** */


    app.get('/dashboard/:codigo_empresa', isLoggedIn, function(req, res) {
        var a = req.params.codigo_empresa;
        //console.log(a);
        connection.query(`SELECT * FROM tbl_empresa_transporte WHERE cod_empresa=${a}`,
            function(err, resul) {
                //console.log(resul);
                res.render('dashboard.ejs', {
                    empresas: resul,
                    user: req.user
                });
            });
    });
    app.get('/dashboard', isLoggedIn, function(req, res) {
        connection.query("SELECT * FROM tbl_empresa_transporte",
            function(err, resul) {
                //console.log(resul[0]);
                res.render('dashboard.ejs', {
                    empresas: resul,
                    user: req.user
                });
            });
    });
    app.get('/rutas2', isLoggedIn, function(req, res) {
        connection.query("SELECT * FROM tbl_productos",
            function(err, resul, fields) {
                res.render('rutas.ejs', {
                    ruta: resul,
                    user: req.user
                });
            });
    });
    app.get('/profile/:codigo_empresa', isLoggedIn, function(req, res) {
        var a = req.params.codigo_empresa;
        var b = req.user.id;
        //console.log(a);
        connection.query(`SELECT cod_empresa,nombre_empresa,descripcion,
                            (
                            SELECT CONCAT( nombre_persona," " ,apellido_persona) 
                            FROM tbl_persona WHERE cod_persona = ${b}
                            ) AS Nombre
                        FROM tbl_empresa_transporte 
                        WHERE cod_empresa=${a}`,
            function(err, resul) {
                console.log(resul);
                res.render('profile.ejs', {
                    empresas: resul,
                    user: req.user
                });
            });
    });


    // app.get('/profile', function (req, res) {
    //     connection.query("SELECT * FROM tbl_usuario", function (err, resul) {
    //         console.log(resul[0]);
    //         res.render('profile.ejs', {
    //             usuarios: resul,
    //             user: req.user
    //         });
    //     });
    // });
    app.get('/registroUsuarios', function(req, res) {
        res.render('registro-usuarios.ejs', {
            user: req.user
        });
        res.end();

    });

    app.get('/cambiarContrasena', function(req, res) {
        res.render('cambiar-contrasena.ejs');
    });

    app.post("/guardar", function(req, res) {
        connection.query(`
        INSERT INTO tbl_persona (cod_genero,telefono, nombre_persona, apellido_persona) 
        VALUES (?,?,?,?)`, [req.body.genero, req.body.telefono, req.body.nombre, req.body.apellidos],
            function(error, data, fields) {
                res.send(data);
                res.end();
            }
        );

    });
    app.post("/guardarUsua", function(req, res) {
        console.log(req.body.id, req.body.password, req.body.email);

        connection.query(`
        INSERT INTO tbl_usuario (id, username, password) 
        VALUES (?,?,?)`, [req.body.id, req.body.email, bcrypt.hashSync(req.body.password, null, null)],
            function(error, data, fields) {
                res.send(data);
                //console.log(data);

                res.end();
            }
        );

    });

    app.get('/comprar/:cod_ruta', isLoggedIn, function(req, res) {
        var b = req.params.cod_ruta;
        //console.log(a);
        connection.query(`SELECT a.cod_ruta, a.cod_empresa, b.nombre_empresa, c.precio
                        FROM tbl_ruta_x_empresa a 
                        INNER JOIN tbl_empresa_transporte b 
                        ON (a.cod_empresa=b.cod_empresa)
                        INNER JOIN tbl_ruta c 
                        ON (a.cod_ruta=c.cod_ruta)
                        WHERE a.cod_ruta=${b}`,
            function(err, resul) {
                console.log(resul);
                res.render('registrotarjeta-modal.ejs', {
                    rutas: resul,
                    user: req.user
                });
            });
    });



    app.post("/buscar", function(req, res) {
        connection.query("SELECT a.cod_empresa, b.nombre_empresa, c.nombre_lugar FROM tbl_sucursal a INNER JOIN tbl_empresa_transporte b ON (a.cod_empresa = b.cod_empresa) INNER JOIN tbl_lugar c ON (a.tbl_lugar_cod_lugar = c.cod_lugar) WHERE lower(c.nombre_lugar) = lower(?)", [req.body.buscar],
            function(error, data, fields) {
                //console.log(data);
                res.send(data);
                res.end();

            });
    });

    app.post("/rutas", function(req, res) {
        //console.log(req.body.id);
        connection.query(`  SELECT  c.cod_ruta,b.cod_empresa, b.nombre_empresa,c.Origen, c.Destino, c.precio 
                        FROM tbl_ruta_x_empresa a 
                        INNER JOIN tbl_empresa_transporte b 
                        on (a.cod_empresa= b.cod_empresa)    
                        INNER JOIN (SELECT a.cod_ruta AS cod_ruta, b.nombre_lugar AS Origen, c.nombre_lugar AS Destino, a.precio
                                    FROM tbl_ruta a 
                                    INNER JOIN tbl_lugar b 
                                    on (a.cod_lugar_origen=b.cod_lugar) 
                                    INNER JOIN tbl_lugar c 
                                    on (a.cod_lugar_destino=c.cod_lugar)) c 
                        on (a.cod_ruta=c.cod_ruta) 
                        WHERE a.cod_empresa = ?`, [req.body.id],
            function(error, data, fields) {
                res.send(data);
                res.end();
            });
    });

    app.post("/comprarboleto", function(req, res) {
        connection.query(`
        INSERT INTO tbl_compra (cod_usuario, cod_ruta, fecha_vencimiento, impuesto, Total, numero_tarjeta,csv,cant_boletos, precio_boleto) 
        VALUES (?, ?, ?, ?, ?,?,?,?,?)`, [req.body.cod_usuario,
                req.body.ruta,
                req.body.fecha,
                (0.15 * req.body.Precio * req.body.cant_boletos),
                (req.body.cant_boletos * req.body.Precio),
                req.body.numtarjeta,
                req.body.csv,
                req.body.cant_boletos,
                req.body.Precio
            ],
            function(error, data, fields) {
                res.send(data);
                res.end();
            }
        );

    });

    app.post('/mostrarboleto/:codigo_compra', function(req, res) {
        var b = req.params.codigo_compra;
        //console.log(a);
        connection.query(`SELECT a.cod_compra, a.cod_usuario, a.cod_ruta, a.fecha_vencimiento, a.impuesto, a.Total, 
                            a.numero_tarjeta, a.csv, a.cant_boletos, a.precio_boleto, c.nombre_empresa, CONCAT(d.nombre_persona," " ,d.apellido_persona) as nombre, e.descripcion
                        FROM tbl_compra a 
                        INNER JOIN tbl_ruta_x_empresa b 
                        ON(a.cod_ruta=b.cod_ruta)
                        INNER JOIN tbl_empresa_transporte c 
                        ON (b.cod_empresa=c.cod_empresa)
                        INNER JOIN tbl_persona d 
                        ON (d.cod_persona=a.cod_usuario)
                        INNER JOIN (
                                        SELECT c.cod_ruta, CONCAT(c.Origen, "-", c.Destino) as descripcion
                                        FROM tbl_ruta_x_empresa a 
                                        INNER JOIN tbl_empresa_transporte b 
                                        on (a.cod_empresa= b.cod_empresa)    
                                        INNER JOIN (SELECT a.cod_ruta AS cod_ruta, b.nombre_lugar AS Origen, c.nombre_lugar AS Destino, a.precio
                                                    FROM tbl_ruta a 
                                                    INNER JOIN tbl_lugar b 
                                                    on (a.cod_lugar_origen=b.cod_lugar) 
                                                    INNER JOIN tbl_lugar c 
                                                    on (a.cod_lugar_destino=c.cod_lugar)) c 
                                        on (a.cod_ruta=c.cod_ruta)
                                    ) e
                        ON (e.cod_ruta=a.cod_ruta)
                        WHERE a.cod_compra=${b}`,
            function(err, data, fields) {
                //console.log(data);
                res.send(data);
                res.end();
            });
    });

    app.get('/travel/:codigo_empres', isLoggedIn, function(req, res) {
        var codigo = req.params.codigo_empres;
        connection.query(`  SELECT  c.cod_ruta, b.cod_empresa, b.nombre_empresa, c.Origen, c.Destino, c.Hora, c.Duracion AS Duracion_Hr, 			c.precio
                        FROM tbl_ruta_x_empresa a 
                        INNER JOIN tbl_empresa_transporte b 
                        on (a.cod_empresa= b.cod_empresa)
                        INNER JOIN (SELECT a.cod_ruta AS cod_ruta, b.nombre_lugar AS Origen, c.nombre_lugar AS Destino,
                                    d.hora AS Hora, a.Duracion AS Duracion, a.precio As Precio 
                                    FROM tbl_ruta a 
                                    INNER JOIN tbl_lugar b 
                                    on (a.cod_lugar_origen=b.cod_lugar)
                                    INNER JOIN tbl_lugar c 
                                    on (a.cod_lugar_destino=c.cod_lugar)
                                    INNER JOIN tbl_hora d 
                                    on (a.cod_hora=d.cod_hora)) c 
                        on (a.cod_ruta=c.cod_ruta)
                        WHERE a.cod_empresa=${codigo}`,
            function(err, resul) {
                console.log(resul);
                res.render('travel.ejs', {
                    descripRutas: resul,
                    user: req.user
                });
            });
    });

    app.get('/empleados', function(req, res) {
        connection.query("SELECT empleado.cod_persona, empleado.foto, persona.nombre_persona, persona.apellido_persona, persona.edad, empleado.experiencia,  empresa.nombre_empresa, empresa.cod_empresa FROM tbl_persona AS persona INNER JOIN tbl_empleado AS empleado ON persona.cod_persona = empleado.cod_persona INNER JOIN tbl_empresa_transporte AS empresa ON empleado.cod_empresa = empresa.cod_empresa",
            function(err, resul, fields) {
                res.render('empleado.ejs', {
                    conductores: resul,
                    user: req.user
                });
            });
    });

    app.get('/logout', function(req, res) {
        req.logout();
        res.redirect('/login');
    })
};



function isLoggedIn(req, res, next) {
    if (req.isAuthenticated())
        return next();

    res.redirect('/');
}