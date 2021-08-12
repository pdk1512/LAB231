<%-- 
    Document   : ManageQuiz
    Created on : Jun 23, 2021, 2:06:44 AM
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
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="main">
                <div class="content">
                    <div class="welcome">
                    Number of questions: <span style="color: blue;">${numOfQues}</span><br>
                </div>
                <div class="ques-detail">
                    <table>
                        <tr>
                            <td style="color: blue;">Question</td>
                            <td style="color: blue;">Date Created</td>
                        </tr>
                        <c:forEach items="${listQues}" var="q">
                        <tr>
                            <td>${q.question}</td>
                            <td>${q.dateCreated}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                </div>
            </div>
        </div>
    </body>

</html>

