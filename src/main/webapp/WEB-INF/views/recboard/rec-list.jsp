<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">


        <head>
            <%@ include file="../include/static-head.jsp" %>
                <script src="https://kit.fontawesome.com/67b3cf67f9.js" crossorigin="anonymous"></script>


                <style>
                     @font-face {
                    font-family: 'horror';
                    src: url('/youmurdererbb_reg.ttf') format('truetype');
                }

                    
                    ul {
                        padding: 0;
                    }

                    body {
                        background: #000;

                    }

                    h1.title {

                        width: 1200px;
                        font-weight: 300;
                        /* background: green;   */
                        margin: 50px auto 50px;
                        text-align: center;
                        font-size:90px;
                        color: rgb(234, 10, 10);
                        font-family: 'horror';
                        text-shadow: 4px 5px 7px red;



                    }

                    .container2 {
                        width: 1650px;
                        /* border: 1px solid #fff; */
                        /* background: green; */
                        margin: 150px auto 0;
                    }


                    .clearfix::after {
                        content: '';
                        display: block;
                        clear: both;
                    }


                    .box {
                        /* background: yellow; */
                        width: 400px;
                        height: 600px;
                        float: left;
                        margin-bottom: 10px;
                        margin-left: 10px;
                        /* border: 2px solid #ffa; */
                        color: #fff;


                    }

                    .box:nth-child(4n+1) {
                        /* float 해제 */
                        clear: both;
                        right: 10px;
                    }



                    .container2 .img-box {

                        width: 400px;
                        height: 400px;
                        /* background: #000; */
                        margin-bottom: 10px;
                    }

                    .container2 .img-box img {
                        width: 98%;
                    }

                    .box li:last-child {

                        /* background: #fff; */
                    }

                    /* 게시판 출력 내용 */
                    /* 글번호 */
                    .box .board-li {
                        font-size: 15px;
                        margin-bottom: 20px;

                    }

                    /* 글제목 */
                    .box .title-li{
                        font-size: 25px;
                        margin-bottom: 30px;
                    }
                    
                    .good-box {
                        display: flex;
                    }
                    
                    .good-box li:last-child {
                        margin-left: 10px;
                        
                        /* background: green; */
                    }
                    
                    .fa-brands{
                        margin-left: 20px;
                    }

                    .writer-date {
                        display: flex;
                        margin-bottom: 5px;
                    }

                    .writer-date li:last-child {
                        margin-left: 100px;

                    }

                    .bottom-section {
                        /* background: yellow; */
                        position: relative;
                        display: flex;
                        justify-content: center;
                    }


                    /* 게시글 쓰기 버튼 */

                    .btn-write {
                        /* background: green; */
                        position: absolute;
                        right: 50px;

                    }



                    .pagination-custom a {
                        color: #444 !important;
                    }

                    .pagination-custom li.active a,
                    .pagination-custom li:hover a {
                        background: #333 !important;
                        color: #fff !important;
                    }

                    /* 검색/조회되는 게시물 수 관리 영역 */
                    .top-section {
                        display: flex;
                        margin-bottom: 20px;
                    }


                    /* 검색창 */
                    .search {
                        display: flex;
                        margin: 0 auto;
                    }

                    .search form {
                        display: flex;
                    }

                    .search form .form-select {
                        width: 150px;
                        margin-right: 10px;
                        font-size: 20px;
                        font-weight: 700;
                        background: #000;
                        color: #fff;
                    }


                    .search form .form-control {
                        width: 800px;
                        background: #000;
                        color: #fff;
                        margin-right: 10px;
                    }

                    .btn.btn-primary {
                        background: #000;
                        border: #000;
                    }

                    /* 조회되는 게시물수 조정 버튼 */
                    ul.amount {
                        display: flex;
                        position: absolute;
                        right: 50px;

                    }

                    ul.amount li {
                        margin-left: 10px;
                        background: #000;

                    }

                    /* 페이지  */
                    nav.page-box {
                        margin-top: 25px;
                    }

                    nav.page-box ul li {
                        margin-right: 25px;
                    }

                    .pagination-lg .page-link {
                        padding: 0.75rem 1.5rem;
                        font-size: 1.5rem;
                        font-weight: 700;
                    }

                    /* 카테고리별 게시물수 조회 버튼 */
                    ul.category {
                        display: flex;
                        position: absolute;
                        left: 650px;
                        top: 260px;

                    }

                    ul.category li {
                        margin-left: 20px;
                        background: #000;

                    }
                </style>
        </head>


        <body>

            <div class="wrapper">

                <h1 class="title"> Horror Movie / content Recommend Board </h1>

                <!-- 검색 / 조회되는 게시물 수 관리 영역 -->

                <div class="top-section">

                    <!-- 게시물 카테고리별 검색 -->
                    <ul class="category">
                        <li><a class="btn btn-danger"
                                href="/recboard/reclist?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}&type=title&keyword=예능">#예능</a>
                        </li>
                        <li><a class="btn btn-danger"
                                href="/recboard/reclist?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}&type=title&keyword=드라마">#드라마</a>
                        </li>
                        <li><a class="btn btn-danger"
                                href="/recboard/reclist?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}&type=title&keyword=영화">#영화</a>
                        </li>
                        <li><a class="btn btn-danger"
                                href="/recboard/reclist?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}&type=title&keyword=다큐">#다큐</a>
                        </li>
                        <li><a class="btn btn-danger"
                                href="/recboard/reclist?pageNum=${pm.page.pageNum}&amount=${pm.page.amount}">#전체목록보기</a>
                        </li>
                    </ul>


                    <!-- 검색창 영역 -->
                    <div class="search">

                        <form action="/recboard/reclist" method="get">

                            <select class="form-select" name="type" id="search-type">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="writer">작성자</option>
                                <option value="tc">제목+내용</option>
                            </select>

                            <input type="text" class="form-control" name="keyword" value="${recs.keyword}">

                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>

                        </form>

                    </div>

                    <!-- 조회되는 게시물 수 -->
                    <ul class="amount">
                        <li><a class="btn btn-danger" href="/recboard/reclist?amount=8">8개</a></li>
                        <li><a class="btn btn-danger" href="/recboard/reclist?amount=16">16개</a></li>
                        <li><a class="btn btn-danger" href="/recboard/reclist?amount=32">32개</a></li>
                        <li><a class="btn btn-danger" href="/recboard/reclist?amount=64">64개</a></li>
                    </ul>
                </div>

                <div class="container2 articles clearfix">

                    <c:forEach var="b" items="${bList}">
                        <ul class="box">
                            <li>
                                <div class="img-box" style="overflow: hidden; ">
                                    <img class="horror-img" src="${b.img}" alt="공포이미지" style="object-fit: cover;">
                                </div>
                            </li>
                            <li data-board-num="${b.boardNo}" class="board-li">${b.boardNo}번 게시물 </li>

                            <c:choose>
                                <c:when test="${b.newArticle}">
                                    <span class="badge rounded-pill bg-danger">new</span> <li class="title-li" style="margin-bottom : 5px">${b.shortTitle}</li>
                                </c:when>

                                <c:otherwise>
                                    <li class="title-li">${b.shortTitle}</li>
                            </c:otherwise>
                            </c:choose>


                            <!-- <c:if test="${b.newArticle}"> 
                                <span class="badge rounded-pill bg-danger">new</span> <li class="title-li">${b.shortTitle}</li>
                            </c:if>
                            <li class="title-li">${b.shortTitle}</li> -->



                            <div class="writer-date">
                                <li>작성자 : ${b.writer}</li>
                                <li>${b.prettierDate}</li>
                            </div>
                            <div class="good-box">
                                <li>조회수 : ${b.viewCnt}</li>

                                <a href="/recboard/reclikeup?boardNo=${b.boardNo}"> 
                                    <i class="fa-brands fa-gratipay"></i> </a>
                                <li> 좋아요 : ${b.goodCnt}</li>
                            </div>
                        </ul>
                    </c:forEach>

                </div>

                <div class="bottom-section">

                    <!-- 페이지 버튼 영역 -->
                    <nav class="page-box" aria-label="Page navigation example">
                        <ul class="pagination pagination-lg pagination-custom">

                            <c:if test="${pm.prev}">
                                <li class="page-item">
                                    <a class="page-link"
                                        href="/recboard/reclist?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}"
                                        aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/recboard/reclist?pageNum=${n}&amount=${pm.page.amount}">${n}</a></li>
                            </c:forEach>

                            <c:if test="${pm.next}">
                                <li class="page-item">
                                    <a class="page-link"
                                        href="/recboard/reclist?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}"
                                        aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>


                        </ul>
                    </nav>


                    <!-- 게시글작성 버튼 영역 -->
                    <div class="btn-write">
                        <a class="btn btn-outline-danger btn-lg" href="/recboard/recwrite">게시글 작성</a>
                    </div>

                </div>


            </div>

            <script>

                function fixSearchOption() {
                    const $select = document.getElementById('search-type');

                    for (let $opt of [...$select.children]) {
                        if ($opt.value === '${recs.type}') {
                            $opt.setAttribute('selected', 'selected');
                            break;
                        }
                    }
                }


                function alertServerMessage() {
                    const msg = '${msg}';
                    console.log(msg);
                    if (msg == 'reg-success') {
                        alert('게시물이 정상적으로 등록 되었습니다.')
                    }
                }


                function detailEvent() {
                    const $div = document.querySelector(".articles");
                    console.log($div);

                    $div.addEventListener('click', e => {
                        console.log(e.target);
                        if (!e.target.matches('.articles img')) return;

                        console.log('img 클릭됨 -', e.target);

                        let bn = e.target.parentElement.parentElement.parentElement.firstElementChild.nextElementSibling.dataset.boardNum;

                        console.log('글번호:', + bn);

                        location.href = '/recboard/reccontent/' + bn;
                        // + "?pageNum=${pm.page.pageNum}"
                        // + "&amount=${pm.page.amount}";
                    });
                }

                function appendPageActive() {
                    const curPageNum = '${pm.page.pageNum}';
                    console.log("현재 페이지 :", curPageNum);

                    const $ul = document.querySelector('.pagination');

                    for (let $li of [...$ul.children]) {
                        if (curPageNum === $li.dataset.pageNum) {
                            $li.classList.add('active');
                            break;
                        }
                    }
                }

                (function () {

                    detailEvent();
                    alertServerMessage();
                    appendPageActive();
                    fixSearchOption();

                })();

            </script>

        </body>

        </html>