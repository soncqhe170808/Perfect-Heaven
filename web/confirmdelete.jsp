<%-- 
    Document   : confirmdelete
    Created on : Mar 1, 2023, 4:20:30 PM
    Author     : FPT
--%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    animalInfo ai = (animalInfo)request.getAttribute("dea");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styling.css"/>
    </head>
    <body>
        <div>
            <h1>Found Animal's Info</h1>
            <table>
                <tr>
                    <th>id</th>
                    <th>type</th>
                    <th>gender</th>
                    <th>dateOfBirth</th>
                    <th>weight</th>
                    <th>price</th>
                    <th class="description">Description</th>
                    <th>img</th>
                </tr>

                <tr>
                    <td><%=ai.getId()%></td>
                    <td><%=ai.getType()%></td>
                    <td><%=ai.getGender()%></td>
                    <td><%=ai.getDob()%></td>
                    <td><%=ai.getWeight()%></td>
                    <td><%=ai.getPrice()%></td>
                    <td class="description"><%=ai.getDescription()%></td>
                    <td><img src="<%=ai.getImgPath()%>" alt="alt"/></td>
                </tr>

            </table>
        </div>
        <div>
            <a href="delete2?id=<%=ai.getId()%>">Confirm Deletion</a>
        </div>
        <div>
            <a href="index.html">Back to homepage</a>
        </div>
    </body>
</html>
