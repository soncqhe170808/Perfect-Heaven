<%-- 
    Document   : userList
    Created on : Mar 1, 2023, 9:15:42 PM
    Author     : FPT
--%>

<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    animalInfoDao aid = new animalInfoDao();
    List<animalInfo> list = (List<animalInfo>)request.getAttribute("list");
    int count = aid.getCount();
    int pageCount = count / 12;
    if(count % 12 != 0){
        pageCount++;
    }
    int offset = (int)request.getAttribute("offSet");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styling2.css?version=15"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
        <style>

            body{

                background: linear-gradient(to right, #F5E3E6, #D9E4F5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            /* Style the container holding the carousel */
            .carousel {
                width: 100%;
                height: 400px;
                margin: auto;
                position: relative;
                overflow: hidden;
            }

            /* Style the images inside the carousel */
            .carousel img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0;
                transition: opacity 1s ease-in-out;
            }

            /* Show the first image when the page loads */
            .carousel img:first-child {
                opacity: 1;
            }

            /* Position the previous and next buttons */
            .prev,
            .next {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                font-size: 30px;
                font-weight: bold;
                color: white;
                cursor: pointer;
                z-index: 2;
            }

            /* Position the previous button on the left */
            .prev {
                left: 10px;
            }

            /* Position the next button on the right */
            .next {
                right: 10px;
            }

            .bar {
                width: 100%;
                height: 50px;
                background: linear-gradient(to right, #F5E3E6, #D9E4F5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                display: flex;
                justify-content: left;
                align-items: center;
                color: white;
                font-size: 24px;
                font-weight: bold;
                text-transform: uppercase;
                margin-bottom: 20px
            }

        </style>
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
            .filterForm{
                background-color: white;
                padding: 5px;
                border: 1px groove #00ffe5;
                box-shadow: 3px 3px 3px 3px #ccbcc6
            }

            .des{
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                width: 100%;

            }
        </style>


    </head>
    <body>

        <jsp:include page="header.html"/>
        <div class="carousel">
            <img class="img-fluid" src="https://png.pngtree.com/background/20210711/original/pngtree-pet-shop-adoption-cartoon-hand-painted-white-banner-picture-image_1079112.jpg" alt="Image 1" />
            <img class="img-fluid" src="img/4307681.png" alt="Image 2" />
            <img src="https://i.pinimg.com/originals/9d/57/79/9d57794f2f712286c13a400a5ec50db8.jpg" alt="Image 3" />


        </div>
        <div class="bar">
        </div>
        <div class="filterButton">
            <button onclick="changeVisOnClick()"><i class="fa fa-filter fa-2x"></i></button>
            <div class="filterSaerch" id="fs">

                <form action="filter" class="filterForm" method="post">
                    <h1 style="margin: 0">Filter</h1><br>
                    <label>Type </label><br>


                    <input style="display: none" type="checkbox" name="type" value="a" checked="true">
                    <div class="pretty p-icon p-round p-smooth p-plain">

                        <input type="checkbox" name="type" value="Dog" />
                        <div class="state p-success-o">
                            <i class="icon fa fa-check" aria-hidden="true"></i>
                            <label>dog</label>

                        </div>
                    </div><br>
                    <div class="pretty p-icon p-round p-smooth p-plain">

                        <input type="checkbox" name="type" value="Cat" />
                        <div class="state p-success-o">
                            <i class="icon fa fa-check" aria-hidden="true"></i>
                            <label>cat</label><br>

                        </div>
                    </div><br>
                    <div class="pretty p-icon p-round p-smooth p-plain">

                        <input type="checkbox" name="type" value="Bird" />
                        <div class="state p-success-o">
                            <i class="icon fa fa-check" aria-hidden="true"></i>
                            <label>bird</label><br>

                        </div>
                    </div><br>
                    <div class="pretty p-icon p-round p-smooth p-plain">

                        <input type="checkbox" name="type" value="Hamster" />
                        <div class="state p-success-o">
                            <i class="icon fa fa-check" aria-hidden="true"></i>
                            <label>Hamster</label><br>

                        </div>
                    </div><!-- comment --><br>
                    <div class="pretty p-icon p-round p-smooth p-plain">

                        <input type="checkbox" name="type" value="Fish" />
                        <div class="state p-success-o">
                            <i class="icon fa fa-check" aria-hidden="true"></i>
                            <label>Fish</label><br>

                        </div>
                    </div>
                    <br>
                    <label>Pirce range</label><br>
                    <div class="slidecontainer">
                        <input type="range" min="0" max="100" class="slider" id="myRange" name="priceRange">
                        <p>Value: <span id="demo"></span>USD</p>
                    </div>
                    <label>gender</label><br><br>
                    <input type="radio" name="gender" value="male">male
                    <input type="radio" name="gender" value="female">female
                    <input type="radio" name="gender" value="both" checked="true">both
                    <br>
                    <br>
                    <input type="submit" name="submit" value="search">
                </form>
            </div>
        </div>

        <div class="mainContent">

            <div class="list">
                <%
                    if(list == null||list.size()== 0){
                %>
                <h1>Cannot find the item that fit to your desription</h1>


                <%
                    }else{
                       for(animalInfo ai:list){
                %>



                <a class="animalCella card" href="individual?id=<%=ai.getId()%>&type=<%=ai.getType()%>&gender=<%=ai.getGender()%>&dob=<%=ai.getDob()%>&weight=<%=ai.getWeight()%>&price=<%=ai.getPrice()%>&description=<%=ai.getDescription()%>&path=<%=ai.getImgPath()%>&sold=<%=ai.isSold()%>">
                    <div class="animalCell card__inner">
                        <div class=" card__body card__body--front" >
                            <img src="<%=ai.getImgPath()%>" alt="goodImg"/>
                        </div>
                        <div style="text-align: left; margin-left: 20px" class=" card__body card__body--back">
                            <h5 >Price: <%=ai.getPrice()%>USD&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h5>
                            <h5 >Type: <%=ai.getType()%>&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h5>
                            <h5 >Gender: <%=ai.getGender()%>&ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h5>
                            <h5 class="des">Description: <%=ai.getDescription()%></h5>

                        </div>
                    </div>

                </a><!-- comment -->
                <%
                       }
                    }
                %>

            </div>
        </div>
        <div class="paging">
            <a href="index?offSet=<%=offset-12%>"><<</a>
            <%
                for(int i = 0; i < pageCount; i++){
            %>
            <a href="index?offSet=<%=i*12%>">&nbsp;<%=i+1%>&nbsp;</a>
            <%
                }
            %>
            <a href="index?offSet=<%=offset+12%>">>></a>
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
        <script>
            var slider = document.getElementById("myRange");
            var output = document.getElementById("demo");
            output.innerHTML = slider.value;

            slider.oninput = function () {
                output.innerHTML = this.value;
            }
            function changeVisOnClick() {
                var e = document.getElementById("fs");
                e.style.display = e.style.display != "none" ? "none" : "block";
            }
        </script>
        <script>
            var slideIndex = 1;
            showSlide(slideIndex);

            function nextSlide() {
                showSlide((slideIndex += 1));
            }

            function previousSlide() {
                showSlide((slideIndex -= 1));
            }

            function showSlide(n) {
                var slides = document.querySelectorAll(".carousel img");
                if (n > slides.length) {
                    slideIndex = 1;
                }
                if (n < 1) {
                    slideIndex = slides.length;
                }
                for (var i = 0; i < slides.length; i++) {
                    slides[i].style.opacity = 0;
                }
                slides[slideIndex - 1].style.opacity = 1;

                // Automatically move to the next slide every 3 seconds
                setTimeout(nextSlide, 3000);
            }
        </script>
    </body>
</html>
