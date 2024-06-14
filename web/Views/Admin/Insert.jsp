<%@ page import="Models.Products" %>
<%@ page import="Models.Category" %>
<%@ page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- The logo of the website -->
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
    <center>
        <div class="col-md-5"><!-- Right table -->
            <h1>Insert Product</h1>
            <h1 class="display-3">${mess}</h1>
            <form action="<%=request.getContextPath ()%>/insert" id="f1" method="post">
                <table class="table table-bordered">
                    <tr>
                        <td>Product ID:</td>
                        <td><input type="text" class="form-control" name="proID" ></td>
                    </tr>
                    <tr>
                        <td>Product Name:</td>
                        <td><input type="text" class="form-control" name="proName" ></td>
                    </tr>
                    <tr>
                        <td>Picture:</td>
                        <td><input type="text" class="form-control" name="picture"></td>
                    </tr>
                    <tr>
                        <td>Quantity:</td>
                        <td><input type="text" class="form-control" name="quantity" ></td>
                    </tr>
                    <tr>
                        <td>Designers:</td>
                        <td><input type="text" class="form-control" name="designers"></td>
                    </tr>
                    <tr>
                        <td>Long Description:</td>
                        <td><textarea name="longDes" class="form-control" rows="5"></textarea></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="text" class="form-control" name="price" ></td>
                    </tr>
                    <tr>
                        <td>Category ID:</td>
                        <td>
                            <select id="selectOption" name="key" >
                                 <c:set var="cid" value="${cid}"/>
                                 <c:forEach items="${requestScope.cateList}" var="c">
                                    <!--Mỗi option sẽ có 1 value tương ứng với CategoryID của nó-->
                                    <!--Khi người dùng chọn 1 option,Javascript redirect được trigger-->
                                    <option name="${c.cateID}" value="${c.cateID}">${c.cateName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <input type="submit" name="bupdate" value="insert"
                                   class="btn btn-success btn-lg text-white">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </center>
</body>

</html>

