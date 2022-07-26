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
                        margin: 90px auto 150px;
                        font-size: 1.2em;
                        padding-top: 100px !important;

                    }

                    .write-container form div {
                        color: rgb(182, 10, 10);
                        font-weight: 400;
                        font-family: 'horror';
                        font-size: 30px;
                        text-shadow: 4px 5px 7px red;
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
                        margin-top: 20px;
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
                        background: rgb(13, 54, 239);
                        width: 200px;
                        font-family: 'horror';
                        color: white;
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

                    <form id="write-form" action="/recboard/recwrite" method="post" autocomplete="off">

                        <div class="writer-title">
                            <div class="mb-3">
                                <label for="writerInput" class="form-label writerForm">Writer</label>
                                <input type="text" class="form-control c-white" id="writerInput" placeholder="이름"
                                    name="writer" maxlength="10">
                            </div>

                            <div class="mb-3">
                                <label for="titleInput" class="form-label titleForm">Title</label>
                                <input type="text" class="form-control c-white" id="titleInput" placeholder="제목"
                                    name="title">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Content</label>
                            <textarea name="content" class="form-control contentInput c-white"
                                id="exampleFormControlTextarea1" rows="10"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Img</label>
                            <input name="img" class="form-control imgInput c-white" id="exampleFormControlInput2"
                                placeholder="이미지 링크 주소">
                        </div>



                        <ul class="btn-box">
                            <li>
                                <button id="reg-btn" class="btn-dark" type="button">Completion </button>
                            </li>
                            <li>
                                <button id="to-list" class="btn-warning" type="button">List</button>
                            </li>
                        </ul>

                    </form>

                </div>


            </div>

            <div class="right-img">
                <img class="horror-img" src="https://t.pimg.jp/077/322/588/1/77322588.jpg" alt="공포이미지"
                    style="object-fit: cover;">
            </div>


            <script>

                //목록버튼 이벤트
                const $toList = document.getElementById('to-list');
                $toList.onclick = e => {
                    location.href = '/recboard/reclist';
                };

                //게시물 입력값 검증 함수
                function validateFormValue() {
                    // 이름입력, 제목입력 태그
                    const $writerInput = document.getElementById('writerInput');
                    const $titleInput = document.getElementById('titleInput');

                    let flag = false; // 입력을 제대로 하면 true로 변경

                    console.log('w: ', $writerInput);
                    console.log('t: ', $titleInput);

                    if ($writerInput.value.trim() === '') {
                        alert('작성자는 필수 입력 사항입니다.');
                    } else if ($titleInput.value.trim() === '') {
                        alert('제목은 필수 입력 사항입니다.');
                    } else {
                        flag = true;
                    }

                    console.log('flag:', flag);

                    return flag;
                }

                // // 게시물 입력값 검증 교재
                //     const $regBtn = document.getElementById('reg-btn');
                //     $regBtn.onclick = e => {
                //     // 입력값을 제대로 채우지 않았는지 확인
                //        if(!validateFormValue()) {               
                //            return;
                //         } 

                //     // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                //     const $form = document.getElementById('write-form');
                //     $form.submit();
                // };        


                // 게시물 입력값 검증 문제
                const $regBtn = document.getElementById('reg-btn');
                $regBtn.onclick = e => {
                    // 입력값을 제대로 채웠는지 확인
                    console.log($regBtn);

                    if (!validateFormValue()) {
                        alert('필수 입력 사항을 다 입력했는지 확인해주세요.');
                        return;
                    }

                    //필수 입력사항을 잘 입력했으면 폼을 서브밋한다.
                    const $form = document.getElementById('write-form');
                    console.log($form);
                    $form.submit();

                };

            </script>

        </body>

        </html>