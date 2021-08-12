<%-- 
    Document   : Home
    Created on : Jun 30, 2021, 11:45:09 AM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>News Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div class="container">
            <div class="preheader"></div>
            <div class="header">
                <h3>My Digital News</h3>
            </div>
            <div class="menu">
                <a href="home">News</a>
            </div>
            <div class="content">
                <div class="left">
                    <div class="title">
                        ${newDisplay.title}
                    </div>
                    <div class="image">
                        <img src="${newDisplay.image}" />
                    </div>
                    <div class="description">
                        ${newDisplay.description}
                    </div>
                    <div class="info">
                        <div class="comment"></div>
                        <div class="timeicon"></div>
                        By ${newDisplay.author} | ${newDisplay.datePost}
                    </div>
                </div>
                <jsp:include page="Right.jsp"></jsp:include>
            </div>
            <div class="footer"></div>
        </div>
    </body>

</html>
