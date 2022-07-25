<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        width: 1000px;
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
    .menu{
        width: 50%;
        height: 350px;
        flex:1;
        border: 1px solid #fff;
    }

    header .box {
  display: none;
  height: 40px;
  line-height: 40px;
  margin: 0 80px;
  padding: 10px;
}

header .box > ul {
  display: flex;
}

header .box > ul li {
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
}

#overlay {
  background: #000;
  bottom: 0;
  height: 100%;
  left: 0;
  opacity: 0;
  overflow: hidden;
  position: fixed;
  right: 0;
  top: 0;
  visibility: hidden;
  width: 100%;
  z-index: 99;
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

html.active #overlay {
  opacity: .65;
  visibility: visible;
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

.menu > a{
    width: 100px;
    height: 100px;
    background: #000;
}

</style>

<body>
    <header>
        <div class="inner-header">
            <h1 class="logo">
                <a href="#">
                    <img src="img/logo.png" alt="로고이미지">
                </a>
            </h1>
            <h2 class="intro-text">Welcome</h2>
            <a href="#" class="menu-open">
                <span class="menu-txt">MENU</span>
                <span class="lnr lnr-menu"></span>
            </a>
        </div>

        <nav class="gnb">
            <a href="#" class="close">
                <span class="lnr lnr-cross"></span>
            </a>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Work</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#">Favorite</a></li>
            </ul>
        </nav>
    </header>
    <div id="navBox">
        <div class="menu1">
            <div class="community menu"></div>
            <div class="media menu"></div>
        </div>
        <div class="menu2">
            <div class="spot menu"><a href="/horror/spot"></a></div>
            <div class="calendar menu"></div>
        </div>
    </div>

</body>

</html>