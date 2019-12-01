<%@ page import="java.util.List" %>
<%@ page import="model.Dots" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: andreyklyuev
  Date: 2019-10-21
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <jsp:useBean id="history" class="beans.History" scope="session" />
  <meta charset="UTF-8">
  <title>Lab_2</title>

  <link rel="icon" href="Utils/Logo.png">

<%--  <link rel="stylesheet" type="text/css" href="Styles/main.css"> --%>
  <style type="text/css">
    body{
      background-image: url("Utils/background22.jpg");
      background-size: 108%;
      background-attachment: fixed;
      background-repeat: repeat;
      margin: 0px;
    }

    div{
      margin: 0px;
      border: #4bb6a7;
    }

    #myname {
      color: aqua;
    }

    .container{
      width: 725px;
      margin-left: auto;
      margin-right: auto;
      border-radius: 3px;
      background-color: #282c34;
      font-size: 20px;
      font-family: cursive;
      color: #4bb6a7;
      padding: 1em 0;
      text-align: center;
      margin-bottom: 0px;
      margin-top: 6px
    }

    .header{
      width: 1050px;
      margin-top: 0;
      margin-bottom: 10px;
    }

    .left{
      float: left;
      padding-left: 20px;
    }

    .center{
      text-align: center;

    }

    .right{
      float: right;
      padding-right: 20px;
    }

    span[class="left"]{
      color: #4bb6a7;
    }

    .task_image{
      border-radius: 5px;
      margin: 10px;
    }

    th, td{
      border: 2px solid #4bb6a7;
      padding: 5px;
    }

    table {
      border-collapse: collapse;
      margin: auto;
      border-spacing: 0;
      border: 0px;
    }

    input {
      margin: 7px;
      border-radius: 3px;
      height: 15px;
    }

    .inputs {
      display: inline-block;

    }


    .tableblockl{

      float: left;
      margin-left: 25px;
    }

    .textblockr{

      float: right;
      margin-right: 80px;
      margin-top: 50px;
    }

    .main{
      position: relative;
      height: 300px;

    }

    .textblock {

      margin-top:7%;
      position: absolute;
      left: 50%;
      transform: translate(-50%);
    }

    .buttoner{
      height: 60px;
      margin-top: 90px;
      position: absolute;
      left: 50%;
      transform: translate(-50%);
      background: unset;
    }

    .footer{
      margin-bottom: 0px;
    }


    .submit {
      font-size: 70%;
      height: 30px;
    }

    div table {
      margin-top: 4px;
      color: #4bb6a7;
    }


    .error {
      font-family: Arial;
      color: firebrick;
      margin-top: 4px;
      font-size: 15px;
    }

    .submit-button{
      margin-top: 20px;
      border-radius: 10px;
      border: 2px solid #4bb6a7;
      background: #d7d7d7;
      font-family: cursive;
      height: 44px;
      width: 95px;
      font-size: 15px;
      cursor: pointer;
      text-decoration: none;
      transition-duration: 0.4s;
    }
    .submit-button:hover{
      background: #4bb6a7;
      color: white;
    }

    .submit-button:hover:disabled {
      background: #d7d7d7;
      color: grey;
    }

  </style>

  <script>
    document.getElementById("Y").addEventListener("click", checkY());
    var xCheck = false;
    var yCheck = false;
    var rCheck = false;


    //Чекбоксы R превращатся в радио.(Можно кликнуть на один чекбокс)
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

    //Проверка, введён ли Y и правильно ли
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
        if(Y.length >=18){
          //err.hidden = false;
          //err.innerText = "May cause problems";
          yCheck=true;
          unlockButton();
        }else{
          err.hidden = true;
          yCheck=true;
          unlockButton();
        }

      }else if (isNaN(Y)) {
        err.hidden = false;
        err.innerText = "Only numbers!";
        yCheck = false;
        unlockButton();

      }
    }

    //Проверка, введён ли R и правильно ли
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
        if(R.length >=18) {
          //err.hidden = false;
          //err.innerText = "May cause problems";
          rCheck = true;
          unlockButton();
        }else {
          err.hidden = true;
          rCheck = true;
          unlockButton();
        }

      }else if (isNaN(R)) {
        err.hidden = false;
        err.innerText = "Only numbers!";
        rCheck = false;
        unlockButton();

      }
    }

    //срабатывает при нажатии на кнопку. Собирает все данные с ввода
    function validate(_form){
      let X = -20;
      let R = _form.R.value;
      let Y = _form.Y.value;

      localStorage.setItem("R", R);

      let xs = document.forms["main-form"]["X"];

      for (let i of xs){
        if (i.checked){
          X = i.value;
        }
      }

      if ((Y !== "") && R !== -20 && X !== -20) {
        makeFrame("result_frame");
        return true;
      }
    }
    //Проверка, введён ли X и правильно ли
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
    }

    //Превращает чекбоксы X  в радио.
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
    }

    //Создаёт iFrame (м б убрать)
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

    //фитинг для iFrame
    function frameFitting(id) {
      document.getElementById(id).width = '100%';
      document.getElementById(id).height = document.getElementById(id).contentWindow.
              document.body.scrollHeight+35+'px';
    }

    //Провераяет, можно ли разблокировать кнопку
    function unlockButton(){
      var btn = document.getElementById("button");
      btn.disabled = !(yCheck === true && rCheck === true && xCheck === true);
    }

  </script>

</head>
<body>

<!--HEADER:-->
<div class="header container">
  <span class="left">Group P3214</span>
  <span class="center" id="myname">Andrey Klyuev</span>
  <span class="right">Var: 215720</span>
</div>

<!--MAIN CONTAINER-->
<div class="main container">

  <!--SEND TO SERVLET-->
  <form class="form" id="main-form" action="controller" method="post" onsubmit="validate(this);" target="_self">
    <p style="margin-top: 0px;" id="text">Программа посчитает попадание точки в график. Вам нужно задать значение координат X, Y и R.
      Также можно задать R и нажать на график.</p>
    <HR color="gray">

    <!--TABLE FOR X-->
    <div class="tableblockl">
      <table border="3" align="center">
        <tr>
          <td></td><td><input class="input1" type="checkbox" id="x1" value="-2" name="X" onchange="checktoradioX()">-2</td>
          <td><input class="input1" type="checkbox" id="x2" value="-1.5" name="X" onchange="checktoradioX()">-1.5</td>
          <td><input class="input1" type="checkbox" id="x3" value="-1" name="X" onchange="checktoradioX()">-1</td>

        </tr>

        <tr>
          <td>X =</td><td><input class="input1" type="checkbox" id="x4" value="-0.5" name="X" onchange="checktoradioX()">-0.5</td>
          <td><input class="input1" type="checkbox" id="x5" value="0" name="X" onchange="checktoradioX()">0</td>
          <td><input class="input1" type="checkbox" id="x6" value="0.5" name="X" onchange="checktoradioX()">0.5</td>
        </tr>

        <tr>
          <td></td><td><input class="input1" type="checkbox" id="x7" value="1" name="X" onchange="checktoradioX()">1</td>
          <td><input class="input1" type="checkbox" id="x8" value="1.5" name="X" onchange="checktoradioX()">1.5</td>
          <td><input class="input1" type="checkbox" id="x9" value="2" name="X" onchange="checktoradioX()">2</td>
        </tr>
      </table>
      <p id="err1" class="error" hidden= true>Choose X</p>
    </div>

    <!--INPUT Y BLOCK-->
    <div class="textblock">
      <input type="hidden" name="offset">
      <input type="hidden" name="Type" value="noAjax">

      <label for="Y" class="inputs">Y = </label>
      <input class="inputs" type="text" id="Y" name="Y" placeholder="(-5..5)" size="6" pattern="((0|-?[1-4])(\.[0-9]*[1-9]+)?)|(5|-5)" onkeyup="checkY()" >
      <p id="err2" class="error" hidden = true>Enter Y</p>
    </div>

    <!--INPUT R BLOCK-->
    <div class="textblockr">
  <label for="R" class="inputs">R = </label>
  <input class="inputs" type="text" id="R" name="R" placeholder="(2..5)" size="6" pattern="((0|-?[1-4])(\.[0-9]*[1-9]+)?)|(5|-5)" onkeyup="checkR(); drawFigures()" >
  <p id="err3" class="error" hidden = true>Enter R</p>
    </div>

    <br>

    <!--SUBMIT BUTTON-->
    <div class="buttoner container" >
      <button class="submit-button" name="submit" type="submit" id="button" disabled=true>CHECK</button>
    </div>
  </form>
</div>

<!--CANVAS BLOCK-->
<div class="canvas container">
  <form action="controller" method="get" id="hiddenForm">
    <input type="hidden" id="hiddenX" name="X" value="">
    <input type="hidden" id="hiddenY" name="Y" value="">
    <input type="hidden" id="hiddenR" name="R" value="">
    <input type="hidden"name="Type" value="Ajax">
    <input type="hidden" name="offset">
  </form>
  <canvas id="canvas" style="background-color:#ffffff; border-radius: 20px;"
          width="300" height="300"></canvas>
  <p id="err4" class="error" hidden = true>Enter R first!</p>

  <script>

    let offsetField = document.forms["main-form"]["offset"];
    let offsetField2 = document.forms["hiddenForm"]["offset"];
    let RField = document.getElementById("R");
    RField.value = localStorage.getItem("R");

    //if нужен для того, чтобы после перезапуска страницы с уже введённым R, пользователю нужно было только ввести X и Y,
    //а не записывать X, Y и перезаписывать R.
    if (localStorage.getItem("R") > 2 && localStorage.getItem("R") < 5){
      rCheck = true;
    }


    localStorage.clear();

    let canvas = document.getElementById("canvas");
    context = canvas.getContext("2d");
    canvas.addEventListener("click", handleCanvasClick);
    offsetField.value = new Date().getTimezoneOffset();
    offsetField2.value = new Date().getTimezoneOffset();





    //ОТРИСОВКА ОДНОЙ ТОЧКИ НА КАРТЕ
    function drawDot(x, y, color) {
      let i = 25;
      context.fillStyle = color;
      context.beginPath();
      context.arc(canvas.width/2+x*i,canvas.height/2-y*i,2,0,Math.PI*2, true);
      context.fill();
    }

   //ОТРИСОВКА ВСЕХ ТОЧЕК, ЕСЛИ НА СТРАНИЦЕ ЕСТЬ ТАБЛИЦА С ИСТОРИЕЙ
    function drawAllDots() {
      let R = document.getElementById("R");
      let r = R.value;
      let table = document.getElementById("result-table");
      let historyX = document.getElementsByClassName("historyX");
      let historyY = document.getElementsByClassName("historyY");
      let historyR = document.getElementsByClassName("historyR");
      let historyResult = document.getElementsByClassName("historyResult");

      for(let i=0; i<historyX.length; i++){

          drawDot(Number(historyX[i].innerHTML), Number(historyY[i].innerHTML), (((Number(historyX[i].innerHTML)) <=0
                  && (Number(historyY[i].innerHTML))>=0 && (Number(historyX[i].innerHTML))>=-r/2
                  && (Number(historyY[i].innerHTML))<=r)
                  || ((Number(historyX[i].innerHTML))>=0 && (Number(historyY[i].innerHTML))<=0
                          && (Number(historyX[i].innerHTML))*(Number(historyX[i].innerHTML))+(Number(historyY[i].innerHTML))*(Number(historyY[i].innerHTML))<=r/2*r/2)
                  || ((Number(historyX[i].innerHTML))>=0 && (Number(historyY[i].innerHTML))>=0
                          && (Number(historyY[i].innerHTML))<=(r/2-(Number(historyX[i].innerHTML)))))  ? "lime":"red");
      }
    }
    drawGraph();



    //Делает AJAX запрос при нажатии на канвас
    function doAjax(x, y, r){

      let req = new XMLHttpRequest();
      req.open("POST", document.documentURI +"checkservlet", true);
      console.log(req.responseText);
      req.onload = ()=>changePage(JSON.parse(req.responseText));
      req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      req.send("X="+x+"&Y="+y+"&R="+r+"&offset="+offsetField.value+"&Type='Ajax'");

    }


    //ОБРАБОТКА НАЖАТИЯ НА CANVAS
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

        doAjax(x, y, r);

        let form = document.getElementById("hiddenForm");
        document.getElementById("hiddenX").value = x;
        document.getElementById("hiddenY").value = y;
        document.getElementById("hiddenR").value = r;
        // form.submit();



      }else{
        err.hidden = false;
      }
    }

    //ОТРИСОВКА ОСЕЙ ГРАФИКА ПРИ ВХОДЕ НА СТРАНИЦУ
    function drawGraph() {

      //очистка
      context.clearRect(0, 0, canvas.width, canvas.height);
      drawAllDots();

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

      // деления Y
      context.moveTo(145, 25); context.lineTo(155, 25); context.fillText("5", 160, 25);
      context.moveTo(145, 50); context.lineTo(155, 50); context.fillText("4", 160, 50);
      context.moveTo(145, 75); context.lineTo(155, 75); context.fillText("3", 160, 75);
      context.moveTo(145, 100); context.lineTo(155, 100); context.fillText("2", 160, 100);
      context.moveTo(145, 125); context.lineTo(155, 125); context.fillText("1", 160, 125);

      context.moveTo(145, 175); context.lineTo(155, 175); context.fillText("-1", 130, 180);
      context.moveTo(145, 200); context.lineTo(155, 200); context.fillText("-2", 130, 200);
      context.moveTo(145, 225); context.lineTo(155, 225); context.fillText("-3", 130, 225);
      context.moveTo(145, 250); context.lineTo(155, 250); context.fillText("-4", 130, 250);
      context.moveTo(145, 275); context.lineTo(155, 275); context.fillText("-5", 130, 275);

      // деления X
      context.moveTo(25, 145); context.lineTo(25, 155); context.fillText("-5", 25, 170);
      context.moveTo(50, 145); context.lineTo(50, 155); context.fillText("-4", 50, 170);
      context.moveTo(75, 145); context.lineTo(75, 155); context.fillText("-3", 75, 170);
      context.moveTo(100, 145); context.lineTo(100, 155); context.fillText("-2", 100, 170);
      context.moveTo(125, 145); context.lineTo(125, 155); context.fillText("-1", 125, 170);

      context.moveTo(175, 145); context.lineTo(175, 155); context.fillText("1", 175, 170);
      context.moveTo(200, 145); context.lineTo(200, 155); context.fillText("2", 200, 170);
      context.moveTo(225, 145); context.lineTo(225, 155); context.fillText("3", 225, 170);
      context.moveTo(250, 145); context.lineTo(250, 155); context.fillText("4", 250, 170);
      context.moveTo(275, 145); context.lineTo(275, 155); context.fillText("5", 275, 170);

      context.closePath();
      context.strokeStyle = "black";
      context.fillStyle = "black";
      context.stroke();
    }


    //ОТРИСОВКА ФИГУР НА ГРАФИКЕ, ЕСЛИ ВВЕДЁН R
    function drawFigures() {
      let R = document.getElementById("R");
      let r = R.value;
      let rPix = r * 25;
      let r2Pix = rPix / 2;

      if (r > 2 && r < 5) {

        context.clearRect(0, 0, canvas.width, canvas.height);

        //ПРЯМОУГОЛЬНИК
        context.beginPath();
        context.rect(150 - r2Pix, 150 - rPix, r2Pix, rPix);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //СЕКТОР
        context.beginPath();
        context.moveTo(150, 150);
        context.arc(150, 150, r2Pix, (5 * Math.PI) / 2, 2 * Math.PI, true);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //ТРЕУГОЛЬНИК
        context.beginPath();
        context.moveTo(150, 150);
        context.lineTo(150, 150 - r2Pix);
        context.lineTo(150 + r2Pix, 150);
        context.lineTo(150, 150);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //ОСИ
        context.beginPath();
        context.font = "10px Verdana";
        context.moveTo(150, 0);
        context.lineTo(150, 300);
        context.moveTo(150, 0);
        context.lineTo(145, 15);
        context.moveTo(150, 0);
        context.lineTo(155, 15);
        context.fillText("Y", 160, 10);
        context.moveTo(0, 150);
        context.lineTo(300, 150);
        context.moveTo(300, 150);
        context.lineTo(285, 145);
        context.moveTo(300, 150);
        context.lineTo(285, 155);
        context.fillText("X", 290, 135);

        context.moveTo(145, 25); context.lineTo(155, 25); context.fillText("5", 160, 25);
        context.moveTo(145, 50); context.lineTo(155, 50); context.fillText("4", 160, 50);
        context.moveTo(145, 75); context.lineTo(155, 75); context.fillText("3", 160, 75);
        context.moveTo(145, 100); context.lineTo(155, 100); context.fillText("2", 160, 100);
        context.moveTo(145, 125); context.lineTo(155, 125); context.fillText("1", 160, 125);

        context.moveTo(145, 175); context.lineTo(155, 175); context.fillText("-1", 130, 180);
        context.moveTo(145, 200); context.lineTo(155, 200); context.fillText("-2", 130, 200);
        context.moveTo(145, 225); context.lineTo(155, 225); context.fillText("-3", 130, 225);
        context.moveTo(145, 250); context.lineTo(155, 250); context.fillText("-4", 130, 250);
        context.moveTo(145, 275); context.lineTo(155, 275); context.fillText("-5", 130, 275);

        // деления X
        context.moveTo(25, 145); context.lineTo(25, 155); context.fillText("-5", 25, 170);
        context.moveTo(50, 145); context.lineTo(50, 155); context.fillText("-4", 50, 170);
        context.moveTo(75, 145); context.lineTo(75, 155); context.fillText("-3", 75, 170);
        context.moveTo(100, 145); context.lineTo(100, 155); context.fillText("-2", 100, 170);
        context.moveTo(125, 145); context.lineTo(125, 155); context.fillText("-1", 125, 170);

        context.moveTo(175, 145); context.lineTo(175, 155); context.fillText("1", 175, 170);
        context.moveTo(200, 145); context.lineTo(200, 155); context.fillText("2", 200, 170);
        context.moveTo(225, 145); context.lineTo(225, 155); context.fillText("3", 225, 170);
        context.moveTo(250, 145); context.lineTo(250, 155); context.fillText("4", 250, 170);
        context.moveTo(275, 145); context.lineTo(275, 155); context.fillText("5", 275, 170);

        context.closePath();
        context.strokeStyle = "black";
        context.fillStyle = "black";
        context.stroke();

        drawAllDots();

        //ЕСЛИ R ОЧИЩЕН, ТО УБИРАЮТСЯ И ФИГУРЫ
      }else if(r === ""){
        context.clearRect(0, 0, canvas.width, canvas.height);

        //ПРЯМОУГОЛЬНИК
        context.beginPath();
        context.rect(150 - r2Pix, 150 - rPix, r2Pix, rPix);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //СЕКТОР
        context.beginPath();
        context.moveTo(150, 150);
        context.arc(150, 150, r2Pix, (5 * Math.PI) / 2, 2 * Math.PI, true);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //ТРЕУГОЛЬНИК
        context.beginPath();
        context.moveTo(150, 150);
        context.lineTo(150, 150 - r2Pix);
        context.lineTo(150 + r2Pix, 150);
        context.lineTo(150, 150);
        context.closePath();
        context.strokeStyle = "blue";
        context.fillStyle = "blue";
        context.fill();
        context.stroke();

        //ОСИ
        context.beginPath();
        context.font = "10px Verdana";
        context.moveTo(150, 0);
        context.lineTo(150, 300);
        context.moveTo(150, 0);
        context.lineTo(145, 15);
        context.moveTo(150, 0);
        context.lineTo(155, 15);
        context.fillText("Y", 160, 10);
        context.moveTo(0, 150);
        context.lineTo(300, 150);
        context.moveTo(300, 150);
        context.lineTo(285, 145);
        context.moveTo(300, 150);
        context.lineTo(285, 155);
        context.fillText("X", 290, 135);

        context.moveTo(145, 25); context.lineTo(155, 25); context.fillText("5", 160, 25);
        context.moveTo(145, 50); context.lineTo(155, 50); context.fillText("4", 160, 50);
        context.moveTo(145, 75); context.lineTo(155, 75); context.fillText("3", 160, 75);
        context.moveTo(145, 100); context.lineTo(155, 100); context.fillText("2", 160, 100);
        context.moveTo(145, 125); context.lineTo(155, 125); context.fillText("1", 160, 125);

        context.moveTo(145, 175); context.lineTo(155, 175); context.fillText("-1", 130, 180);
        context.moveTo(145, 200); context.lineTo(155, 200); context.fillText("-2", 130, 200);
        context.moveTo(145, 225); context.lineTo(155, 225); context.fillText("-3", 130, 225);
        context.moveTo(145, 250); context.lineTo(155, 250); context.fillText("-4", 130, 250);
        context.moveTo(145, 275); context.lineTo(155, 275); context.fillText("-5", 130, 275);

        // деления X
        context.moveTo(25, 145); context.lineTo(25, 155); context.fillText("-5", 25, 170);
        context.moveTo(50, 145); context.lineTo(50, 155); context.fillText("-4", 50, 170);
        context.moveTo(75, 145); context.lineTo(75, 155); context.fillText("-3", 75, 170);
        context.moveTo(100, 145); context.lineTo(100, 155); context.fillText("-2", 100, 170);
        context.moveTo(125, 145); context.lineTo(125, 155); context.fillText("-1", 125, 170);

        context.moveTo(175, 145); context.lineTo(175, 155); context.fillText("1", 175, 170);
        context.moveTo(200, 145); context.lineTo(200, 155); context.fillText("2", 200, 170);
        context.moveTo(225, 145); context.lineTo(225, 155); context.fillText("3", 225, 170);
        context.moveTo(250, 145); context.lineTo(250, 155); context.fillText("4", 250, 170);
        context.moveTo(275, 145); context.lineTo(275, 155); context.fillText("5", 275, 170);

        context.closePath();
        context.strokeStyle = "black";
        context.fillStyle = "black";
        context.stroke();

        drawAllDots();

      }
    }

  </script>

</div>

<!--RESULT BLOCK-->
<div class="container">

    <h2 style="text-align: center; margin-top: 10px">History:</h2>
    <HR color="#4bb6a7" width="400px">


  <table id="result-table">
    <tr id="table-headers"><th>X</th><th>Y</th><th>R</th><th>Result</th><th>Time</th></tr>

<%--    Проверяем, если элементов в истории > 0, то показываем таблицу с историей--%>
    <%
      List<Dots> list = new ArrayList<Dots>(history.getList());%>
      <%if(list.size() > 0){
        Collections.reverse(list);
    %>


    <%for(Dots d : list){%>
    <tr>
      <td class="historyX"><%=d.getX()%></td>
      <td class="historyY"><%=d.getY()%></td>
      <td class="historyR"><%=d.getR()%></td>
      <td class="historyResult"><%=d.isInArea()%></td>
      <td><%=d.getTime()%></td>
    </tr>
    <%}%>
    <%}%>
  </table>

  <script>
    drawFigures();
    drawAllDots();

    //Функция строит таблицу для AJAX запроса, а также ставит точку ну или же...
    //...добавляет элемент в таблицу с историей при нажатии на канвас
    function changePage(dot){
      let R = document.getElementById("R");
      let r = R.value;
      let color = "";
      let result;

      if(((dot.x <=0 && dot.y>=0 && dot.x>=-r/2 && dot.y<=r) || (dot.x>=0 && dot.y<=0
              && dot.x*dot.x+dot.y*dot.y<=r/2*r/2) ||
              (dot.x>=0 && dot.y>=0 && dot.y<=(r/2-dot.x)))){
        color = "lime";
      }else{
        color = "red";
      }
      if (color === "lime"){
        result = "true";
      }else{
        result = "false";
      }


      drawDot(dot.x, dot.y, color);

      if (!document.getElementById("result-table")) {

        let table = document.createElement("table");
        table.id = "result-table";
        let headers = document.createElement("tr");
        headers.id = "table-headers";
        headers.innerHTML = "<th>X</th><th>Y</th><th>R</th><th>RESULT</th><th>TIME</th>";
        document.getElementsByClassName("main")[0].append(table);

        table.append(headers);

      }

      let dotR = dot.r;
      /*Если r=3 или r=4, то добавляем .0 Нужно для  того, чтобы таблица выглядела красиво)
      Когда AJAXом отправляем запрос, то r берётся 3, а когда по кнопке, то 3.0 И чтобы везде были одинаковые числа,
      то мы к 3 или 4 добавляем .0 :)
      */
      if(dot.r === 3 || dot.r === 4){
        dotR = dot.r + ".0";
      }


      let row = document.createElement("tr");
      row = document.getElementById("result-table").insertRow(1);
      row.innerHTML = " <tr><td class=\"historyX\">" + dot.x + "</td><td class=\"historyY\">" + dot.y + "</td><td class=\"historyR\">" + dotR + "</td><td class=\"historyResult\">"+result+"</td><td>" + dot.time + "</td></tr>";


    }

  </script>

</div>

<!--FOOTER:-->
<div class="footer container">
  <span class="left">Lab 2</span>
  <span class="center">2019 y.</span>
  <span class="right">WebProg</span>
</div>

</body>
</html>
