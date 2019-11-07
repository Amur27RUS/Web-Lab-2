let offsetField = document.forms["main-form"]["offset"];
let canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
canvas.addEventListener("click", handleCanvasClick);
offsetField.value = new Date().getTimezoneOffset();

drawGraph();

function handleCanvasClick(event) {
    let err = document.getElementById("err4");
    let i = 25;
    if(rCheck){
        err.hidden = true;

        let obj = event.target;
        let x = Number(((event.pageX - window.pageXOffset - obj.getBoundingClientRect().x - obj.width/2)/i).toFixed(2));
        let y = Number((-(event.pageY - window.pageYOffset - obj.getBoundingClientRect().y - obj.height/2)/i).toFixed(2));
        let R = document.getElementById("R");
        let r = R.value;
        alert(x);
        alert(y);

        if( x>=-3 && x<=5 && y>-5 && y<3){
            doAjax(x,y,r, true);

        }
    }else{

        err.hidden = false;

    }
}

function createCanvas(id, x, y, r) {

    //очистка
    context.clearRect(0, 0, canvas.width, canvas.height);

    // //ПРЯМОУГОЛЬНИК
    // context.beginPath();
    // context.rect(85, 20, 65, 130);
    // context.closePath();
    // context.strokeStyle ="blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();
    //
    // //СЕКТОР
    // context.beginPath();
    // context.moveTo(150, 150);
    // context.arc(150, 150, 65, (5*Math.PI)/2, 2*Math.PI, true);
    // context.closePath();
    // context.strokeStyle = "blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();
    //
    //
    // //ТРЕУГОЛЬНИК
    // context.beginPath();
    // context.moveTo(150, 150);
    // context.lineTo(150, 85);
    // context.lineTo(215, 150);
    // context.lineTo(150, 150);
    // context.closePath();
    // context.strokeStyle = "blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();

    //ОСИ
    context.beginPath();
    context.font = "10px Verdana";
    context.moveTo(150, 0); context.lineTo(150, 300);
    context.moveTo(150, 0); context.lineTo(145, 15);
    context.moveTo(150, 0); context.lineTo(155, 15);
    context.fillText("Y", 160, 10);
    context.moveTo(0, 150); context.lineTo(300, 150);
    context.moveTo(300, 150); context.lineTo(285, 145);
    context.moveTo(300, 150); context.lineTo(285, 155);
    context.fillText("X", 290, 135);

    // деления X
    context.moveTo(145, 20); context.lineTo(155, 20); context.fillText(r, 160, 20);
    context.moveTo(145, 85); context.lineTo(155, 85); context.fillText((r / 2), 160, 78);
    context.moveTo(145, 215); context.lineTo(155, 215); context.fillText(-(r / 2), 160, 215);
    context.moveTo(145, 280); context.lineTo(155, 280); context.fillText(-r, 160, 280);
    // деления Y
    context.moveTo(20, 145); context.lineTo(20, 155); context.fillText(-r, 20, 170);
    context.moveTo(85, 145); context.lineTo(85, 155); context.fillText(-(r / 2), 70, 170);
    context.moveTo(215, 145); context.lineTo(215, 155); context.fillText((r / 2), 215, 170);
    context.moveTo(280, 145); context.lineTo(280, 155); context.fillText(r, 280, 170);

    context.closePath();
    context.strokeStyle = "black";
    context.fillStyle = "black";
    context.stroke();


    //ТОЧКА
    context.beginPath();
    context.rect(Math.round(150 + ((x / r) * 130))-2, Math.round(150 - ((y / r) * 130))-2, 4, 4);
    context.closePath();
    if ((x ==0 && y>=0 && y<=(r/2)) ||
        (y<=0 && y>=-r && x<=0 && x>=(r/2)) ||
        (y==0 && x<=0 && x>=-r) ||
        (x==0 && y>=0 && y<=r) ||
        (y==0 && x>=0 && x<=r/2) ||
        (r==3 && x==1 && y==1) ||
        (x<=0 && y>=0 && x>=(-r/2) && y<=r/2) ||
        (y<=0 && x<=0 && x>=-r/2 && y>=-r)){

        context.strokeStyle = "green";
        context.fillStyle = "green";

    }else{
        context.strokeStyle = "red";
        context.fillStyle = "red";
    }


}
function drawGraph() {

    //очистка
    context.clearRect(0, 0, canvas.width, canvas.height);

    // //ПРЯМОУГОЛЬНИК
    // context.beginPath();
    // context.rect(85, 20, 65, 130);
    // context.closePath();
    // context.strokeStyle ="blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();
    //
    // //СЕКТОР
    // context.beginPath();
    // context.moveTo(150, 150);
    // context.arc(150, 150, 65, (5*Math.PI)/2, 2*Math.PI, true);
    // context.closePath();
    // context.strokeStyle = "blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();
    //
    //
    // //ТРЕУГОЛЬНИК
    // context.beginPath();
    // context.moveTo(150, 150);
    // context.lineTo(150, 85);
    // context.lineTo(215, 150);
    // context.lineTo(150, 150);
    // context.closePath();
    // context.strokeStyle = "blue";
    // context.fillStyle = "blue";
    // context.fill();
    // context.stroke();

    //ОСИ
    context.beginPath();
    context.font = "10px Verdana";
    context.moveTo(150, 0); context.lineTo(150, 300);
    context.moveTo(150, 0); context.lineTo(145, 15);
    context.moveTo(150, 0); context.lineTo(155, 15);
    context.fillText("Y", 160, 10);
    context.moveTo(0, 150); context.lineTo(300, 150);
    context.moveTo(300, 150); context.lineTo(285, 145);
    context.moveTo(300, 150); context.lineTo(285, 155);
    context.fillText("X", 290, 135);

    // деления X
    context.moveTo(145, 20); context.lineTo(155, 20); context.fillText("p", 160, 20);
    context.moveTo(145, 85); context.lineTo(155, 85); context.fillText("R/2", 160, 78);
    context.moveTo(145, 215); context.lineTo(155, 215); context.fillText("-R/2", 130, 215);
    context.moveTo(145, 280); context.lineTo(155, 280); context.fillText("-R", 130, 280);
    // деления Y
    context.moveTo(20, 145); context.lineTo(20, 155); context.fillText("-R", 20, 170);
    context.moveTo(85, 145); context.lineTo(85, 155); context.fillText("-R/2", 70, 170);
    context.moveTo(215, 145); context.lineTo(215, 155); context.fillText("R/2", 215, 170);
    context.moveTo(280, 145); context.lineTo(280, 155); context.fillText("R", 280, 170);

    context.closePath();
    context.strokeStyle = "black";
    context.fillStyle = "black";
    context.stroke();
}

function doAjax(x,y,r, writable) {


}
