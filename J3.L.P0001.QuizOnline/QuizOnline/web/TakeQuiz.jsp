<%-- 
    Document   : TakeQuiz
    Created on : Jun 23, 2021, 11:59:14 AM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>My Quiz</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>
            function checkEmpty() {
                var quesField = document.forms["takeQuizForm"]["numOfQues"].value;
                if (quesField == "") {
                    alert("Please input number of questions!");
                    return false;
                } else if (isNaN(parseInt(quesField))) {
                    alert("Please input an integer to take number of questions!");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="content">
                        <div class="welcome">
                            Welcome <span style="color: blue;">${sessionScope.acc.userName}</span><br>
                    </div>
                    <div class="title">Enter number of questions:</div> 
                    <div style="color: red">${alert}</div>
                    <form action="takequiz" name="takeQuizForm" onsubmit="return checkEmpty()">
                        <input type="text" style="width: 80px;" name="numOfQues">
                        <nav><input type="submit" value="Start"></nav>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
