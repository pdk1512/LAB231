<%-- 
    Document   : Right
    Created on : Jul 1, 2021, 12:04:52 PM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="right">
    <div class="news">
        <div class="title-new">
            <span>Digital News</span>
        </div>
        <div class="content-new">
            ${mostRecent.summary}
        </div>
    </div>
    <div class="news">
        <div class="title-new">
            Search
        </div>
        <form action="search">
            <input class="searchBox" type="text" name="txtSearch" size="15" required>
            <input class="searchBtn" type="submit" name="btnSearch" value="Go">
        </form>
    </div>
    <div class="news">
        <div class="title-new">
            Last Articles
        </div>
        <c:forEach items="${listNew}" var="n">
            <div class="last-articles">
                <a href="newdisplay?id=${n.id}">${n.title}</a>
            </div>
        </c:forEach>
    </div>
</div>
