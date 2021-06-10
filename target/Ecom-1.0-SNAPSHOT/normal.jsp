<%@page import="com.learn.Ecom.entities.User"%>

    <%
User user=(User)session.getAttribute("current-user");

if(user==null){

    session.setAttribute("message","You are not Logged in! Login First");
    response.sendRedirect("login.jsp");
    return;
}
else if(user.getUserType().equals("admin")){
    session.setAttribute("message","You are Admin! Please Login in Admin Portal!");
    response.sendRedirect("login.jsp");
    return;
}


%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>User Page</title>
                <%@include file="components/common_css_js.jsp" %>
            </head>

            <body>
                <%@include file="components/navbar.jsp" %>
                <div class="text-center mt-5"><h1>Hey User, Shop Covid Essentials Here. Stay Healthy</h1></div>
                  <%@include file="components/common_modals.jsp"%>
                
            </body>

            </html>