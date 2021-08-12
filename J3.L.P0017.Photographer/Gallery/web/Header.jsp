<%-- 
    Document   : Header
    Created on : Jun 2, 2021, 10:23:16 AM
    Author     : khanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="top">
    <div class="menu">
        <div class="menu-inner">
            <ul>
                <li><a href="home">My front page</a></li>
                <c:forEach items="${ListG}" var="g">
                    <li><a href="gallery?gid=${g.id}">${g.title}</a></li>
                </c:forEach>
                <li><a href="contact">Contact</a></li>
            </ul>
        </div>
    </div>
    <div class="header">
        <div class="header-inner">
            <div class="icon"><i class="fas fa-camera-retro"></i></div>
            <div class="title">PHOTOGRAPHER</div>
            <div class="subtitle">Welcome to this website</div>
        </div>
    </div>
</div>
