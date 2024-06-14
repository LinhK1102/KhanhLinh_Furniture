<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="Models.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Shopping</title>
    </head>

    <body>
        <!-- View Products by Category Section -->
        <div class="container" id="cshop">
            <h2>SHOPPING BY CATEGORY</h2>
            <!-- list of categories appear -->
            <c:forEach items="${d.categories}" var="c">
            <table border="1">
                <tr>
                    <td><h3 class="text-center" >${c.cateName}</h3></td>
                </tr>
                <tr>
                <c:forEach items="${d.getProductByCate(c.cateID)}" var="p">
                    <td class="col-md-4 mb-4">
                            <div class="card">
                                <img src="img/Products/${p.picture}" class="card-img-top"
                                 alt="${p.proName}"/>
                                <div class="card-body">
                                    <h5 class="card-title">${p.proName}</h5>
                                    <p class="card-text" style="color: crimson;">$${p.price}</p>
                                    <a href="ProductsDetails?pid=${p.proID}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </td>
                </c:forEach>                </tr>

            </table>
        </c:forEach>
        </div>

        <!-- End View Products by Category Section -->
    </body>

</html>