
//function cargar(){
//    const file = document.getElementById("imagen").files[0];
//   
//    const c = file.name;
//    docucument.form.target = "ifarame";
////    docucument.form.action = "";
//
//}


$(window).load(function () {

    $(function () {

        $('#imagen1').change(function (e) {
            addImage(e,1);
        });

        $('#imagen2').change(function (e) {
            addImage(e,2);
        });

        $('#imagen3').change(function (e) {
            addImage(e,3);
        });

        $('#imagen4').change(function (e) {
            addImage(e,4);
        });
            
             function addImage(e, index) {
            var file = e.target.files[0],
                    imageType = /image.*/;
            const c = file.name;
            $("#name"+index).val(c);
            console.log(c)
            if (!file.type.match(imageType))
                return;
            var reader = new FileReader();
            reader.onload = function (e) {
                var result = e.target.result;
                $('#imgSalida'+index).attr("src", result);
            }
            reader.readAsDataURL(file);
        }
            
        $('#imagenLogo').change(function (e) {
            addImage(e,1);
        });
    });
});












