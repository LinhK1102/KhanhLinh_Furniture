<%-- 
    Document   : Login
    Created on : Mar 8, 2024, 3:50:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <!--The logo of the website-->
        <link rel="shortcut icon" href="img/Logo/E Open Door Logo Rebound.jpg" type="image/x-icon">
        <!-- Bootstrap verson for input -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body >
        <!--Login is inside card-->
    <center class="d-flex align-self-center justify-content-center " >
        <form action="<%=request.getContextPath ()%>/login" method="post" 
            class="resizable-box border p-3 custom-table pannel" 
            style="width: 50%;height: fit-content; border: 10px;">
            
            <!--This is the title of the card-->
            <h3 class="panel-heading panel-default bg-dark text-white " >Login</h3>
            <h1 style="color: red">${requestScope.mess}</h1>
            
            <!--This is the body of the card-->
            <div class="panel-body">
                <!--User label-->
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="email" type="text" class="form-control input-lg" name="user" placeholder="Your username here ...">
                </div>
                <!--Password label-->
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="pass" placeholder="Password">
                </div>
                <!--Button label-->
                <div class="row">    <!--User login via userName -->
                    <!-- Trigger the modal with a button -->
                    <button type="submit" name="blogin" value="login" 
                            class="btn btn-info btn-lg">Login</button>

                </div>
                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <!-- nếu người dùng login fail dùng alert 
                            thông báo login fail 
                            mess: user name and user pass are not correct -->
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Notification</h4>
                            </div>
                            <div class="modal-body">
                                <p>${mess}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end of panel-->
        </form>
    </center>
</body>
</html>
