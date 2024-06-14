<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Details - ${p.proName}</title>
        <!--The logo of the website-->
        <link rel="shortcut icon" href="img/Logo/E Open Door Logo Rebound.jpg" type="image/x-icon">
        <!-- Use bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

        <style>
            /* Custom CSS */
            .quantity-input {
                display: flex;
                align-items: center;
            }
            .quantity-input input[type="number"] {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <br>
        <hr>
        <div id="navi">
            <%@include file="Navigation.jsp" %>
        </div>
        <hr>
        <nav class="container" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item btn-link"><a href="<%=request.getContextPath()%>">Home</a></li>
                <li class="breadcrumb-item">Product Details</li>
                <li class="breadcrumb-item active" aria-current="page">${p.proName}</li>
            </ol>
        </nav>
        <div class="container"><!-- Main content -->
            <h1 class="text-start display-3">${p.proName}</h1>
            <div class="row"><!-- Product details -->
                <div class="col-md-5"><!-- Product image -->
                    <img src="img/Products/${p.picture}" width="80%" height="auto" alt="${p.proName}">
                </div>
                <div class="col-md-7"><!-- Product information -->
                    <h3 style="color: crimson;" >Price: $${p.price}</h3>
                    <p>Category: ${c.cateName}</p>
                    <p>Designer: ${p.designers}</p>
                    <p>${p.longDes}</p>
                    <div class="container"><!-- Quantity input -->
                        <div class="row align-items-center">
                            <div class="col-2 align-items-left">
                                <p class="m-0">Quantity:</p>
                            </div>
                            <div class="col-3">
                                <div class="row justify-content-center">
                                    <div class="col-12 quantity-input">
                                        <div class="quantity-input d-flex align-items-center">
                                            <button type="button" class="btn btn-primary btn-sm mr-2" onclick="decrease()">-</button>
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="${o.key.quantity}">
                                            <button type="button" class="btn btn-primary btn-sm ml-2" onclick="increase()">+</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-7">
                                <p class="m-0">${p.quantity} left</p>
                            </div>
                        </div>
                    </div>
                    <br>
                    <c:if test="${empty sessionScope.account.userID || sessionScope.account.userID.indexOf('ADM') eq -1}">
                        <div class="container">
                            <!-- Add to cart / Buy buttons -->
                            <form action="shopping" method="GET">
                                <input type="hidden" name="proID" value="${p.proID}">
                                <input type="hidden" name="quantity" id="hiddenQuantity" value="">
                                <button type="submit" name="shoppingAction" value="Add to cart" class="btn btn-outline-success"
                                        onclick="setQuantity(this)" href="shopping">Add to cart</button>
                                <button type="submit" name="shoppingAction" value="Buy" class="btn btn-danger"
                                        onclick="setQuantity(this)" href="shopping">Buy</button>

                            </form>
                        </div>

                    </c:if>
                </div>
            </div>
        </div>
        <div id="footer">
            <%@include file="Footer.jsp" %>
        </div>
        <script>
            function decrease() {
                var input = document.getElementById('quantity');
                var hiddenInput = document.getElementById('hiddenQuantity');
                var value = parseInt(input.value);
                if (!isNaN(value) && value > 0) {
                    input.value = value - 1;
                    hiddenInput.value = input.value; // Update hidden input value
                } else {
                    input.value = 0; // Set input value to 0
                    hiddenInput.value = input.value; // Update hidden input value
                }
            }

            function increase() {
                var input = document.getElementById('quantity');
                var hiddenInput = document.getElementById('hiddenQuantity');
                var value = parseInt(input.value);
                if (!isNaN(value)) {
                    input.value = value + 1;
                    hiddenInput.value = input.value; // Update hidden input value
                } else {
                    input.value = 1; // Set input value to 1
                    hiddenInput.value = input.value; // Update hidden input value
                }
            }
        </script>
        <script>
            function setQuantity(button) {
                var quantity = document.getElementById('quantity').value;
                var href = button.getAttribute('href') + "?quantity=" + quantity;
                button.setAttribute('href', href);
            }
        </script>


    </body>
</html>
