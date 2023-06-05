<%-- 
    Document   : bill
    Created on : Mar 4, 2023, 4:32:52 PM
    Author     : FPT
--%>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    users x = (users)request.getSession().getAttribute("currUser");
    String Uname = x.getName();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=Uname%></h1>
    </body>
</html>
