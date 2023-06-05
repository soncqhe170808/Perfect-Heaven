<%-- 
    Document   : kart
    Created on : Mar 7, 2023, 8:45:01 PM
    Author     : FPT
--%>
<%@page import="java.util.List" %>
<%@page import="model.kart" %>
<%@page import="model.kartDao" %>
<%@page import="model.users" %>
<%@page import="model.animalInfo" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    users u = (users)request.getSession().getAttribute("currUser");
    if(u == null){
       response.setStatus(response.SC_MOVED_TEMPORARILY);
       response.setHeader("Location", "login.html");
       return;
    }
    String userName = u.getName();
    kartDao kd = new kartDao();
    List<animalInfo> inKartList = kd.getAnimalInKart(userName);

    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
        <style>
            /* Style the container holding the footer */
             .footer {
                background-color: rgb(27,31,35);
                color: #fff;
                padding: 0px;
                position: relative;
                top: 47px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            /* Style the logo in the footer */
            .footer .logo {
                width: 100%;

                font-size: 36px;
                font-weight: bold;
                color: #fff;

            }

            /* Style the links in the footer */
            .footer ul {
                list-style: none;
                margin: 0;
                padding: 0;
                display: flex;
            }

            .footer li {
                margin-right: 20px;
            }

            .footer a {
                color: #ccc;
                text-decoration: none;
                font-size: 16px;
            }
            body{
                display: flex;
                flex-direction: column;

            }
            .box{
                justify-content: center;
            }


            .personalIcon{

                margin: 0 auto;
                text-align: center;
            }
            .personalIcon img{
                margin-top: 10px;
                border:  pink dashed 8px;
                border-radius: 100%;
            }
        </style>
        <style>
            .table-wrapper {
                overflow-x: auto;
                max-width: 100%;
                margin-bottom: 1rem;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            th,
            td {
                padding: 0.5rem;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tbody tr:hover {
                background-color: #f5f5f5;
            }

            @media screen and (max-width: 600px) {
                table {
                    display: block;
                    overflow-x: auto;
                    white-space: nowrap;
                }

                th,
                td {
                    display: inline-block;
                    width: auto;
                }

                thead {
                    display: none;
                }

                tr {
                    border-bottom: 3px solid #ddd;
                    margin-bottom: 0.5rem;
                }
            }
            .chao2{width: 1300px;
               justify-content: center;
                align-content: center;
                margin: 0 auto;
                
            }
            .kartForm{
                                text-align: center;

                display: flex;
            }
            html{
                font-size: 200%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <div class="col-lg-2 personalIcon">
            <img src="img/tempAvatar.jpg" alt="alt" class="img-fluid img-responsive rounded-circle"/>
            <h1><%=u.getName()%></h1>
            <% 
             if(u.getRole() == 1){
            %>
            <h1>(admin)</h1>
            <% 
             }
            %>
        </div>
        <%
            if(inKartList==null||inKartList.size()==0){

        %>
        <img class="box" style="width: 300px; height: auto; margin: 0 auto;" src="img/emptyBox.jpg" alt="empty"/>
        <h1 style="text-align: center; margin-bottom: 30px">Empty Shopping Kart<br>Go back to the Home page to do some shopping ;)</h1>      
            <%
                }else{

            %>
        <div>
            <form  class="kartForm" action="buyfromkart" method="post">
                <div class="chao2">
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <tr>
                        <th>id</th>
                        <th>type</th>
                        <th>gender</th>
                        <th>date Of Birth</th>
                        <th>weight</th>
                        <th>price</th>
                        <th class="description">Description</th>
                        <th>img</th>  
                        <th>Buy</th>
                    </tr>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                        for(animalInfo ai:inKartList){
                    %>
                    <tr>
                        <td><%=ai.getId()%></td>
                        <td><%=ai.getType()%></td>
                        <td><%=ai.getGender()%></td>
                        <td><%=ai.getDob()%></td>
                        <td><%=ai.getWeight()%></td>
                        <td><%=ai.getPrice()%></td>
                        <td class="description"><%=ai.getDescription()%></td>
                        <td style="width: 15%;height: 100px;"> <img style="width: 100%;height: 100px;" src="<%=ai.getImgPath()%>" alt="alt"/></td>
                        <td style="text-align: center;">
                            <input type="checkbox" name="kartBill" value="<%=ai.getId()%>">
                        </td>
                    </tr>
                    <%
                        }

                    %>
                        </tbody>
                    </table>
                </div>
                
                <input id="payKart" type="submit" name="submit" value="Remove selected items from cart">
                <input id="payKart" type="submit" name="submit" value="Pay for the selected items?">
            </form>
        </div>
                                </div>

        <%
            }
        %>
        <div class="footer">
            <div class="logo"><img style="height: 100px;" src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894__340.png" alt="alt"/></div>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </body>
</html>
