<%-- 
    Document   : billDetail
    Created on : Mar 6, 2023, 11:43:01 AM
    Author     : FPT
--%>
<%@page import="java.util.*"%>
<%@page import="model.animalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<animalInfo> bdList = (List<animalInfo>)request.getAttribute("billAnimal"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styling.css"/>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <div>
            <table>
                <tr>
                    <th>id</th>
                    <th>type</th>
                    <th>gender</th>
                    <th>date Of Birth</th>
                    <th>weight</th>
                    <th>price</th>
                    <th class="description">Description</th>
                    <th>img</th>
                </tr>
                <%
                    for(animalInfo ai:bdList){
                %>
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
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
