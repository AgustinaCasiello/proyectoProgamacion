window.onload = function(){
    function callMe() {
        this.seguir = "siguiendo";
    }
    document.getElementsByClassName("seguir").onclick = callMe;
}

