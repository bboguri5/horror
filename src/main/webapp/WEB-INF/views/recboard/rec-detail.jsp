<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>

                <style>
                    @font-face {
                        font-family: 'horror';
                        src: url('/youmurdererbb_reg.ttf') format('truetype');
                    }

                    body {
                        display: flex;
                        background: #000;
                    }

                    .wrap {
                        width: 72%;
                        height: 100vh;
                        background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0HVXA7rghXLJFhcyBHM7kCpekWzLJ_ZvCpw&usqp=CAU') no-repeat center / cover;
                        margin: 0 auto;
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


                    .content-container {
                        width: 60%;
                        margin-left: 120px;
                        /* position: relative; */
                    }

                    .main-title {
                        margin: 25px 0 30px 120px;
                        font-family: 'horror';
                        color: red;
                        text-shadow: 4px 5px 7px #41464b;
                        letter-spacing: 4px;
                        font-size: 70px;
                        font-weight: 700; 
                                                
                    }
                    
                    .writer-box {
                        display: flex;
                    }

                    .writer-label {
                        width: 100px;
                    }

                    .title-box{
                        display: flex;
                    }

                    .title-label{
                        width: 100px;
                    }



                    .content-container .main-content {
                        border: 2px solid #ccc;
                        border-radius: 20px;
                        padding: 10px 25px;
                        font-size: 1.1em;
                        text-align: justify;
                        min-height: 400px;
                        
                    }

                    .content-container .custom-btn-group {
                        position: absolute;
                        bottom: -10%;
                        left: 50%;
                        transform: translateX(-50%);
                    }

                    .btn.btn-yellow {
                        background: yellow;
                    }
                </style>
        </head>

        <body>
               <!-- header -->
    <%@ include file="../include/header.jsp" %>
    <!-- /header -->
            <div class="left-img">
                <img class="horror-img" src="https://t.pimg.jp/077/322/588/1/77322588.jpg" alt="공포이미지"
                    style="object-fit: cover;">
            </div>


            <div class="wrap">
                <h1 class="main-title">Board_Number : ${b.boardNo}</h1>
                <div class="content-container">

                    <div class="mb-3 writer-box">
                        <label for="exampleFormControlInput1" class="form-label writer-label">작성자</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름"
                            name="writer" value="${b.writer}" disabled>
                    </div>
                    <div class="mb-3 title-box">
                        <label for="exampleFormControlInput2" class="form-label title-label">글제목</label>
                        <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목"
                            name="title" value="${b.title}" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">내용</label>

                        <p class="main-content">
                            ${b.content}
                        </p>

                    </div>

                    <div class="btn-group btn-group-lg custom-btn-group" role="group">
                        <c:if test="${flag}">
                        <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                        <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                        </c:if>
                        <button id="list-btn" type="button" class="btn btn-dark">목록</button>
                        <button id="like-btn" type="button" class="btn btn-yellow">좋아요</button>
                    </div>

                </div>


            </div>

            <div class="right-img">
                <img class="horror-img" src="https://t.pimg.jp/077/322/588/1/77322588.jpg" alt="공포이미지"
                    style="object-fit: cover;">
            </div>



            <script>
                const [$modBtn, $delBtn, $listBtn, $likeBtn] = [...document.querySelector('div[role=group]').children];

                // const $modBtn = document.getElementById('mod-btn');
                //수정버튼
                $modBtn.onclick = e => {
                    location.href = '/recboard/recmodify?boardNo=${b.boardNo}';
                };

                //삭제버튼
                $delBtn.onclick = e => {
                    if (!confirm('정말 삭제하시겠습니까?')) {
                        return;
                    }
                    location.href = '/recboard/recdelete/${b.boardNo}';
                };
                //목록버튼
                $listBtn.onclick = e => {
                    location.href = '/recboard/reclist?pageNum=${p.pageNum}&amount=${p.amount}';
                };

                //좋아요버튼
                $likeBtn.onclick = e => {
                    location.href = '/recboard/reclikeup?boardNo=${b.boardNo}';
                }

            </script>

        </body>

        </html>