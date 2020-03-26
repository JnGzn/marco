/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




    let hid = localStorage.getItem('hide')
$(function () { 
    
 
    if ( hid == "true") {
       console.log("inter")
        document.getElementById("inicio").setAttribute('hidden', true);
        document.getElementById("busqu").removeAttribute('hidden'); 
    }
  
   
    $("#busqueda").click(() => {

        localStorage.setItem('hide',"true")
        
        location.reload();
    })
    $("#limpiar").click(() => {
       
        document.getElementById("busqu").setAttribute('hidden', true);
        document.getElementById("inicio").removeAttribute('hidden');
        localStorage.setItem('hide',"false")
    })
})