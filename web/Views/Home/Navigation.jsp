<%-- 
    Document   : Navigation
    Created on : Mar 6, 2024, 9:48:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="container-fluid row" id="navi">
            <!-- Navigation Part 1 -->
            <div class="col-md-4 row"><!-- say hi to User -->
                <c:if test="${sessionScope.account !=null}"> <!--print userName-->
                    <h1 id="textheader" class="col">Hello ${sessionScope.account.userName}</h1>
                </c:if>
            </div>

            <!-- Navigation Part 2 -->
            <div class="col-md-4 row text-center">
                <!--always come back to home page-->
                <div class="col"> 
                    <a href="<%=request.getContextPath ()%>/home" 
                       class="btn btn-transparent home-button text-decoration-none" >Home</a>
                </div>
                <div class="col dropdown"><!-- List of category -->
                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">
                        Products
                    </button>
                    <ul class="dropdown-menu">
                        <c:forEach items="${d.categories}" var="nc">
                            <li><a class="dropdown-item" href="#cshop">${nc.cateName}</a></li>
                            </c:forEach>
                    </ul>
                </div>
                       <div class="col dropdown"><!-- Contact -->
                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">
                        About us
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>

            <!-- Navigation Part 3 -->
            <div class="col-md-4 row text-end">
                <!-- Products in Cart -->
                <div class="col row"><!-- if users is admin, redirect to admin management -->
                    <c:if test="${sessionScope.account.userID.contains('ADM')}">
                        <a class="col" id="textheader" href="management"><!--Dẫn tới trang quản lí sản phẩm-->
                          <i class="bi bi-view-list"></i>
                        </a>
                        <a class="col" id="textheader" href="adminorders"><!-- Dẫn tới trang quản lí sản phẩm -->
                          <i class="bi bi-cart3"></i>
                        </a>
                        </c:if>
                    
                        <!-- else customers user, redirect to orders -->
                    <c:if test="${sessionScope.account.userID.contains('CUS')}">
                            <!--Redirect to user cart-->
                            <a href="orders">
                                <i class="bi bi-handbag"></i>
                            </a>
                        </c:if>
                </div>
                
                <!-- Account Login Icons-->
                <div class="col row">
                    <!--check if user login, ask if user want logout-->
                    <c:if test="${sessionScope.account !=null}">
                        <a id="textheader" class="nav-link" href="logout">
                            <i class="bi bi-box-arrow-in-right"></i>
                        </a>
                    </c:if>
                    <!--if not login, suggest login-->
                    <c:if test="${sessionScope.account ==null}">
                        <a id="textheader" class="nav-link" href="<%=request.getContextPath()%>/Views/Home/Login.jsp">
                            <i class="bi bi-box-arrow-in-left"></i>
                        </a>
                    </c:if>
                </div>

            </div>
        </nav>
    </body>
</html>
