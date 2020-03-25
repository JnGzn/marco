

$(function () {
    
    $("#Empresa").validate({
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
                number: true
            }

        },
        messages: {

        },
        submitHandler: function (form) {
            const data = $("#Empresa").serialize();



            var formData = new FormData(document.getElementById("Empresa"));
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
                    } else if (result == "existe") {
                        $("#errorActiv").text("nit ya existente")
                    } else {
                        $("#errorActiv").text("hubo un fallo *-*")
                    }
                }
            });


        }
    })
    
    

    $("#formCrearReserva").validate({
        rules: {
            titulo: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            descripcion: {
                required: true,
                minlength: 3,
                maxlength: 150
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

console.log("aca vamos")

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


                }
            })
        }
    })
});