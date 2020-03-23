const act =  sessionStorage.getItem("actividad")

function reservar() {
    
    const actividad = document.getElementById("actividad").value
 sessionStorage.setItem('actividad', actividad);
    
    location=("USUARIO_Reserva.jsp?res="+act)
}
function iniciar() {
    const url = location;
    
   
    sessionStorage.setItem('url', url);
    location="USUARIO_IniciarSesion.jsp"
}

