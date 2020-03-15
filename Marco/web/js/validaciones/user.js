
$(function () {
    

    $("#formLogin").validate({
        rules: {
            confirmaCorreo: {
                required: {depends: function () {
                        $(this).val($.trim($(this).val()));
                        return true;
                    }},
                minlength: 3,
                email: true,
                maxlength: 20
            }
        },
        messages: {
            confirmaCorreo: {
                required: "este campo es obligatorio",
                minlength: "minimo 3 caracteres",
                email: "formato email invalido",
                maxlength: "no pueden superrar 20 caracteres"
            }
        },
        submitHandler: function (form) {
            const data = $("#formLogin").serialize();
            console.log(data)
            $.post("Usuario", data, (res, est, que) => {
                if (res == "false") {
                    $("#pass").val("");
                    $("#err").text("usuario o contraseña erroneo");
                }else
                {
                    $(location).attr('href', "USUARIO_Perfil.jsp")
                }
            })
        }
    })


    $("#formSign").validate({
        rules: {
            nombres:{
                required: true,
                minlength: 3,
                maxlength: 20
            },
            apellidos:{
                required: true,
                minlength: 3,
                maxlength: 20
            },
            fechaNacimiento:{
                required: true,
                minlength: 3,
                maxlength: 20
            },
            confirmaCorreo: {
                required: {depends: function () {
                        $(this).val($.trim($(this).val()));
                        return true;
                    }},
                minlength: 3,
                email: true,
                maxlength: 20
            },
            correo: {
                equalTo: "#confirmaCorreo"
            },
            pass: {
                required: true,
                minlength: 8,
                maxlength: 16
            }
        },
        messages: {

            
        },
        submitHandler: function (form) {
            const data = $("#formSign").serialize();
           
            $.post("Usuario", data, (res, est, que) => {
                if (res == "false") {
                    $("#pass").val("");
                    $("#error").text("error 525");
                }else if (res == "CORREO ya existe") {
                    $("#pass").val("");
                }else{
                    $("#error").text("registro exitoso"); 
                    
                }
            })
        }
    })
    
    
    
    
    $("#formReserva").validate({
        rules: {
            ctxCupos:{
                required: true,
                min: 1,
                number: true
            },
            ctxNombres:{
                required: true,
                minlength: 3,
                maxlength: 20
            },
            ctxApellidos:{
                required: true,
                minlength: 3,
                maxlength: 20
            },
            ctxDocumento:{
                required: true,
                minlength: 3,
                maxlength: 20,
                number: true
            },
            ctxCorreo: {
                required: {depends: function () {
                        $(this).val($.trim($(this).val()));
                        return true;
                    }},
                minlength: 3,
                email: true,
                maxlength: 20
            },
            ctxCalificacion: {
                required: true,
                min: 1,
                max: 5,
                number: true
            }
           
        },
        messages: {

            
        },
        submitHandler: function (form) {
            const data = $("#formReserva").serialize();
           
                console.log("weasd");
            $.post("Actividad", data, (res, est, que) => {
                if (res == "false") {
                    
                    $("#error").text("hubo un error *_*");
                
                }else{
                    $("#error").text("registro exitoso"); 
                    
                }
            })
        }
    })
}) 