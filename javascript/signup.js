var pass = document.getElementsByName("pwd");
var redcheck = document.getElementsByClassName("redcheck");

function uidcheck() {
    var id = document.getElementById("user_id");
    if(id.value.length < 6 || id.value.length > 15){
        redcheck[0].style.display = "block";
        id.focus();
        id.select();
    }
    else{
        redcheck[0].style.display = "none";
    }
}

function pass1(){
    // alert('onblur 실행됨');
    if(pass[0].value.length < 8 || pass[0].value.length > 15){
        redcheck[1].style.display = "block";
        pass[0].focus();
        pass[0].select();
    }
    else{
        redcheck[1].style.display = "none";
    }
}

function pass2(){
    if(pass[0].value == pass[1].value){
        redcheck[2].style.display = "none";
    }
    else{
        redcheck[2].style.display = "block";
        pass[1].focus();
        pass[1].select();
    }
}