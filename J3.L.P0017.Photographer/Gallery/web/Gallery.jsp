<%-- 
    Document   : Gallery
    Created on : Jun 2, 2021, 10:22:39 AM
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
        <title>My Gallery</title>
        <script>
            var i = 0;
            var foto = new Array(${TotalImg-1});
            var timer;
            <c:set var="index" value="0"></c:set>

            <c:forEach items="${AllPic}" var="a">
            foto[${index}] = "${a.image_url}";
                <c:set var="index" value="${index+1}"></c:set>
            </c:forEach>
            function slide() {
                document.getElementById("slide").src = foto[i];
                i = (i + 1) % foto.length;
            }
            function setTimer() {
                if (timer) {
                    // stop 
                    clearInterval(timer);
                    timer = null;
                    document.getElementById("icon").className = "far fa-play-circle";
                } else {
                    timer = setInterval("slide()", 1000);
                    document.getElementById("icon").className = "far fa-pause-circle";
                }
            }
            function undisplay() {
                document.getElementById("slideshow").style.display = "none";
            }
        </script>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="left">
                        <div class="about">
                            <h3>${Gallery.title}</h3>
                    </div>
                    <div class="slideshow" id="slideshow">
                        <div class="picture">
                            <img src="${firstUrl}" id="slide">
                        </div>

                        <button class="controls" id="pause" onclick="setTimer()">
                            <i class="far fa-play-circle" id="icon"></i>
                        </button>
                    </div>
                    <div class="fullscreen-pic">
                        <c:set var="index" value="1"/>
                        <c:forEach items="${ListImg}" var="i">
                            <section id="pic-${index}">
                                <img src="${i.image_url}">
                            </section>
                            <c:set var="index" value="${index+1}"/>
                        </c:forEach>
                    </div>
                    <div class="thumbnail">
                        <ul>
                            <c:set var="index" value="1"/>
                            <c:forEach items="${ListImg}" var="i">
                                <li>
                                    <a href="#pic-${index}" onclick="undisplay()"><img src="${i.image_url}"></a>
                                </li>
                                <c:set var="index" value="${index+1}"/>
                            </c:forEach> 
                        </ul>
                    </div>
                    <c:if test="${TotalPage > 1}">
                        <div class="paging">
                            <c:forEach var="page" begin="1" end="${TotalPage}">
                                <a class="${currentPage==page?'active':''}" href="gallery?page=${page}&gid=${Gid}">${page}</a>   
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
                <jsp:include page="Right.jsp"></jsp:include>
                </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>

</html>
