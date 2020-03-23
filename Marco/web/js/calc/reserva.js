$("#calcular").click(function calcularPrecio() {
    
    var precio = document.getElementById("ctxPrecioTotal").value;
    var cantidad = document.getElementById("ctxCupos").value;
    document.getElementById('resultado').innerHTML = precio * cantidad;
    
})
$("#ctxCupos").change(()=>{
    var precio = document.getElementById("precioUnidad").value;
    var cantidad = document.getElementById("ctxCupos").value;
    $("#resultado").val(cantidad*precio)
    
})