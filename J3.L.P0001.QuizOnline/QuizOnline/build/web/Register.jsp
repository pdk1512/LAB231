<%-- 
    Document   : RegisterServlet
    Created on : Jun 21, 2021, 10:13:53 PM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>My Quiz</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>
            function checkEmpty() {
                var userField = document.forms["registerForm"]["user"].value;
                var passField = document.forms["registerForm"]["pass"].value;
                var mailField = document.forms["registerForm"]["mail"].value;
                if (userField == "") {
                    alert("Please input username");
                    return false;
                } else if (passField == "") {
                    alert("Please input password");
                    return false;
                } else if (mailField == "") {
                    alert("Please input mail");
                    return false;
                } else {
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
                        <h2>Registration Form</h2>
                        <form action="register" onsubmit="return checkEmpty()" name="registerForm">
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
                                    <td>User Type: </td>
                                    <td>
                                        <select name="type" id="type">
                                            <option value="1">Teacher</option>
                                            <option value="0">Student</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="email" class="field" name="mail"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><p style="color: red">${alertUser}</p></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Register" style="font-size: large; font-weight: bold;">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>
