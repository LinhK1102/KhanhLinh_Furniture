<%-- 
    Document   : Payment
    Created on : Mar 8, 2024, 6:35:10 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>
        <hr/>
        <div id="navi" class="container-fluid">
            <%@include file="../Home/Navigation.jsp" %>
        </div>
        <hr/>
        <div class="container">
            <h1>Order Lists </h1>
            <hr>
            <c:if test="${empty sessionScope.account or empty sessionScope.account.userID or not sessionScope.account.userID.contains('CUS')}">
                <!-- User is not logged in or the userID does not contain "ADM" -->
                <div class="display-1 text-danger">Access denied!</div>
            </c:if> 
            <div class="container">
                <!--Người đăng nhập có quyền truy cập-->
                <c:if test="${not empty sessionScope.account and 
                              not empty sessionScope.account.userID and sessionScope.account.userID.contains('CUS')}">
                      <form action="paid" method="post"> 
                          <h4>${sessionScope.account.userName} payment</h4>
                          <div>
                              <p>Your address: ${a.userName},${a.cusAdd},${a.cusCIty},${a.cusState}.</p>
                          </div>
                          <hr/>
                          <div class="container">
                              <h2>Your product ${mess}</h2>
                              <c:forEach items="${order}" var="o">
                                  <div class="card mb-3">
                                      <div class="row g-0">
                                          <div class="col-md-4">
                                              <!-- Image on the left -->
                                              <img src="img/Products/${o.value.picture}" class="img-fluid rounded-start" alt="...">
                                          </div>
                                          <div class="col-md-8">
                                              <div class="card-body">
                                                  <div class="row">
                                                      <div class="col-7">
                                                          <h5 class="card-title">Order Number: ${o.key.orderID}</h5>
                                                          <p class="card-text">
                                                          <h5>${o.key.proID} - ${o.value.proName}</h5>
                                                      </div>
                                                      <div class="col-5">
                                                          <p class="display-4" style="color: crimson;">$${sum}</p>
                                                      </div>
                                                  </div>
                                                  <div class="container"><!-- Quantity input -->
                                                      <div class="row align-items-center">
                                                          <div class="col-2">
                                                              <p class="m-0">Quantity:</p>
                                                          </div>
                                                          <div class="col-2">
                                                              <div class="quantity-input d-flex align-items-center">
                                                                  <button type="button" class="btn btn-primary btn-sm mr-2" onclick="decrease()">-</button>
                                                                  <input type="number" class="form-control" id="quantity" name="quantity" value="${o.key.quantity}">
                                                                  <button type="button" class="btn btn-primary btn-sm ml-2" onclick="increase()">+</button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                                  <select id="paid" name="paymentMethod">
                                                      <c:forEach items="${paid}" var="p">
                                                          <option value="${p}">${p}</option>
                                                      </c:forEach>
                                                  </select>

                                                  <p>Ship Destination:</p>
                                                  <!-- Text field for ship destination -->
                                                  <input type="text" class="form-control" name="shipDestination" value="${a.cusAdd},${a.cusCIty},${a.cusState}">
                                                  <p>Note:</p>
                                                  <!-- Text area for note -->
                                                  <textarea name="note" class="form-control"></textarea>
                                                  </p>

                                                  <input type="submit" name="btnPaid" value="PAID" 
                                                         class="btn btn-success btn-lg text-white">
                                              </div>
                                          </div>
                                      </div>
                                      <input type="hidden" name="orderID" value="${o.key.orderID}">
                                  </div>
                              </c:forEach>
                          </div>
                      </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!--Footer-->
<div id="footer"class="container-fluid">
    <%@include file="../Home/Footer.jsp" %>
</div>

<script>
    function decrease() {
        var input = document.getElementById('quantity');
        var value = parseInt(input.value);
        if (!isNaN(value) && value > 0) {
            input.value = value - 1;
        }
    }

    function increase() {
        var input = document.getElementById('quantity');
        var value = parseInt(input.value);
        if (!isNaN(value)) {
            input.value = value + 1;
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
