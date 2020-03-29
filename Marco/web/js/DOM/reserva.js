const act = sessionStorage.getItem("actividad")
localStorage.removeItem('img');
function reservar() {
    const actividad = document.getElementById("actividad").value
    sessionStorage.setItem('actividad', actividad);
    location = ("USUARIO_Reserva.jsp?res=" + actividad)
}
function iniciar() {
    const url = location;
    sessionStorage.setItem('url', url);
    location = "USUARIO_IniciarSesion.jsp"
}

function carga() {
    let data = localStorage.getItem('img');
    if (!data) {
        data = 1;
    }
    data = parseInt(data);

    const div = document.getElementById("div" + data)

    const div2 = document.getElementById("div" + (data + 1))

    alert(data)
    data++;
    div.setAttribute('hidden', true);
    div2.removeAttribute('hidden');
    if (data < 4) {

        localStorage.setItem('img', data);
    } else {

        localStorage.removeItem('img');
    }
}