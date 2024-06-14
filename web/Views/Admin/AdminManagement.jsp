<%-- 
    Document   : AdminManagement
    Created on : Mar 10, 2024, 2:36:29 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!--The logo of the website-->
        <link rel="shortcut icon" href="img/Logo/E Open Door Logo Rebound.jpg" type="image/x-icon">
        <!-- Use bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    </head>
    <body>
        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }
            function doDelete(id) {
                if (confirm("Are you sure to delete " + id + " ?")) {
                    window.location = "check?action=delete?id=" + id;
                }
            }
        </script>
        <script>
//            Đây là function để filter categories
            function redirect() {
                //Lấy phẩn tử có ID (vì id là unique nên luôn chỉ có 1 kết quả) ứng dropdown để filter
                var dropdown = document.getElementById("selectOption");
                //Lấy index của lựa chọn trên tổng các lựa chọn
                var selectedOption = dropdown.options[dropdown.selectedIndex];
                //Nếu value (dưới dropdown cái nào cũng có value=categoryID tương ứng" )không rỗng
                if (selectedOption.value !== "#") {
                    //Đường dẫn về /management, lần này parameter "key" không null
                    //Lí do "management?key=" ở đây:  để dưới option netbeans gặp vấn đề dịch
                    window.location.href = "management?key=" + selectedOption.value;
                }
            }
        </script>
        <hr/>  <!--navigation bar-->
        <div id="navi" class="container-fluid">
            <jsp:include page="../Home/Navigation.jsp" ></jsp:include>
            </div>
            <hr/>
        <center>
            <h1>Admin Management</h1>
        <c:if test="${empty sessionScope.account or empty sessionScope.account.userID or not sessionScope.account.userID.contains('ADM')}">
            <!-- User is not logged in or the userID does not contain "ADM" -->
            <div class="display-1 text-danger">Access denied!</div>
        </c:if> 
            
        <!--Người đăng nhập có quyền truy cập-->
        <c:if test="${not empty sessionScope.account and 
                      not empty sessionScope.account.userID and sessionScope.account.userID.contains('ADM')}">
              <div class="col-md-7 container row text-start" >
                  <c:set var="cid" value="${cid}"/>
                  <form action="management" class="col" id="f1" >
                      <label for="selectOption"><h5>Select an option:</h5></label>
                      <!--Đặt dropdown 1 cái id để function redirect() tìm--> 
                      <!--onchange để trigger redirect() mỗi khi người dùng thay đổi lựa chọn-->
                      <select id="selectOption" name="key" onchange="redirect()">
                          <option value="all">All</option>
                          <c:forEach items="${category}" var="c">
                              <!--Mỗi option sẽ có 1 value tương ứng với CategoryID của nó-->
                              <!--Khi người dùng chọn 1 option,Javascript redirect được trigger-->
                              <option ${(cid==c.cateID)?'selected':""} value="${c.cateID}">${c.cateName}</option>
                          </c:forEach>
                      </select>
                  </form>
                  
                  <div class="col-md-5 col">
                      <label><h5>Do you want to insert more ?</h5></label>
                      <form action="insert">
                      <a href="insert" class="btn btn-primary">Insert</a>
                      </form>
                  </div>
              </div>
              <br/>
              <div class="container row">
                  <div class="col-md-7" >
                      <h5>Product List</h5><!-- select items by category -->
                      <table  border="10px" width="100%"><!-- illustrate by table -->
                          <thead>
                              <tr >
                                  <th><h2>Picture</h2></th>
                                  <th><h2>Information</h2></th>
                                  <th><h2>Action</h2></th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:if test="${(requestScope.category)!=null}">

                                  <c:forEach items="${requestScope.lp}" var="p">
                                      <tr>
                                          <td><img src="img/Products/${p.picture}" width="80%" 
                                                   height="height" alt="${p.proID}"/></td>
                                          <td class="col-md-5 text-start">
                                              <h2>${p.proName}</h2>
                                              <h3 style="color: crimson;">$${p.price}</h3>
                                              <p>Quantity: ${p.quantity}<p>
                                              <p>Category: ${p.categoryID}<p>
                                              <P>Designer: ${p.designers}</p>
                                              <p>${p.longDes}</p>
                                          </td>
                                          <td>
                                              <a href="GetProductByID?proID=${p.proID}" class="btn text-white"
                                                 style="background-color: grey;">Update</a><br/>
                                              <a href="delete?proID=${p.proID}" onclick="doDelete('${p.proID}')"
                                                 class="btn btn-danger">Delete</a>
                                          </td> 
                                      </tr>
                                  </c:forEach>

                              </c:if>
                          </tbody>
                      </table >
                  </div>
                  <div class="col-md-5"><!-- edit table -->
                      <div class="row">
                          <h5>Edit</h5>
                          <h3 style="color: crimson;">${requestScope.mess}</h3>
                      </div>
                      <form action="update" method="post">
                          <table border="2" width="100%">
                              <tr>
                                  <td><label for="pid">Product ID:</label></td>
                                  <td><input readonly type="text" id="pid" 
                                             name="proID" value="${ proID}"></td>
                              </tr>
                              <tr>
                                  <td>Product Name:</td>
                                  <td><input type="text" class="form-control" 
                                             name="proName" value="${ proName}"></td>
                              </tr>
                              <tr>
                                  <td>Picture:</td>
                                  <td><input type="text" class="form-control" 
                                             name="picture" value="${ picture}"></td>
                              </tr>
                              <tr>
                                  <td>Quantity</td>
                                  <td><input type="text" class="form-control" 
                                             name="quantity" value="${quantity}"></td>
                              </tr>
                              <tr>
                                  <td>Designers:</td>
                                  <td><input type="text"class="form-control" 
                                             name="designers" value="${ designers}"></td>
                              </tr>
                              <tr>
                                  <td>Long Description:</td>
                                  <td><textarea name="longDes" class="form-control">${ longDes}</textarea></td>
                              </tr>
                              <tr>
                                  <td>Price:</td>
                                  <td><input type="text" class="form-control" 
                                             name="price" value="${ price}"></td>
                              </tr>
                              <tr>
                                  <td>Category ID:</td>
                                  <td><input type="text" class="form-control" 
                                             name="categoryID" value="${categoryID}"></td>
                              </tr>
                              <tr>
                                  <td colspan="2" class="text-center">
                                      <input type="submit" name="bupdate" value="update"
                                             class="btn btn-success btn-lg text-white" >
                                  </td>
                              </tr>
                          </table>
                      </form>
                  </div>

              </div>
        </c:if>
    </center>
    <hr/>
</body>
</html>
