//seguir → siguiendo
window.onload = function() {
    let siguiendo = document.querySelector('#siguiendo');
    let seguir = document.querySelector('#seguir');
    

    seguir.addEventListener('click', function(){
        siguiendo.style.display = "block";
        seguir.style.display = "none"; 
    });
};
