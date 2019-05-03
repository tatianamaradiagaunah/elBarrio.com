$(document).ready(function() {
    $('#btn-registrar').click(function() {
        var id_usario;
        var parametros = `nombre=${$("#regnom").val()}&apellidos=${$("#regapell").val()}&email=${$("#regemail").val()}&password=${$("#regpassword").val()}&confpassword=${$("#confpassword").val()}&telefono=${$("#regtelefono").val()}&genero=${$("#slgen").val()}`;
        //console.log(parametros);
        var indice = document.getElementById("slgen").selectedIndex;
        if ($("#confpassword").val() == $("#regpassword").val() &&
            $("#regnom").val() != "" &&
            $("#regapell").val() != "" &&
            $("#regemail").val() != "" &&
            $("#regtelefono").val() != "" &&
            indice != null || indice != 0
        ) {
            document.getElementById("regpassword").style.borderColor = 'green';
            document.getElementById("confpassword").style.borderColor = 'green';
            $.ajax({
                url: "/guardar",
                method: "POST",
                data: parametros,
                dataType: "json",
                success: function(respuesta) {
                    console.log(respuesta);
                    id_usario = respuesta.insertId;
                    var ingreso_usuario = `email=${$("#regemail").val()}&password=${$("#regpassword").val()}&id=${id_usario}`;
                    //console.log(ingreso_usuario);
                    $.ajax({
                        url: "/guardarUsua",
                        method: "POST",
                        data: ingreso_usuario,
                        dataType: "json",
                        success: function(respuesta2) {
                            console.log(respuesta2);
                            location.href = "/login";
                        },
                        error: function(error2) {
                            console.error(error2);
                        }
                    });
                },
                error: function(error) {
                    console.error(error);
                }
            });
        } else if ($("#regnom").val() == "") {
            document.getElementById("regnom").style.borderColor = 'red';
        } else if ($("#regapell").val() == "") {
            document.getElementById("regapell").style.borderColor = 'red';
        } else if ($("#regemail").val() == "") {
            document.getElementById("regemail").style.borderColor = 'red';
        } else if ($("#regpassword").val() == "") {
            document.getElementById("regpassword").style.borderColor = 'red';
        } else if ($("#confpassword").val() == "") {
            document.getElementById("confpassword").style.borderColor = 'red';
        } else if ($("#confpassword").val() != $("#regpassword").val()) {
            document.getElementById("mostrar").style.display = 'block';
        } else if ($("#regtelefono").val() == "") {
            document.getElementById("regtelefono").style.borderColor = 'red';
        } else if ($("#slgen").val() == "") {
            document.getElementById("slgen").style.borderColor = 'red';
        }



    });

    // **********************************************************************************

    $("#btn-buscar").click(function() {
        var parametros = `buscar=${$("#txt-buscar").val()}`;
        console.log(parametros);
        $.ajax({
            url: "/buscar",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function(res) {
                console.log(res);
                $('#contenedor-empresas').html("");
                $("#txt-buscar").val("");
                res.forEach(element => {
                    $("#contenedor-empresas").append(
                        `<div class="col-lg-4 text-center mb-4 col-lg-4 col-md-4 col-sm-4">
                            <div class="border rounded" style="box-shadow: 2px 2px 5px #999">
                            <div>
                                <img class="img responsive" src="../public/img/${element.cod_empresa}.jpg">
                                <h3>${element.nombre_empresa}</h3>
                                <div class="col-lg-12">
                                
                                <a class="btn" style="background-color:transparent" href="/dashboard/${element.cod_empresa}">Ver descripcion</a>
                                <a class="btn" style="background-color:transparent" href="/rutas2">Ver Productos</a>
                                </div>
                            </div><br>
                            <div >
                                <table class="table">
                                    <tbody id="tbl${element.cod_empresa}">
                                        
                                    </tbody>
                                </table>
                                </div>
                            </div>
                        </div>`

                    )
                });

            },
            error: function(error) {
                console.error(error);
            }
        });
    });


    // ***************************************************
    $('#contenedor-empresas').click(function(e) {
        var id = e.target.id;
        // alert(id); 
        var parametros = `id=${id}`;
        console.log(parametros);
        $.ajax({
            url: "/rutas",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function(res) {
                console.log(res[0].cod_empresa);
                $("#tbl" + `${res[0].cod_empresa}`).html("");
                res.forEach(element => {
                    $("#tbl" + `${element.cod_empresa}`).append(
                        `<tr>
                            <td>${element.Origen}</td>
                            <td>${element.Destino}</td>
                            <td>${element.precio}</td>
                        </tr>
                        `
                    )
                });

            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    //********************************************************************** */

    $("#btn-conf-compra").click(function() {
        var parametros = `Precio=${$("#precio").val()}&ruta=${$("#codigoRuta").val()}&numtarjeta=${$("#numTarjet").val()}&fecha=${$("#fechaV").val()}&csv=${$("#codigoV").val()}&cod_usuario=${$("#codigoUsuario").val()}&cant_boletos=${$("#numero-boletos").val()}`;
        console.log(parametros);
        $.ajax({
            url: "/comprarboleto",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function(res) {
                console.log(res);
                id = res.insertId;
                console.log(id);
                $('#modal2').modal('toggle');
                //$('#modal3').modal('show'); 
                // $('#completo').html('Compra realizada con exito');
                // location.href=`/mostrarboleto/${res.insertId}`;
                $.ajax({
                    url: `/mostrarboleto/${res.insertId}`,
                    method: "POST",
                    dataType: "json",
                    success: function(res) {
                        console.log(res[0].cant_boletos);
                        res.forEach(element => {
                            $("#tarjetas").append(
                                `<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div >
                                     <h1 align="center" style="font-size: 2.0rem;"> <strong>Go
                                            <img src="../public/img/icon_bus.ico" height="45px" width="40px">
                                      Bus </strong></h1>
                                      <h2 align="center" style="font-size: 1.85rem;">Comprobante de Pago</h2>
                                  
                                    <h2 align="center" style="font-size: 1.5rem;">Empresa de Transporte ${element.nombre_empresa}</h2>
                                </div> 
                            </div>
                            <div class="row" style="    margin-left: auto;
                            margin-right: auto;"  >
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <p>Nombre: ${element.nombre}</p>
                                </div> 
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <p>Fecha: ${element.fecha_vencimiento}</p>
                                 </div>  
                                           
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div >
                                    <table class="table">
                                        <thead class="thead-light">
                                            <tr>
                                                <td>Cant. Boletos</td>
                                                <td>Descripcion</td>
                                                <td>Total</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${element.cant_boletos}</td>
                                                <td>${element.descripcion}</td>
                                                <td>${element.Total}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>            
                            </div>
                        </div>
                    </div>`

                            )
                        });

                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
                $('#modal3').modal('show');
            },
            error: function(error) {
                console.error(error);
            }
        });
    });


});
/* **********************************Esto se agrego 10 / 12 / 2018********************************************* */
$(document).ready(function() {
    $('#btn-enviar').click(function() {
        var parametros = `correo=${$("#regemail").val()}`
        $.ajax({
            url: '/enviarCorreo',
            method: 'POST',
            data: parametros,
            dataType: 'json',
            success: function(res) {
                console.log(res);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});

$(document).ready(function() {
    $('#btn-confirmar').click(function() {
        var parametros = `contrasena=${$("#regpassword").val()}&confirmarContrasena=${$("#confpassword").val()}`
        $.ajax({
            url: '/cambioContrasena',
            method: 'POST',
            data: parametros,
            dataType: 'json',
            success: function(res) {
                console.log(res);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});
/*********************************************HASTA AQUI*/