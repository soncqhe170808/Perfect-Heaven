<%-- 
    Document   : individual
    Created on : Mar 1, 2023, 11:13:10 PM
    Author     : FPT
--%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    animalInfo ai = (animalInfo)request.getAttribute("ai");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styling2.css?version=6"/>
        <style>
            body{
                display: flex;
            }
            /* Style the container holding the footer */
            .footer {
                
                background-color: rgb(27,31,35);
                color: #fff;
                padding: 0px;
                position: relative;
                top: 200px;
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
    </head>
    <body > <jsp:include page="header.html"/>
        <div style="height: 70px;"></div>
        
        <div class="mainContent">
            <div class="wrapper">
                <div style="width: 40%;" class="left">
                    <img src="<%=ai.getImgPath()%>" alt="alt"/>

                </div>
                <div class="right" style="justify-content: center;">
                    <div>
                        <h3>Id: <%=ai.getId()%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h3>

                        <h3>Type: <%=ai.getType()%> </h3><br>
                        <h3 style="vertical-align: top">Gender: <%=ai.getGender()%>&nbsp;&emsp;&emsp;&emsp;&emsp;</h3>
                        <h3>DoB: <%=ai.getDob()%></h3><br>
                        <h3>Weight: <%=ai.getWeight()%>;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</h3>
                        <h3>Price: <%=ai.getPrice()%></h3><br>
                        <h3>Description: </h3>
                        <h3><%=ai.getDescription()%></h3>
                    </div><hr style="border:none;
                              height: 20px;
                              width: 75%;
                              height: 50px;
                              margin-top: 0;
                              border-bottom: 1px solid #cbcbcb;
                              box-shadow: 0 10px 10px -10px #cbcbcb;
                              margin: -50px auto 10px; ">
                    <a href="buy?aid=<%=ai.getId()%>">
                        <div class="buyButton">
                            <p>Buy</p>
                        </div>
                    </a>
                    <a href="kart?aid=<%=ai.getId()%>">
                        <div class="buyButton">
                            <p>Add to Kart</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="logo"><img style="height: 100px" src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894__340.png" alt="alt"/></div>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </body>
</html>
