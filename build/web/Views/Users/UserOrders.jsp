<%-- 
    Document   : Orders
    Created on : Mar 8, 2024, 6:37:25 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders List</title>
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
            <%@include file="../Home/Navigation.jsp" %>
        </div>
        <hr/>
    <center>
        <h1>Order Lists ${orderID}</h1>
        <c:if test="${empty sessionScope.account or empty sessionScope.account.userID or not sessionScope.account.userID.contains('CUS')}">
            <!-- User is not logged in or the userID does not contain "ADM" -->
            <div class="display-1 text-danger">Access denied!</div>
        </c:if> 

        <!--Người đăng nhập có quyền truy cập-->
        <c:if test="${not empty sessionScope.account and 
                      not empty sessionScope.account.userID and sessionScope.account.userID.contains('CUS')}">
              <div class="container">
                  <div class="display-1">${mess}</div>
                  <hr>
                  <div class="container col-md-7">
                      <table border="1">
                          <thead>
                              <tr>
                                  <th colspan="3"><h2>CART</h2></th>
                                  <th>Total</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${ordList}" var="o">
                                  <tr>
                                      <td colspan="3"> <!-- Spanning two columns -->
                                          <div class="card mb-3" style="max-width: 540px;">
                                              <div class="row g-0">
                                                  <div class="col-md-4">
                                                      <img src="img/Products/${o.value.getPicture()}" 
                                                           class="img-fluid rounded-start" alt="...">
                                                  </div>
                                                  <div class="col-md-8">
                                                      <div class="card-body">
                                                          <c:set var="totalPrice" 
                                                                 value="${o.value.price * o.key.quantity}" />
                                                          <h5 class="card-title">${o.key.proID}_${o.value.proName}</h5>
                                                          <p class="card-text">
                                                          <p>Quantity: ${o.key.quantity}</p>
                                                          <p>Order Date: ${o.key.orderDate}</p>
                                                          <p>Ship Destination: ${o.key.shipDestination}</p>
                                                          <h5>Total: ${totalPrice}</h5>
                                                          </p>
                                                          <p class="card-text"><small class="text-body-secondary">Note: ${o.key.note}</small></p>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </td>
                                      <td colspan="2">
                                          <a href="payments?orderID=${o.key.orderID}" class="btn btn-outline-succes">PAY</a>
                                          <a href="deleteOrders?orderID=${o.key.orderID}" class="btn btn-outline-danger">DELETE</a>
                                      </td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                  </div>
              </div>
        </c:if>
    </center>
    <br><!-- Kết thúc nội dung -->
    <!--Footer-->
    <div id="footer"class="container-fluid">
        <%@include file="../Home/Footer.jsp" %>
    </div>
</body>
</html>
