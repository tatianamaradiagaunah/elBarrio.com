//alert("llamado correcto");
function validacion(){

    var name =document.getElementById("reg-nom").value;
    if( name == "" || name.length == 0 || /^\s+$/.test(name) ) {
        document.getElementById('reg-nom').style.borderColor = "red";
        return false;
    }

    var imail = document.getElementById("reg-email").value;
    
    document.getElementById('reg-email').addEventListener('input', function() {
        campo = event.target;
        valido = document.getElementById('emailOK');
        //imail = document.getElementById("reg-email").value;
            
        emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
        //Se muestra un texto a modo de ejemplo, luego va a ser un icono
        if(imail==""){
            document.getElementById('reg-email').style.borderColor = "red";
            return false;
        }
        if (emailRegex.test(campo.value)) {
          valido.innerText = "válido";
        } else {
          valido.innerText = "incorrecto";
        }
    });

    var contrasenia =document.getElementById("reg-password").value;
    if( contrasenia == "" || contrasenia.length == 0 || /^\s+$/.test(contrasenia) ) {
        //alert("Por favor ingrese su contraseña");
        document.getElementById('reg-password').style.borderColor = "red";
        //document.getElementById("reg-nom").val("Este campo es obligatorio");
        return false;
    }
    var contra2 = document.getElementById("conf-password").value;
    if( contra2 == "" || contra2.length == 0 || /^\s+$/.test(contra2) ) {
        //alert("Digite su contraseña de nuevo");
        //document.getElementById("reg-nom").val("Este campo es obligatorio");
        document.getElementById('conf-password').style.borderColor = "red";
        return false;
    }

    var numero = document.getElementById("reg-telefono").value;
    if( !(/^\d{8}$/.test(numero)) ) {
        //alert("El numero debe de contener 8 digitos sin espacio");
        document.getElementById('reg-telefono').style.borderColor = "red";
        return false;
    }

    var indice = document.getElementById("sl-gen").selectedIndex;
    if( indice == null || indice == 0 ) {
        //alert("Seleccione su genero");
        document.getElementById('sl-gen').style.bordercolor= "red";
        return false;
    }
    var indice2 = document.getElementById("sl-lug").selectedIndex;
    if( indice2 == null || indice2 == 0 ) {
        document.getElementById('sl-lug').style.borderColor = "red";
        return false;
    }

}