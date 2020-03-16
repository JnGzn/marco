$("#calcular").click(function calcularPrecio() {
    
    var precio = document.getElementById("ctxPrecioTotal").value;
    var cantidad = document.getElementById("ctxCupos").value;
    document.getElementById('resultado').innerHTML = precio * cantidad;
    
})
