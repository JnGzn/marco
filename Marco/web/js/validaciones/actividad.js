

$(function () {
    $("#formEditarReserva").validate({
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
            const data = $("#formEditarReserva").serialize();

             localStorage.removeItem('img');

            var formData = new FormData(document.getElementById("formEditarReserva"));
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

  
});