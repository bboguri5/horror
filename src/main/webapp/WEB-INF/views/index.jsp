<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="./include/static-head.jsp" %>
</head>

<style>
    body {
        position: relative;
    }

    #navBox {
        position: absolute;
        transform: translate(-50%, -50%);
        height: 700px;
        width: 800px;
        left: 50%;
        top: 450px;
        background: orange;
        border: 2px solid #fff;
    }

    .menu1 {
        height: 350px;
        display: flex;
        justify-content: space-between;
    }

    .menu2 {
        height: 350px;
        display: flex;
        justify-content: space-between;
    }

    .menu {
        width: 50%;
        height: 350px;
        flex: 1;
        border: 1px solid #fff;

        /* 컨텐츠 가운데 */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .menu a {
        width: 350px;
        height: 300px;
        display: block;
        background: #000;
    }

    .community a:hover {
        transform: scale(3);
        position: absolute;
        top: 200px;
        left: 200px;
        z-index: 1;
    }

    .media a:hover {
        background: gray;
    }

    .spot a:hover {
        background: yellow;
    }

    .calendar a:hover {
        background: brown;
    }



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
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
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
    }
</style>

<body>
    <header>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#">community</a>
            <a href="#">media</a>
            <a href="#">spot</a>
            <a href="#">calendar</a>
        </div>

        <span class="menuOpen" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>


    </header>
    <div id="navBox">
        <div class="menu1">
            <div class="community menu"><a href="/horror/community/list"></a></div>
            <div class="media menu"><a href="/recboard/reclist"></a></div>
        </div>
        <div class="menu2">
            <div class="spot menu"><a href="/horror/spot_board/spot"></a></div>
            <div class="calendar menu"><a href="/horror/calendar_board/list"></a></div>
        </div>
    </div>

</body>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

    const $menu = document.querySelector('.community a');
    console.log($menu);

    const $body = document.querySelector('body');
    console.log($body);

    // 이미지 이벤트
    $menu.addEventListener('mouseover', function () {

        $menu.style.background =
            'url("https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210826_289%2F1629968179395714ar_JPEG%2F4uz7e2y_202182520622762357.jpg&type=a340") no-repeat';


    });
</script>

</html>