<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>

                <!-- font -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">


                <style>
                    @font-face {
                        font-family: 'horror';
                        src: url('/youmurdererbb_reg.ttf') format('truetype');
                    }


                    body {
                        background: #000;

                        /* background-size: 50% 100%;
                        background-repeat: no-repeat; */
                    }

                    .c-white {
                        color: #fff !important;
                        font-family: 'Nanum Brush Script', cursive;
                        font-size: 25px;
                        letter-spacing: 3px;
                    }


                    .wrap {
                        width: 72%;
                        height: 100vh;
                        background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0HVXA7rghXLJFhcyBHM7kCpekWzLJ_ZvCpw&usqp=CAU') no-repeat center / cover;
                        margin: 0 auto;
                    }

                    .write-container {
                        width: 50%;
                        margin: 0px 50px 0px 190px !important;
                        font-size: 1.2em;
                        padding-top: 50px !important;

                    }

                    .write-container form div {
                        color: rgb(182, 10, 10);
                        font-weight: 400;
                        font-family: 'horror';
                        font-size: 30px;
                        text-shadow: 4px 5px 7px red;
                    }

                    .main-title {
                        margin: 5px 0 5px 120px;
                        font-family: 'horror';
                        color: red;
                        text-shadow: 4px 5px 7px #41464b;
                        letter-spacing: 4px;
                        font-size: 70px;
                        font-weight: 700;
                        width: 600px;
                    }

                    /* 작성자 - 글제목 */

                    #write-form {
                        color: white;
                        font-size: 15px;
                        font-weight: 500;
                    }

                    .writer-title {
                        display: flex;
                    }

                    .writer-title label {
                        width: 100px;
                    }

                    #writerInput {
                        width: 300px;
                        background: rgba(0, 0, 0, 0.2);
                    }

                    #titleInput {
                        width: 500px;
                        margin-left: 50px;
                        background: rgba(0, 0, 0, 0.2);
                    }

                    .contentInput,
                    .contentInput:focus {
                        width: 850px;
                        background: rgba(0, 0, 0, 0.2);
                    }

                    .imgInput,
                    .imgInput:focus {
                        width: 850px;
                        background: rgba(0, 0, 0, 0.2);
                    }

                    .titleForm {
                        margin-left: 50px;
                    }

                    ul.btn-box {
                        display: flex;
                        padding-left: 0;
                        margin-top: 120px;
                    }

                    #reg-btn {
                        background: rgb(214, 8, 8);
                        width: 200px;
                        font-family: 'horror';
                        text-shadow: 4px 5px 7px red;
                        font-size: 25px;
                        letter-spacing: 4px;
                    }

                    #to-list {
                        background: #adb5bd;
                        width: 200px;
                        font-family: 'horror';
                        color: #664d03;
                        text-shadow: 4px 5px 7px #41464b;
                        margin-left: 10px;
                        font-size: 25px;
                        letter-spacing: 3px;
                    }

                    #title {
                        width: 1050px;
                        height: 250px;
                        margin: 0 auto;

                    }

                    .title-img {
                        width: 100%;
                        height: 250px;
                        /* height: 100vh; */
                    }

                    .left-img {
                        width: 300px;
                        background: white;
                        margin: 0;
                        position: absolute;
                        top: 0;
                        left: 0;
                        height: 100vh;

                    }

                    .right-img {
                        width: 300px;
                        background: white;
                        position: absolute;
                        top: 0px;
                        right: 0px;
                        height: 100vh;

                    }

                    .horror-img {
                        width: 100%;
                        height: 100vh;
                    }

                    .write-container {
                        width: 50%;
                        margin: auto 150px;
                        font-size: 1.2em;
                        padding-top: 300px;
                    }

                    .custom-btn-group {
                        position: absolute;
                        bottom: -50px;
                        left: 50%;
                        transform: translateX(-50%);
                    }
                </style>
        </head>
        <!-- <h1 id="title">
            <img class="title-img"
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0HVXA7rghXLJFhcyBHM7kCpekWzLJ_ZvCpw&usqp=CAU"
                style="object-fit: cover;">
        </h1> -->

        <div class="left-img">
            <img class="horror-img" src="https://t.pimg.jp/077/322/588/1/77322588.jpg" alt="공포이미지"
                style="object-fit: cover;">
        </div>

        <body>
            <div class="wrap">

                <div class="write-container">

                    <h1 class="main-title">Board_Number : ${board.boardNo}</h1>

                    <form action="/recboard/recmodify" method="post">

                        <input type="hidden" name="boardNo" value="${board.boardNo}">

                        <div class="writer-title">
                            <div class="mb-3">
                                <label for="writerInput" class="form-label writerForm">Writer</label>
                                <input type="text" class="form-control c-white" id="writerInput" placeholder="이름"
                                    name="writer" maxlength="10" value="${board.writer}">
                            </div>

                            <div class="mb-3">
                                <label for="titleInput" class="form-label titleForm">Title</label>
                                <input type="text" class="form-control c-white" id="titleInput" placeholder="제목"
                                    name="title" value="${board.title}">
                            </div>



                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Content</label>
                            <textarea name="content" class="form-control contentInput c-white"
                                id="exampleFormControlTextarea1" rows="10">${board.content}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Img</label>
                            <input name="img" class="form-control imgInput c-white" id="exampleFormControlInput2"
                                placeholder="이미지 링크 주소" value="${board.img}">
                        </div>


                        <div class="btn-group btn-group-lg custom-btn-group" role="group">
                            <button id="mod-btn" type="submit" class="btn btn-warning">완료</button>
                            <button type="button" class="btn btn-dark">목록</button>
                        </div>

                    </form>

                </div>


            </div>

            <div class="right-img">
                <img class="horror-img" src="https://t.pimg.jp/077/322/588/1/77322588.jpg" alt="공포이미지"
                    style="object-fit: cover;">
            </div>

        </body>

        </html>