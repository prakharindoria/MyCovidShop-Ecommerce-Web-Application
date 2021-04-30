<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>

    <body>
        <%@include file="components/navbar.jsp" %>
            <div class="container-fluid">
                <div class="row mt-5">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">

                            <div class="card-header custom-bg">
                                <h3>Login</h3>
                            </div>
                            <div class="card-body px-3">
                                <%@include file="components/message.jsp" %>
                                    <form action="LoginServlet" method="post">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="container  text-center">
                                            <button type="submit" class="btn btn-outline-success mt-3">Submit</button>
                                            <button type="reset" class="btn btn-outline-warning mt-3 ml-3">Reset</button>
                                        </div>

                                        <a href="register.jsp" class="text-center d-block md-3 mt-3">New User? Create an Account</a>
                                    </form>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
    </body>

    </html>