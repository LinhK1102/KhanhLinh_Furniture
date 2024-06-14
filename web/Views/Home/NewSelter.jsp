<%-- 
    Document   : NewSelter
    Created on : Mar 6, 2024, 9:47:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--Bootstrap action-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body >
        <!-- Newsletter Section -->
        <div class="container-fluid bg-dark align-self-center row text-center text-white "> 
            <h2 >Unique designs that will fit in with the rest of your furniture.</h2>
            <h4>Receiving the latest news about new design.</h4>
<!--             Use a single button for both the link and the collapse 
            <button data-toggle="collapse" data-target="#content" class="btn btn-outline-dark">Click me !!!</button>-->
            
            <!-- Use a card for the collapsible content -->
            <div id="content" class="collapse">
                <div class="card card-body">
                    <p class="text-center">Subscribe to our newsletter to stay updated with the latest news!</p>
                    <!-- Use a form element for better structure -->
<!--                    <form action="sendMail" method="post">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control" placeholder="Send your email" required>
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="bi bi-envelope"></i></button>
                            </div>
                        </div>
                    </form>-->
                </div>
            </div>
        </div>
        <!-- End Newsletter Section -->
    </body>
</html>
