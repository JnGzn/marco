
$(function (){
   
    $("#formLogin").validate({
        rules: {
            confirmaCorreo: {
                required: true
            }
        },
        messages:{
            confirmaCorreo: {
                required: "este campo es obligatorio"
            }
        },
        submitHandler: function(form){
            const data = $("#formLogin").serialize();
            $.post("Usuario",data,(res, est, que)=>{
                console.log(res);
                if (res == "false") {
                    console.log("entra")
                    $("#pass").val("");
                    $("#err").text("usuario o contraseña erroneo");
                }
            })
        }
    })
    
    
    $("#formSign").validate({
        rules: {
            confirmaCorreo: {
                required: true
            }
        },
        messages:{
            confirmaCorreo: {
                required: "este campo es obligatorio"
            }
        },
        submitHandler: function(form){
            const data = $("#formLogin").serialize();
            $.post("Usuario",data,(res, est, que)=>{
                console.log(res);
                if (res == "false") {
                    console.log("entra")
                    $("#pass").val("");
                    $("#err").text("usuario o contraseña erroneo");
                }
            })
        }
    })
}) 