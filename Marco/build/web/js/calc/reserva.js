$("#calcular").click(function calcularPrecio() {
    alert("fds")
    console.log("No llego :(")

    var precio = document.getElementById("ctxPrecioTotal").value;
    var cantidad = document.getElementById("ctxCupos").value;


    document.getElementById('resultado').innerHTML = precio * cantidad;
    alert((precio * cantidad) / 8)
})
