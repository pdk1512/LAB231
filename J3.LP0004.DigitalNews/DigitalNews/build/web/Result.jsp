<%-- 
    Document   : Result
    Created on : Jul 3, 2021, 1:16:57 AM
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
                    <c:forEach items="${listSearch}" var="s">
                        <div class="title">
                            <a href="newdisplay?id=${s.id}">${s.title}</a>
                        </div>
                        <div class="image">
                            <img src="${s.image}" />
                        </div>
                        <div class="description">
                            ${s.summary}
                        </div>
                    </c:forEach>
                    <div class="paging">
                        <c:if test="${totalPage == 0}">
                            <div class="title">
                                No news found!
                            </div>
                        </c:if>
                        <c:if test="${totalPage > 1}">
                            <c:forEach begin="1" end="${totalPage}" var="p">
                                <a href="search?page=${p}&txtSearch=${txtSearch}" class="${p==currentPage?'active':''}">${p}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <jsp:include page="Right.jsp"></jsp:include>
            </div>
            <div class="footer"></div>
        </div>
    </body>

</html>
