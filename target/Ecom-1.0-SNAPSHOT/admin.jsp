<%@page import="java.util.List"%>
    <%@page import="com.learn.Ecom.helper.FactoryProvider"%>
        <%@page import="com.learn.Ecom.dao.CategoryDao"%>
            <%@page import="com.learn.Ecom.entities.Category"%>


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
                                <style>
                                    .admin .card:hover {
                                        background: #76ff03;
                                        cursor: pointer;
                                    }
                                </style>
                        </head>

                        <body>
                            <%@include file="components/navbar.jsp" %>
                                <div class="container admin">
                                    <div class="container fluid mt-3">
                                        <%@include file="components/message.jsp"%>
                                    </div>


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
                                                <div class="card" data-toggle="modal" data-target="#add-category-modal">
                                                    <div class="card-body text-center">
                                                        <div>
                                                            <img style="max-width:125px" class="img-fluid mb-1" src="img/keys.png" alt="user_icon">
                                                        </div>
                                                        <h1 class="text-muted">Add Category</h1>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card" data-toggle="modal" data-target="#add-product-modal">
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

                                <!--Add category modal-->
                                <!-- Modal -->
                                <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header custom-bg">
                                                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                     </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="ProductOperationServlet" method="post">
                                                    <input type="hidden" name="operation" value="addcategory">

                                                    <div class="form-group">
                                                        <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea style="height:250px" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                                                    </div>
                                                    <div class="container text-center">
                                                        <button class="btn btn-outline-success mr-2">Add Category</button>
                                                        <button type="button" class="btn btn-secondary ml-2" data-dismiss="modal">Close</button>
                                                    </div>

                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!--End category modal-->

                                <!--Add Product Modal-->
                                <!-- Modal -->
                                <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header custom-bg">
                                                <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                    </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="ProductOperationServlet" method="post">
                                                    <input type="hidden" name="operation" value="addproduct">

                                                    <div class="form-group">
                                                        <input type="text" class="form-control" name="proTitle" placeholder="Enter Product Title" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" name="proPrice" placeholder="Enter Product Price" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" name="proQuantity" placeholder="Enter Product Quantity" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" name="proDiscount" placeholder="Enter Product Discount" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea style="height:150px" class="form-control" placeholder="Enter Product Description" name="proDescription" required></textarea>
                                                    </div>
                                                    <!--product category-->
                                                    <%

                                                    CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                                                    List<Category> list= cdao.getCategories();
                                                    %>

                                                        <div class="form-group">
                                                            <label for="select">Select Product Category :</label>
                                                            <select name="proCategory" id="Select">
                                                <%
                                                for(Category category :list){

                                                %>
                                                
                                                    <option value="<%=category.getCategoryId()%>"><%=category.getCategoryTitle()%></option>

                                                <% } %>
                                                
                                              </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <form action="">
                                                                <label for="img">Select Product Image :</label>
                                                                <input type="file" id="img" name="proImage" required>
                                                            </form>
                                                        </div>

                                                        <div class="container text-center">
                                                            <button class="btn btn-outline-success mr-2">Add Product</button>
                                                            <button type="button" class="btn btn-secondary ml-2" data-dismiss="modal">Close</button>
                                                        </div>

                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!--End Product modal-->


                        </body>

                        </html>