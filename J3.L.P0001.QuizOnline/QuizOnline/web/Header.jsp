<%-- 
    Document   : Header
    Created on : Jun 21, 2021, 9:49:11 PM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="head">
    <div class="menu">
        <ul>
            <li><a href="home">Home</a></li>
                <c:if test="${sessionScope.acc != null}">
                <li><a href="TakeQuiz.jsp">Take Quiz</a></li>
                    <c:if test="${sessionScope.acc.type == 1}">
                    <li><a href="MakeQuiz.jsp">Make Quiz</a></li>
                    <li><a href="managequiz">Manage Quiz</a></li>
                    </c:if>
                <li><a href="logout">Log out</a></li>
                </c:if>
        </ul>
    </div>
</div>
