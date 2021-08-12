<%-- 
    Document   : MakeQuiz
    Created on : Jun 23, 2021, 12:38:22 AM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>My Quiz</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>
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
                var quesField = document.forms["makeQuizForm"]["ques"].value;
                var op1Field = document.forms["makeQuizForm"]["op1"].value;
                var op2Field = document.forms["makeQuizForm"]["op2"].value;
                var op3Field = document.forms["makeQuizForm"]["op3"].value;
                var op4Field = document.forms["makeQuizForm"]["op4"].value;
                if (quesField == "") {
                    alert("Please input question");
                    return false;
                } else if (op1Field == "") {
                    alert("Please input option 1");
                    return false;
                } else if (op2Field == "") {
                    alert("Please input option 2");
                    return false;
                } else if (op3Field == "") {
                    alert("Please input option 3");
                    return false;
                } else if (op4Field == "") {
                    alert("Please input option 4");
                    return false;
                } else if(checkOption()){
                    alert("Please tick at least 1 and at most 3 answers!");
                    return false;
                }else {
                    alert("Add successfully!");
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="main">
                <div class="make-quiz">
                    <form action="makequiz" name="makeQuizForm" onsubmit="return checkEmpty()">
                        <table>
                            <tr>
                                <td style="vertical-align: top;">Question: </td>
                                <td><textarea id="question" name="ques"></textarea></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Option 1: </td>
                                <td><textarea id="answer" name="op1"></textarea></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Option 2: </td>
                                <td><textarea id="answer" name="op2"></textarea></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Option 3: </td>
                                <td><textarea id="answer" name="op3"></textarea></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">Option 4: </td>
                                <td><textarea id="answer" name="op4"></textarea></td>
                            </tr>
                            <tr>
                                <td>Answer(s): </td>
                                <td>
                                    <input type="checkbox" class="answer" value="1" name="answers">
                                    <label for="answer1">Option 1</label>
                                    <input type="checkbox" class="answer" value="2" name="answers">
                                    <label for="answer2">Option 2</label>
                                    <input type="checkbox" class="answer" value="3" name="answers">
                                    <label for="answer3">Option 3</label>
                                    <input type="checkbox" class="answer" value="4" name="answers">
                                    <label for="answer4">Option 4</label>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save" style="font-size: large; font-weight: bold;"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>
