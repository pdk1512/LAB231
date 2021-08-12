<%-- 
    Document   : Right
    Created on : Jun 2, 2021, 10:28:13 AM
    Author     : khanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="right">
    <div class="header-right">
        <h4>Share this page</h4>
    </div>
    <div class="social">
        <ul>
            <li>
                <i class="fab fa-facebook-square"></i>
                <a href="${links.facebookUrl}"><span>Share on Facebook</span></a>
            </li>
            <li>
                <i class="fab fa-twitter-square"></i>
                <a href="${links.twitterUrl}"><span>Share on Twitter</span></a>
            </li>
            <li>
                <i class="fab fa-google-plus"></i>
                <a href="${links.googleUrl}"><span>Share on Google++</span></a>
            </li>
        </ul>
    </div>
</div>
