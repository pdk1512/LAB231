<%-- 
    Document   : DoQuiz
    Created on : Jun 23, 2021, 10:01:31 PM
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
        <script type="text/javascript">
            window.onload = counter;
            function counter()
            {
                minutes = ${minute}
                seconds = ${second};
                countDown();
            }
        </script>
        <script type="text/javascript">
            function countDown() {
                document.getElementById("min").innerHTML = minutes;
                document.getElementById("remain").innerHTML = seconds;
                document.getElementById("minute").value = minutes;
                document.getElementById("second").value = seconds;
                setTimeout("countDown()", 1000);
                if (minutes == 0 && seconds == 0)
                {
                    document.getElementById("timeout").value = 1;
                    document.getElementById("quiz_form").submit();
                } else
                {
                    seconds--;
                    if (seconds == 0 && minutes > 0)
                    {
                        minutes--;
                        seconds = 60;
                    }
                }
            }
            function checkOption(){
                var checkbox = document.getElementsByName("answers");
                var check = 0;
                for(var i = 0; i < checkbox.length; i++){
                    if(checkbox[i].checked)
                        check++;
                }
                if(check == 4 || check == 0)
                    return true;
                else
                    return false;
            }
            function checkEmpty() {
                if(checkOption()){
                    alert("Please tick your answers!");
                    return false;
                }else {
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

                    <form class="question" action="doquiz" id="quiz_form" name="DoQuizForm" onsubmit="return checkEmpty()">
                        <div class="time-remain" style="margin-bottom: 30px">
                            Time remaining:
                            <span id="min" style="color: red;"></span>
                            <span style="color: red;">:</span>
                            <span id="remain" style="color: red;"></span>
                            
                        </div>
                        ${quiz.question}<br>
                        <input type="checkbox" id="checkbox1" value="1" name="answers"> 
                        <label for="checkbox1">${quiz.option1}</label><br>
                        <input type="checkbox" id="checkbox2" value="2" name="answers">
                        <label for="checkbox2">${quiz.option2}</label><br>
                        <input type="checkbox" id="checkbox3" value="3" name="answers"> 
                        <label for="checkbox3">${quiz.option3}</label><br>
                        <input type="checkbox" id="checkbox4" value="4" name="answers"> 
                        <label for="checkbox4">${quiz.option4}</label><br>
                        <input type="hidden" name="question_no" value="${noQuiz}" id="quiz_no"/>
                        <input type="hidden" name="mark" value="${mark}" />
                        <input id="minute" name="minutes" type="hidden" />
                        <input id="second" name="seconds" type="hidden" />
                        <input id="timeout" name="timeOut" type="hidden" value="0"/>
                        <input type="submit" value="${button_text}" style="margin-left: 500px;
                               font-weight: bolder;
                               font-size: 18px">
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>