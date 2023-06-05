<%-- 
    Document   : kartError
    Created on : Mar 9, 2023, 11:42:06 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String kartMess = (String)request.getAttribute("mess");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
            }
            
            div{
                height: 100vh;
                text-align: center;
                
            }
            a, h1{
                text-decoration: none;
                color: white;
                display: block;
                position: relative;
                top: 300px;
            }
            
        </style>
    </head>
    <body>
        <div>
            <h1><%=kartMess%></h1>
            <a href="index">Go back to the Home Page</a>
        </div>
    </body>
</html>
