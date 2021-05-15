<%
User user=(User)session.getAttribute("current-user");

if(user==null){

    session.setAttribute("message","You are not Logged in! Login First to Access Checkout Page");
    response.sendRedirect("login.jsp");
    return;
}
%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Checkout Page</title>
            <%@include file="components/common_css_js.jsp" %>
        </head>

        <body>
            <%@include file="components/navbar.jsp" %>
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h3 class="text-center mb-3">Your Selected Items:</h3>
                                    <div class="cart-body">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!--Form Details  -->
                            <div class="card">
                                <div class="card-body">
                                    <h3 class="text-center mb-3">Your Details For Order</h3>
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Your Name</label>
                                            <input value="<%= user.getUserName()%>" type="text" id="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Your Contact</label>
                                            <input value="<%= user.getUesrPhone()%>" type="number" id="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact Number">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                            <textarea value="<%= user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
                                        </div>


                                        <div class="container text-center">
                                            <button class="btn btn-outline-success mr-1">Order Now</button>
                                            <button class="btn btn-outline-primary">Continue Shopping</button>
                                        </div>


                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <%@include file="components/common_modals.jsp"%>
        </body>

        </html>