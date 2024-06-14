<%-- 
    Document   : HotProducts
    Created on : Mar 9, 2024, 7:10:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Best Seller Page</title>
        </head>
        <body>
            <h1>Best Seller</h1>
            <div class="col-md-12 container row">
                <!-- Slide show of hot items, which attracts viewers -->
                <div id="car" class="col-md-10 container-fluid carousel slide" data-bs-ride="carousel">
                    <!-- Indicators/dots -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#car" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#car" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#car" data-bs-slide-to="2"></button>
                        <button type="button" data-bs-target="#car" data-bs-slide-to="3"></button>
                        <button type="button" data-bs-target="#car" data-bs-slide-to="4"></button>
                    </div>

                    <!-- The slideshow/carousel -->
                    <div class="carousel-inner">
                    <c:forEach items="${d.getbestSeller()}" var="hp" varStatus="loop">
                        <div class="carousel-item ${loop.first ? 'active' : ''}">
                            <div class="container-fluid row">
                                <img src="img/Products/${hp.picture}" class="d-block mx-auto col-md-7" alt="${hp.proID}"
                                     style="width: fit-content; height: fit-content;"/>
                                <div class="col-md-5">
                                    <h2 class="card-title">${hp.proName}</h2>
                                    <h1 style="color: red"><span>$${hp.price}.99</span></h1>
                                    <a href="ProductsDetails?pid=${hp.proID}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev btn-outline-dark" type="button" data-bs-target="#car" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next btn-outline-dark" type="button" data-bs-target="#car" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </div>

    </body>
</html>
