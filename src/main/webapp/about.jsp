<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>

    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="text-center mt-5"><h1>Shop Online with Us.</h1>
            <h1> Till the World is Being Vaccinated...</h1></div>
        <div class="text-center mt-5">
        <iframe src="https://ourworldindata.org/grapher/share-people-fully-vaccinated-covid?tab=map&time=latest&country=~IND"  style="width: 60%; height: 600px; border: 0px none;"></iframe>
        </div> 
         
        <%@include file="components/common_modals.jsp"%>
    </body>

    </html>