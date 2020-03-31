

$(function () {

    $("#EmpresaRegistro").validate({
        rules: {
            nit: {
                required: true,
                minlength: 3,
                number: true
            },
            nombre: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            correo: {
                required: true,
                email: true
            },
            pass: {
                required: true,
                minlength: 8,
                maxlength: 20,
                
            }

        },
        messages: {

        },
        submitHandler: function (form) {
            const data = $("#EmpresaRegistro").serialize();


            var formData = new FormData(document.getElementById("EmpresaRegistro"));
            $.ajax({
                url: "Empresas",
                type: 'POST',
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                success: function (result) {
                    console.log(result)
                    if (result == "true") {
                        $("#errorActiv").text("registrado correctamente")
                        document.getElementById("EmpresaRegistro").reset()
                    } else if (result == "existe") {
                        $("#errorActiv").text("nit ya existente")
                    } else {
                        $("#errorActiv").text("hubo un error")
                        $("#pass").val("")
                        
                    }

                }
            });


        }
    })

    $("#EmpresaLogin").validate({
        rules: {
            correo: {
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
            correo: {
                required: "este campo es obligatorio",
                minlength: "minimo 3 caracteres",
                email: "formato email invalido",
                maxlength: "no pueden superrar 20 caracteres"
            }
        },
        submitHandler: function (form) {
            const data = $("#EmpresaLogin").serialize();
            console.log(data)
            $.post("Empresas", data, (res, est, que) => {
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
                            $(location).attr('href', "admin.jsp")

                        }
                    }
                }
            })
        }

    })


    $("#formCrearReserva").validate({
        rules: {
            titulo: {
                required: true,
                minlength: 3,
                maxlength: 50
            },
            descripcion: {
                required: true,
                minlength: 3,
                maxlength: 500
            },
            fecha: {
                required: true,
                date: true
            },
            hora: {
                required: true

            },
            duracion: {
                required: true,
                maxlength: 20,
                number: true
            },
            cupos: {
                required: true,
                maxlength: 20,
                number: true
            },
            precio: {
                required: true,
                maxlength: 20,
                number: true
            },
            lugar: {
                required: true,
                maxlength: 20,
                number: true
            },
            categoria: {
                required: true,
                maxlength: 20,
                number: true
            },
            estado: {
                required: true,
                maxlength: 20,

            },

        },
        messages: {

        },
        submitHandler: function (form) {
            const data = $("#formCrearReserva").serialize();

             localStorage.removeItem('img');

            var formData = new FormData(document.getElementById("formCrearReserva"));
            $.ajax({
                url: "Actividad",
                type: 'POST',
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                success: function (result) {
                    if (result == "true") {
                        $("#errorActiv").text("registrado correctamente")
                    } else if (result == "imagentrue") {
                        $("#errorActiv").text("se publico pero no cargaron las imagenes")
                    } else {
                        $("#errorActiv").text("hubo un fallo *--*")
                    }
                }
            });


        }
    })



    $("#formCategora").validate({
        rules: {

            nombres: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
        },
        messages: {

        },
        submitHandler: function (form) {
            const data = $("#formCategora").serialize();

            $.post("Categoria", data, (res, est, que) => {
                console.log("llega")
                if (res == "false") {

                    $("#errorCat").text("error *-*");

                } else {

                    $("#errorCat").text("registro exitoso");
                    alert("la página tendra que ser recargada para guardar cambios")
                    

                }
            })
        }
    })



    $("#formLugar").validate({
        rules: {
            txtAddress: {
                required: true,
                minlength: 3,
                maxlength: 20
            }, txtZone: {
                required: true,
                minlength: 3,
                maxlength: 20
            }, txtQuantity: {
                required: true,
                number: true
            },

        },
        messages: {

        },
        submitHandler: function (form) {
            const data = $("#formLugar").serialize();

            $.post("Lugar", data, (res, est, que) => {
                console.log(res)
                if (res == "false") {

                    $("#errLugar").text("error *-*");

                } else {

                    $("#errLugar").text("registro exitosos");
                    alert("la página tendra que ser recargada para guardar cambios")
                   

                }
            })
        }
    })

    $("#EmpresaLogo").validate({

        rules: {
            nomLogo: {required : true}
        },
        messages:{
            nomLogo: {
                required: "por por favor seleccione una imagen"
            }
        },
        submitHandler: function (form) {
            $("#EmpresaLogo").serialize();
            var formData = new FormData(document.getElementById("EmpresaLogo"));
            $.ajax({
                url: "Empresas",
                type: 'POST',
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                success: function (result) {
                    
                    if (result == "true") {
                        $("#errorCarga").text("registrado correctamente")
                    } else {
                        $("#errorCarga").text("no se pudo guardar")
                    }

                }
            });
        }
    })
});