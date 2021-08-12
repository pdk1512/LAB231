<%-- 
    Document   : Result
    Created on : Jun 24, 2021, 11:30:01 PM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        Your score <span style="color: ${result == 'Passed'? 'Blue' : 'Red'};">${mark} (${percent}%) - ${result}</span><br>
                    </div>
                    <form class="title" action="doquiz" method="post">
                        Take another test 
                        <input type="submit" value="Start" style="font-size: large; font-weight: bold;">
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
