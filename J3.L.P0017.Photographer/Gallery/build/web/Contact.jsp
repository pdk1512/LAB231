<%-- 
    Document   : Contact
    Created on : Jun 3, 2021, 3:13:57 AM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/857d8a8904.js" crossorigin="anonymous"></script>
    <title>My Gallery</title>
</head>

<body>
    <div class="container">
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="main">
            <div class="left">
                <div class="about">
                    <h3>Contact</h3>
                </div>
                <div class="contact-detail">
                    <h3>PHOTOGRAPHER</h3>
                    <div class="address">
                        <p>Address: ${Contact.address}<br>City: ${Contact.city}<br>Country: ${Contact.country}</p>
                    </div>
                    <div class="info">
                        <table>
                            <tr>
                                <td>Tel: </td>
                                <td>${Contact.telephone}</td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td>${Contact.email}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="map">
                        <iframe
                            src="${Contact.map}"
                            frameborder="0" style="border:0;" allowfullscreen=""
                            aria-hidden="false" tabindex="0"></iframe>

                    </div>
                </div>
            </div>
            <jsp:include page="Right.jsp"></jsp:include>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </div>
</body>

</html>
