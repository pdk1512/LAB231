<%-- 
    Document   : Home
    Created on : Jun 1, 2021, 1:07:04 AM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/857d8a8904.js" crossorigin="anonymous"></script>
        <title>Home</title>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="left">
                        <div class="banner">
                            <img src="${Intro.banner}">
                    </div>
                    <div class="des-banner">
                        ${Intro.description}
                    </div>
                    <div class="content">
                        <ul class="${currentPage==TotalPage?'last-page':''}">
                            <c:forEach items="${ListG}" var="g">
                                <li>
                                    <div class="img">
                                        <img src="${g.avtImage}">
                                    </div>
                                    <h4>
                                        <a href="gallery?gid=${g.id}">View ${g.title}</a>
                                    </h4>
                                    <p>${g.description}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="paging">
                        <c:forEach var="page" begin="1" end="${TotalPage}">
                            <a class="${currentPage==page?'active':''}" href="home?page=${page}">${page}</a>   
                        </c:forEach>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${Intro.about}
                    </div>
                </div>
                <jsp:include page="Right.jsp"></jsp:include>
                </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>

</html>
