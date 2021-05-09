<%-- 
    Document   : index
    Created on : Apr 28, 2021, 11:19:09 AM
    Author     : prakhar patidar
--%>

    <%@page import="com.learn.Ecom.helper.Helper"%>
        <%@page import="com.learn.Ecom.entities.Category"%>
            <%@page import="com.learn.Ecom.dao.CategoryDao"%>
                <%@page import="java.util.List"%>
                    <%@page import="com.learn.Ecom.dao.ProductDao"%>
                        <%@page import="com.learn.Ecom.entities.Product"%>
                            <%@page import="com.learn.Ecom.helper.FactoryProvider"%>
                                <%@page contentType="text/html" pageEncoding="UTF-8"%>
                                    <!DOCTYPE html>
                                    <html>

                                    <head>
                                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                        <title>ClickToBuy-Home</title>

                                        <%@include file="components/common_css_js.jsp" %>

                                    </head>

                                    <body>
                                        <%@include file="components/navbar.jsp" %>
                                            <div class="row mt-3 mx-5">
                                                <%
                                            ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist=pdao.getAllProducts();
                    
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist=cdao.getCategories();
                    %>



                                                    <!-- show category -->
                                                    <div class="col-md-2">

                                                        <div class="list-group mt-4">
                                                            <a href="#" class="list-group-item list-group-item-action active">
                                                            All Categories
                                                          </a>

                                                            <% for(Category c:clist){ %>
                                                                <a href="#" class="list-group-item list-group-item-action">
                                                                    <%= c.getCategoryTitle() %>
                                                                </a>
                                                                <% } %>
                                                        </div>


                                                    </div>

                                                    <!-- show product list -->
                                                    <div class="col-md-8">

                                                        <!-- row -->
                                                        <div class="row mt-4">
                                                            <!-- col 12 -->
                                                            <div class="col-md-12">
                                                                <!-- traversing product list -->
                                                                <div class="card-columns">
                                                                    <% for(Product p:plist){ %>

                                                                        <div class="card">
                                                                            <div class="container text-center">
                                                                                <img class="card-img-top m-3" style="max-height:270px;max-width:80%;width:auto;" src="img/products/<%= p.getpPhoto() %>" alt="Card image cap">
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <h5 class="card-title">
                                                                                    <%=p.getpName()%>
                                                                                </h5>

                                                                                <p class="card-text">
                                                                                    <%=Helper.getTenWords(p.getpDesc())%>
                                                                                </p>


                                                                            </div>
                                                                            <div class="card-footer">
                                                                                <button class="btn custom-bg">
                                                                                Add To Cart
                                                                            </button>

                                                                                <button class="btn btn-outline-primary">
                                                                                    &#8377 <%=p.getpPrice()%>
                                                                            </button>

                                                                            </div>

                                                                        </div>

                                                                        <%}%>

                                                                </div>

                                                            </div>



                                                        </div>


                                                    </div>
                                            </div>


                                    </body>

                                    </html>