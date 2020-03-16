alert("holas")
//function cargar(){
//    const file = document.getElementById("imagen").files[0];
//   
//    const c = file.name;
//    docucument.form.target = "ifarame";
////    docucument.form.action = "";
//
//}


$(window).load(function(){

 $(function() {
  $('#imagen').change(function(e) {
      addImage(e); 
     });

     function addImage(e){
      var file = e.target.files[0],
      imageType = /image.*/;
      const c = file.name;
      $("#name").val(c);
      console.log("name ",c)
    
      if (!file.type.match(imageType))
       return;
  
      var reader = new FileReader();
  
      reader.onload = function(e){
         var result=e.target.result;
         console.log(result)
        $('#imgSalida').attr("src",result);
      }
       
      reader.readAsDataURL(file);
     }
    });
  });












