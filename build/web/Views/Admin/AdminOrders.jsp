<%-- 
    Document   : AdminOrders
    Created on : Apr 20, 2024, 2:14:09 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Orders</title>
        <!--The logo of the website-->
        <link rel="shortcut icon" href="img/Logo/E Open Door Logo Rebound.jpg" type="image/x-icon">
    </head>
    <body>
        <!-- Header -->
        <hr/>
        <div id="navi" class="container-fluid">
            <jsp:include page="../Home/Navigation.jsp" ></jsp:include>
                <hr/>
            </div>
        <center>
            <h1>Orders Lines</h1>
            <hr/>
            <!--kiểm tra thông tin người đăng nhập-->
        <c:if test="${empty sessionScope.account or empty sessionScope.account.userID or not sessionScope.account.userID.contains('ADM')}">
            <!-- User is not logged in or the userID does not contain "ADM" -->
            <div class="display-1 text-danger">Access denied!</div>
        </c:if> 


        <!--Người đăng nhập có quyền truy cập-->
        <c:if test="${not empty sessionScope.account and 
                      not empty sessionScope.account.userID 
                      and sessionScope.account.userID.contains('ADM')}">
              <!-- User is logged in and the userID contains "ADM" -->
              <!--Bắt đầu thông tin orders-->
              <div class="container row">
                  <!--Danh sách sản phẩm bán chạy-->
                  <div class="col-md-5">
                      <div class="card border-primary mb-3" style="max-width: 18rem;">
                          <div class="card-header">Revenue </div>
                          <div class="card-body text-primary">
                              <h5 class="card-title">$${revenue}</h5>
                          </div>
                      </div>
                      <hr>
                      <div class="row row-cols-1 row-cols-md-2 g-4">
                          <div class="col">
                              <div class="card">
                                  <c:forEach items="${mostSellPro}" var="a">
                                       <div class="card-header">Best Selling</div>
                                      <img src="img/Products/${a.key.picture}" class="card-img-top" alt="Best Selling Products">
                                      <div class="card-body">
                                          <h5 class="card-title"> ${a.key.proName}</h5>
                                      </c:forEach>
                                  </div>
                              </div>
                          </div>
                          <div class="col">
                              <div class="card">
                                  <c:forEach items="${mostOrdPro}" var="a">
                                      <div class="card-header">Most Orders</div>
                                      <img src="img/Products/${a.key.picture}" class="card-img-top" alt="Most prefered products">
                                      <div class="card-body">
                                          <h5 class="card-title">${a.key.proName}</h5>
                                      </c:forEach>
                                  </div>
                              </div>
                          </div>
                          <div class="col"><!-- Most spending customers -->
                              <div class="card border-success mb-3" style="max-width: 18rem;">
                                  <div class="card-header text-bg-success">
                                      <i class="bi bi-person-square"></i> VIP CUSTOMER
                                  </div>
                                  <div class="card-body text-success">
                                      <div class="card-body">
                                          <c:forEach items="${accList}" var="a">
                                              <h5 class="card-text">
                                                  ${a.key.userName}
                                              </h5>
                                              <p class="card-text">Spending: ${a.value}</p>
                                          </c:forEach>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="col">
                              <div class="card border-success mb-3" style="max-width: 18rem;">
                                  <div class="card-header text-bg-success">
                                      <i class="bi bi-signpost-split"></i>
                                      Most Shipped</div>
                                  <div class="card-body text-success">
                                      <div class="card-body">
                                          <c:forEach items="${popDes}" var="a">
                                              <h5 class="card-title">
                                                  ${a.key}
                                              </h5>
                                              <p class="card-text">${a.value} orders</p>
                                          </c:forEach>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="col">
                              <div class="card border-success mb-3" style="max-width: 18rem;">
                                  <div class="card-header text-bg-success">Prefer Payment Method</div>
                                  <div class="card-body text-success">
                                      <div class="card-body">
                                          <h5 class="card-text">
                                              <c:forEach items="${prePaid}" var="a">
                                                  ${a.key}
                                              </c:forEach>
                                          </h5>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!--Kết thúc bên trái-->

                  <!--danh sách sản phẩm đang chờ ship bên tay trái-->
                  <div class="col-md-7 table-responsive">
                      <center>
                          <table style="width: 98%;" class="table table-bordered">
                              <thead class="thead-dark">
                                  <tr>
                                      <th colspan="2">
                                          <div class="display-3">Orders inline</div>
                                          <div style="color: darkblue">${mess}</div>
                                      </th> <!-- Spanning two columns -->
                                  </tr>
                              </thead>
                              <tbody>
                                  <c:forEach items="${ordList}" var="o">
                                      <tr>
                                          <td> <!-- Spanning two columns -->
                                              <div class="card mb-3" style="max-width: 540px;">
                                                  <div class="row g-0">
                                                      <div class="col-md-4">
                                                          <img src="img/Products/${o.value.picture}" 
                                                               class="img-fluid rounded-start" alt="...">
                                                      </div>
                                                      <div class="col-md-8">
                                                          <div class="card-body">
                                                              <div class="row">
                                                                  <div class="col-7">
                                                                      <h5 class="card-title">Order ${o.key.orderID}</h5>
                                                                      <h5>${o.key.proID} - ${o.value.proName}</h5>
                                                                  </div>
                                                                  <div class="col-5">
                                                                      <c:set var="total" value="${o.key.quantity * o.value.price}" />
                                                                      <p class="display-5" style="color: crimson">$${total}</p>
                                                                  </div>
                                                              </div>
                                                              <p class="card-text">
                                                                  Quantity: ${o.key.quantity}<br>
                                                                  Order Date: ${o.key.orderDate}<br/>
                                                                  Ship Destination: ${o.key.shipDestination}<br/>
                                                              </p>
                                                              <p class="card-text"><small class="text-body-secondary">Note: ${o.key.note}</small></p>
                                                              <div class="container row">
                                                                  <div class="col-3">
                                                                      <input type="hidden" name="orderID" value="${o.key.orderID}">
                                                                      <a href="accepts?orderID=${o.key.orderID}" class="btn btn-success">Accept</a>
                                                                  </div>
                                                                  <div class="col-3">
                                                                      <input type="hidden" name="orderID" value="${o.key.orderID}">
                                                                      <div class="col-3"><a href="rejects?orderID=${o.key.orderID}" class="btn btn-outline-danger">Rejects</a><br/></div>
                                                                  </div>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                              </div>
                                              </div>
                                          </td>
                                      </tr>
                                  </c:forEach>
                              </tbody>
                          </table>
                      </center>
                  </div>

                  <!--Kết thúc bên phải-->
              </div>
        </c:if>
    </center>
    <!--Footer-->
    <div id="footer"class="container-fluid">
        <%@include file="../Home/Footer.jsp" %>
    </div>
</body>
</html>
