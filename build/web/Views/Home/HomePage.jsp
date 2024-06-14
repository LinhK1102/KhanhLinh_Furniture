<%-- 
    Document   : HomePage
    Created on : Mar 6, 2024, 10:13:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--The title of the website-->
        <title>Home Page</title>
        <jsp:useBean id="d" class="dal.dao" scope="application"></jsp:useBean>
            <!--The logo of the website-->
            <link rel="shortcut icon" href="img/Logo/E Open Door Logo Rebound.jpg" type="image/x-icon">
            <!-- Use bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Bootstrap icons -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        </head>
        <body>
            <!--navigation bar-->
            <hr/>
            <div id="navi" class="container-fluid">
            <%@include file="Navigation.jsp" %>
        </div>
        <hr/>
        
        <!--Hot items-->
        <div id="hotitems" class="container">
            <%@include file="HotProducts.jsp" %>
        </div>
        <br>
        <br>
        <!--About us/New Selter-->
        <div class="container-fluid bg-dark p-4" id="newselter">
            <%@include file="NewSelter.jsp" %>
        </div>
        <br>
        <br>
        <!--Shopping by Category-->
        <div class="" id='ctshop'>
            <%@include file="CategoryShopping.jsp" %>
        </div>
        <hr/>
        <!--Footer-->
        <div id="footer"class="container-fluid">
            <%@include file="Footer.jsp" %>
        </div>

    </body>
</html>
