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
                    <h1>Admin Page</h1>
            </body>

            </html>