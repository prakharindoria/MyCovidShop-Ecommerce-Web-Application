<%-- 
    Document   : register
    Created on : Apr 28, 2021, 8:14:31 PM
    Author     : prakhar patidar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
                    <div class="row mt-5">
            <div class="col-md-4 offset-md-4"> 
                <div class="card">
                    <div class="card-body px-5">
                        
                        <img class="rounded mx-auto d-block" src="https://img.icons8.com/clouds/100/26e07f/add-user-male.png"/>

                        <h1 class="text-center" my-3>Sign Up</h1>
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here">   
                            </div>

                            <div class="form-group">
                                <label for="Email">User Email</label>
                                <input name="user_email" type="text" class="form-control" id="Email" placeholder="Enter here">   
                            </div>

                            <div class="form-group">
                                <label for="Password">User Password</label>
                                <input name="user_password" type="Password" class="form-control" id="Password" placeholder="Enter here">   
                            </div>

                            <div class="form-group">
                                <label for="Phone">User Phone</label>
                                <input name="user_phone"type="number" class="form-control" id="Phone" placeholder="Enter here">   
                            </div>

                            <div class="Addressgroup">
                                <label for="Address">User Address</label>
                                <textarea name="user_address" style="height:125px" class="form-control" placeholder="Enter Address Here"></textarea>     
                            </div>
                            <br>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>

                            </div>

                        </form>  
                    </div>

                </div>

            </div>
        </div>
        </div>


    </body>
</html>
