<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Dots" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: andreyklyuev
  Date: 2019-11-05
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>Lab_2</title>
    <link rel="icon" href="Utils/Logo.png">
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

        .main{
            position: relative;
            height: 200px;

        }

        div table {
            margin-top: 4px;
            color: #4bb6a7;
        }
        .submit-button{
            margin-top: 50px;
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

</head>
<body>
<!--HEADER:-->
<div class="header container">
    <span class="left">Group P3214</span>
    <span class="center" id="myname">Andrey Klyuev</span>
    <span class="right">Var: 215720</span>
</div>

<div class="main container">
    <table border="3" align="center">
        <tr>
            <td>X</td><td>Y</td><td>R</td><td>Result</td><td>Time</td>
        </tr>
        <tr>
            <td>${X}</td><td>${Y}</td><td>${R}</td><td>${RESULT}</td><td>${OFFSET}</td>
        </tr>
    </table>

    <form action="index.jsp"><button class="submit-button">GO BACK</button> </form>
</div>

</body>
</html>