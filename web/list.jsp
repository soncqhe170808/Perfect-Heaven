<%-- 
    Document   : list
    Created on : Feb 28, 2023, 9:47:54 PM
    Author     : FPT
--%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    animalInfoDao aid = new animalInfoDao();
    List<animalInfo> list = aid.getAllAnimal();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .table-wrapper {
                overflow-x: auto;
                max-width: 100%;
                margin-bottom: 1rem;
            }

            table {
                text-align: center;
                border-collapse: collapse;
                width: 100%;
            }

            th,td {
                text-align: center !important;
                padding: 0.5rem;
                border-bottom: 1px solid #ddd;
            }

            .description{
                text-align: left !important;
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
                    width: 13%;
                    text-align: center;
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
            .chao2{
                width: 1300px;
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
        <div style="margin-top: 40px;">
            <form style="    font-size: 20px;
                  " class="kartForm" action="buyfromkart" method="post">
                <div class="chao2">
                    <div  class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                <tr>
                                    <th>id</th>
                                    <th>type</th>
                                    <th>gender</th>
                                    <th style="width: 15%">date Of Birth</th>
                                    <th>weight</th>
                                    <th>price</th>
                                    <th class="description">Description</th>
                                    <th>img</th>
                                    <th>Sold</th>
                                    <th>edit</th>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                       for(animalInfo ai:list){
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
                                    <td><%=ai.isSold()%></td>
                                    <td><a href="delete?id=<%=ai.getId()%>">delete</a></td>



                                </tr>
                                <%
                                    }

                                %>
                            </tbody>
                        </table>
                    </div>


            </form>
        </div>
    </div>




    <div class="backa">
        <a href="index">Back to home page</a>
    </div>
</body>
</html>
