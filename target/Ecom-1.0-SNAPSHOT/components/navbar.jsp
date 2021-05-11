<%@page import="java.util.List"%>
    <%@page import="com.learn.Ecom.entities.Category"%>
        <%@page import="com.learn.Ecom.entities.Category"%>
            <%@page import="com.learn.Ecom.dao.CategoryDao"%>
                <%@page import="com.learn.Ecom.helper.FactoryProvider"%>
                    <%@page import="com.learn.Ecom.entities.User"%>
                        <%
    User user1 = (User) session.getAttribute("current-user");
%>

                            <nav class="navbar navbar-expand-lg navbar-light custom-bg">
                                <div class="container">
                                    <a class="navbar-brand" href="index.jsp">ClickToBuy</a>
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav mr-auto">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="about.jsp">About</a>
                                            </li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                                                <%
                    CategoryDao cndao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> cnlist=cndao.getCategories();
                    %>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        <% for(Category c:cnlist){ %>
                                                            <a href="#" class="list-group-item list-group-item-action">
                                                                <%= c.getCategoryTitle() %>
                                                            </a>
                                                            <% } %>
                                                    </div>
                                            </li>
                                        </ul>

                                        <ul class="navbar-nav ml-auto">

                                            <li class="nav-item active">
                                                <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
                                                    <i class="fa fa-shopping-cart" style="font-size:22px;">
                                                    </i>
                                                    <span>(0)</span>

                                                </a>
                                            </li>



                                            <%
                    if (user1 == null) {
                %>
                                                <li class="nav-item active">
                                                    <a class="nav-link" href="login.jsp">Login</a>
                                                </li>
                                                <li class="nav-item active">
                                                    <a class="nav-link" href="register.jsp">Register</a>
                                                </li>

                                                <%
                } else if (user1.getUserType().equals("admin")) {
                %>
                                                    <li class="nav-item active">
                                                        <a class="nav-link" href="admin.jsp">
                                                            <%=user1.getUserName()%>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item active">
                                                        <a class="nav-link" href="LogoutServlet">Logout</a>
                                                    </li>
                                                    <%

                } else if (user1.getUserType().equals("normal")) {
                %>
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="normal.jsp">
                                                                <%=user1.getUserName()%>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="LogoutServlet">Logout</a>
                                                        </li>
                                                        <%

                    }
                %>





                                        </ul>
                                    </div>
                                </div>
                            </nav>