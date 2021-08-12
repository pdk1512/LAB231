<%-- 
    Document   : Footer
    Created on : Jun 2, 2021, 10:30:32 AM
    Author     : khanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="footer">
    <div class="footer-item">
        <a href="#">Create by Pham Duy Khanh</a>
        <% String[] arrView = new String[5]; %>
        <div class="footer-num">
            <% 
                String view = (String) session.getAttribute("Views"); 
                arrView = view.split("");
                for(int i = 0; i < arrView.length; i++){
            %>
            <span class="num"><%=arrView[i]%></span>
            <% } %>
        </div>
    </div>
</div>
