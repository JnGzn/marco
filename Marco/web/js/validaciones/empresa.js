

$(function () {

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


//            $.post("Actividad", data, (res, est, que) => {
//
//                if (res == "imagen") {
//                    $("#error").text("actividad creanda <br> no se pudo cargan image");
//                }
//                if (res == "false") {
//
//                    $("#error").text("hubo un error *_*");
//
//                } else {
//                    $("#error").text("registro exitoso");
////                    $("#formCrearReserva").clearFields();
//
//                }
//            })



            var formData = new FormData(document.getElementById("formCrearReserva"));
            $.ajax({
                url:"Actividad",
                type: 'POST',
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                success: function (result) {
                    if (result == "true") {
                        $("#errorActiv").text("registrado correctamente")
                    } else if(result == "imagentrue"){
                       $("#errorActiv").text("se publico pero no cargaron las imagenes")
                    }else{
                        $("#errorActiv").text("hubo un fallo *-*")
                    }
                }
            });


        }
    })

});