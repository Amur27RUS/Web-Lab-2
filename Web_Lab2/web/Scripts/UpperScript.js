
document.getElementById("Y").addEventListener("click", checkY());
var xCheck = false;
var yCheck = false;
var rCheck = false;


function checktoradioR(){

    inputs= document.getElementsByClassName("input2");
    rCheck = true;

    unlockButton();

    for (var i=0; i<inputs.length; i++){
        inputs[i].onchange= function () {
            inputs=document.getElementsByClassName("input2");
            for(var i=0;i<inputs.length;i++){
                inputs[i].checked = false;
            }
            this.checked = true;
        }
    }
}

function checkY() {
    let err = document.getElementById("err2");
    let Y = this.Y.value;

    if (Y>=5) {
        err.hidden = false;
        err.innerText = "Need to be < 5";
        yCheck = false;
        unlockButton();

    }else if (Y === ""){
        err.hidden = false;
        err.innerText = "Enter Y";
        yCheck = false;
        unlockButton();

    }else if (Y<=-5){
        err.hidden = false;
        err.innerText = "Need to be > -5";
        yCheck=false;
        unlockButton();

    }else if (Y>-5 && Y<5){
        err.hidden = true;
        yCheck=true;
        unlockButton();

    }else if (isNaN(Y)) {
        err.hidden = false;
        err.innerText = "Only numbers!";
        yCheck = false;
        unlockButton();

    }

}

function checkR() {
    let err = document.getElementById("err3");
    let R = this.R.value;

    if (R>=5) {
        err.hidden = false;
        err.innerText = "Need to be < 5";
        rCheck = false;
        unlockButton();

    }else if (R === ""){
        err.hidden = false;
        err.innerText = "Enter R";
        rCheck = false;
        unlockButton();

    }else if (R<=2){
        err.hidden = false;
        err.innerText = "Need to be > 2";
        rCheck=false;
        unlockButton();

    }else if (R>2 && R<5){
        err.hidden = true;
        rCheck=true;
        unlockButton();

    }else if (isNaN(R)) {
        err.hidden = false;
        err.innerText = "Only numbers!";
        rCheck = false;
        unlockButton();

    }

}

function validate(_form){

    let X = -20;
    let R = _form.R.value;
    let Y = _form.Y.value;

    let xs = document.forms["main-form"]["X"];

    for (let i of xs){
        if (i.checked){
            X = i.value;
        }
    }


    if ((Y !== "") && R !== -20 && X !== -20) {
        makeFrame("result_frame");
        createCanvas('canvas', X, Y, R);
        return true;
    }
}

function checkX(){
    let err = document.getElementById("err1");
    let count = 0;
    let inputs = document.forms["main-form"]["X"];

    for (let i of inputs) {
        if (i.checked) {
            count += 1;
        }
    }

    if (count >= 1){
        err.hidden = true;
        xCheck = true;
        unlockButton();

    }else{
        xCheck = false;
        err.hidden = false;
        unlockButton();
    }
}   //нужен для того, чтобы выводить множественные значения X

function checktoradioX(){
    inputs= document.getElementsByClassName("input1");
    xCheck = true;

    unlockButton();

    for (var i=0; i<inputs.length; i++){
        inputs[i].onchange= function () {
            inputs=document.getElementsByClassName("input1");
            for(var i=0;i<inputs.length;i++){
                inputs[i].checked = false;
            }
            this.checked = true;
        }
    }
}   //нужен для того, чтобы можно было выбрать ТОЛЬКО ОДИН x. ДОДЕЛАТЬ ЕГО

function makeFrame(id){
    var iframe = document.getElementById(id);
    iframe.style.display="block";
    frameFitting(id);
    for (var i=0; i<iframe.length; i++) {
        iframe[i].onclick = function() {
            clearInterval(timeout);
            timeout = setInterval("frameFitting(id)",100);
        }
    }
}

function frameFitting(id) {
    document.getElementById(id).width = '100%';
    document.getElementById(id).height = document.getElementById(id).contentWindow.
        document.body.scrollHeight+35+'px';
}

function unlockButton(){
    var btn = document.getElementById("button");
    btn.disabled = !(yCheck === true && rCheck === true && xCheck === true);
}
