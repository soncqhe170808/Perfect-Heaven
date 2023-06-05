<%-- 
    Document   : personalPage
    Created on : Mar 6, 2023, 9:56:39 AM
    Author     : FPT
--%>
<%@page import="java.util.List"%>
<%@page import="model.users"%>
<%@page import="model.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    users currUser = (users)request.getSession().getAttribute("currUser");
    List<Bill> bList = (List<Bill>) request.getAttribute("billList"); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
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
                flex-direction: column
            }

            .personalIcon{
                margin: 0 auto;
                text-align: center;
            }
            .personalIcon img{
                border:  pink dashed 8px;
                border-radius: 100%;
            }



            .button-42 {
                background-color: initial;
                background-image: linear-gradient(-180deg, #FF7E31, #E62C03);
                border-radius: 6px;
                box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
                color: #FFFFFF;
                cursor: pointer;
                display: inline-block;
                font-family: Inter,-apple-system,system-ui,Roboto,"Helvetica Neue",Arial,sans-serif;
                height: 40px;
                line-height: 40px;
                outline: 0;
                overflow: hidden;
                padding: 0 20px;
                pointer-events: auto;
                position: relative;
                text-align: center;
                touch-action: manipulation;
                user-select: none;
                -webkit-user-select: none;
                vertical-align: top;
                white-space: nowrap;
                width: 100%;
                z-index: 9;
                border: 0;
                transition: box-shadow .2s;
            }

            .button-42:hover {
                box-shadow: rgba(253, 76, 0, 0.5) 0 3px 8px;
            }


        </style>
        <style>
            /* Style the container holding the footer */
            .footer {
                background-color: rgb(27,31,35);
                color: #fff;
                padding: 0px;
                display: flex;
                position: relative;
                top: 47px;
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
                margin-top: 20px;
                border:  pink dashed 8px;
                border-radius: 100%;
            }
        </style>
        <style>
            .table-wrapper {
                overflow-x: auto;
                max-width: 100%;
                margin-bottom: 5rem;
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
            #pa{
                
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
            .transactionList{
                display: flex;
                justify-content: center;
                align-content: center;

            }
            .chao1{
                width: 700px;
                justify-content: center;
                align-content: center;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <div class="col-lg-2 personalIcon">
            <img src="img/tempAvatar.jpg" alt="alt" class="img-fluid img-responsive rounded-circle"/>
            <h1><%=currUser.getName()%></h1>
            <% 
             if(currUser.getRole() == 1){
            %>
            <h1>(admin)</h1>
            <% 
             }
            %>
        </div>
        <%
            if(bList==null||bList.size()==0){
        %>
        <img style="width: 300px; height: auto; margin: 0 auto" src="img/emptyBox.jpg" alt="empty"/>
        <h1 style="text-align: center; margin-bottom: 30px">No transaction have been made just yet</h1>      
        <%
            }else{

        %>
        <div class="transactionList">
            <div class="chao1">
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Transaction Id</th>
                                <th>Transaction value</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>


                            <%
                     for(Bill b: bList){
                            %>
                            <tr>
                                <td><%=b.getBId()%></td>
                                <!-- add total value attribute to the database -->
                                <td><%=b.getTotalValue()%></td>
                                <td><a href="billdetail?bid=<%=b.getBId()%>">Detail</a></td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <% 
             }

             if(currUser.getRole() == 1){


        %>
         <div class="transactionList" >
            <div  class="LogOutButton " style="width: 350px; margin: 10px auto">
                <button class="button-42" role="button">
                    <a href="list.jsp">
                        <div class="clickSpace">
                            <h4 style="color: white;text-decoration: none;">See the full List of items</h4>
                        </div>
                    </a></button>
            </div>
        </div>
       
          <div class="transactionList" >
            <div  class="LogOutButton " style="width: 350px; margin: 10px auto">
                <button class="button-42" role="button">  <a href="insert.html">
                        <div class="clickSpace">
                            <h4 style="color: white;text-decoration: none;">Insert a new animal to the database</h4>
                        </div>
                    </a></button>
            </div>
        </div>
        
        <%
            }
        %>


        <!-- HTML !-->



        <div class="transactionList" >
            <div  class="LogOutButton " style="width: 100px; margin: 10px auto">
                <button class="button-42" role="button">  <a href="logout">
                        <div class="clickSpace">
                            <h4 style="color: white;text-decoration: none;">Log Out</h4>
                        </div>
                    </a></button>
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
