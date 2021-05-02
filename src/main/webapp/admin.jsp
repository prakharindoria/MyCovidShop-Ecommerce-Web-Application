<%@page import="com.learn.Ecom.entities.User"%>

    <%
User user=(User)session.getAttribute("current-user");

if(user==null){

    session.setAttribute("message","You are not Logged in! Login First");
    response.sendRedirect("login.jsp");
    return;
}
else if(user.getUserType().equals("normal")){
    session.setAttribute("message","You are not Admin! Do not Access this Page!");
    response.sendRedirect("login.jsp");
    return;
}


%>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Admin Page</title>
                <%@include file="components/common_css_js.jsp" %>
            </head>

            <body>
                <%@include file="components/navbar.jsp" %>
                    <div class="container">
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <div>
                                            <img style="max-width:125px" class="img-fluid mb-1" src="img/group.png" alt="user_icon">
                                        </div>
                                        <h1>500</h1>
                                        <h1 class="text-muted">Users</h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <div>
                                            <img style="max-width:125px" class="img-fluid mb-1" src="img/list.png" alt="user_icon">
                                        </div>
                                        <h1>100</h1>
                                        <h1 class="text-muted">Categories</h1>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <div>
                                            <img style="max-width:125px" class="img-fluid mb-1" src="img/product.png" alt="user_icon">
                                        </div>
                                        <h1>1000</h1>
                                        <h1 class="text-muted">Products</h1>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <div>
                                                <img style="max-width:125px" class="img-fluid mb-1" src="img/keys.png" alt="user_icon">
                                            </div>
                                            <h1 class="text-muted">Add Category</h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <div>
                                                <img style="max-width:125px" class="img-fluid mb-1" src="img/plus.png" alt="user_icon">
                                            </div>
                                            <h1 class="text-muted">Add Product</h1>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
            </body>

            </html>