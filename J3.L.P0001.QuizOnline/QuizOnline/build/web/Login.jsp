<%-- 
    Document   : Login
    Created on : Jun 21, 2021, 9:44:20 AM
    Author     : khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>My Quiz</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>
            function checkEmpty(){
                var userField = document.forms["loginForm"]["user"].value;
                var passField = document.forms["loginForm"]["pass"].value;
                if(userField == ""){
                    alert("Please input username");
                    return false;
                }else if(passField == ""){
                    alert("Please input password");
                    return false;
                }else{
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="main">
                <div class="content">
                    <h2>Login Form</h2>
                    <form action="login" method="post" name="loginForm" onsubmit="return checkEmpty()">
                        <table>
                            
                            <tr>
                                <td>User Name: </td>
                                <td><input type="text" class="field" name="user"></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input type="password" class="field" name="pass"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><p style="color: red">${alert}</p></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Sign in">
                                    <a href="Register.jsp">Register</a>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
    </body>

</html>
