<%-- 
    Document   : Home
    Created on : Jun 21, 2021, 7:46:15 PM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        Welcome <span style="color: blue;">${sessionScope.acc.userName}</span><br>
                    </div>
                    <div class="welcome">
                        Your email: <span style="color: blue;">${sessionScope.acc.email}</span><br>
                    </div>
                </div>
            </div>
    </body>

</html>
