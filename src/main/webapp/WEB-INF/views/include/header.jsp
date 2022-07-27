<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
                /* side bar */
                .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                right: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 30px;
                color: #818181;
                display: block;
                transition: 0.3s;
                /* font-family: 'horror'; */
                /* letter-spacing: 4px; */
                font-family: 'horror';
                letter-spacing: 4px;
                text-shadow: 4px 5px 7px red;
            }


            .sidenav a:hover {
                color: #f1f1f1;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }

                .sidenav a {
                    font-size: 18px;
                }
            }

            .menuOpen {
                position: absolute;
                top: 20px;
                right: 20px;
                color: #fff;
                font-family: 'horror';
                letter-spacing: 4px;
                text-shadow: 4px 5px 7px red;
            }
</style>
<!-- header -->
<header>
    <input type="text" id="userID" value="fffff">
    <header>
        <div id="mySidenav" class="sidenav">
            <a href="/logout">logout</a>

            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="/horror/community/list">community</a>
            <a href="/recboard/reclist">media</a>
            <a href="/horror/spot_board/spot">spot</a>
            <a href="/horror/calendar_board/list">calendar</a>
        </div>

        <span class="menuOpen" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>


    </header>
</header>

<script>
     function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
</script>
<!-- //header -->

