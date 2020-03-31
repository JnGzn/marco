const url = sessionStorage.getItem("url")

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
                maxlength: 30
            }
        },
        messages: {
            confirmaCorreo: {
                required: "este campo es obligatorio",
                minlength: "minimo 3 caracteres",
                email: "formato email invalido",
                maxlength: "no pueden superrar 30 caracteres"
            }
        },
        submitHandler: function (form) {
            const data = $("#formLogin").serialize();
            console.log(data)
            $.post("Usuario", data, (res, est, que) => {
                if (res == "false") {
                    $("#pass").val("");
                    $("#err").text("usuario o contraseña erroneo");
                } else
                {
                    if (url != null) {
                        $(location).attr('href', url)

                    } else {
                        if (res == "admin") {

                            $(location).attr('href', "ADMIN_index.jsp")
                        } else {
                            $(location).attr('href', "USUARIO_Perfil.jsp")

                        }
                    }
                }
            })
        }
    })


    $("#formSign").validate({
        rules: {
            nombres: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            apellidos: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            fechaNacimiento: {
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
                maxlength: 30
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
                console.log(res)
                if (res == "false") {
                    $("#pass").val("");
                    $("#errorLogin").text("error 525");
                } else if (res == "CORREO ya existe") {
                    $("#error").text("correo ya existente");
                    $("#pass").val("");
                } else if (res === "Registro exitoso") {

                    $("#error").text("registro exitoso");
                    document.getElementById("formSign").reset()
                    $.post("EnvioCorreo", data, (res, est, que) => {

                    })
                }
            })

        }
    })




    $("#formReserva").validate({
        rules: {
            ctxCupos: {
                required: true,
                min: 1,
                number: true
            },
            ctxNombres: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            ctxApellidos: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            ctxDocumento: {
                required: true,
                minlength: 3,
                maxlength: 30,
                number: true
            },
            ctxCorreo: {
                required: {depends: function () {
                        $(this).val($.trim($(this).val()));
                        return true;
                    }},
                minlength: 3,
                email: true,
                maxlength: 30
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


            $.post("Actividad", data, (res, est, que) => {
                if (res == "false") {

                    $("#error").text("hubo un error *_*");

                } else {
                    $("#error").text("registro exitoso");
                    $.post("EnvioCorreo", data, (res, est, que) => {

                    })
                }
            })
        }
    })
}) 