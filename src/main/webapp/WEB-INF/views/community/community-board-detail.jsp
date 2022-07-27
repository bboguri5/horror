<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/jiyeonCommon.css">

    <style>
        .wrap {
            margin-top: 150px !important;
        }

        .hidden {
            display: none;
        }

        .content-container {
            width: 100%;
            /* margin: 150px auto; */
            /* position: relative; */
        }

        .content-container .main-title {
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            border-bottom: 2px solid rgb(75, 73, 73);
            padding: 0 20px 15px;
            width: fit-content;
            margin: 20px 0 40px;
        }

        .content-container .main-content {
            border: 2px solid #ccc;
            border-radius: 20px;
            padding: 10px 25px;
            font-size: 1.1em;
            text-align: justify;
            min-height: 400px;
        }

        .board-container {
            position: relative;
        }

        .board-container .button-group {
            position: absolute;
            /* bottom: 93%; */
            top: 0;
            right: 0;
        }


        /* 카테고리 */
        .category-box {
            margin-top: 25px;
        }

        .form-label {
            margin-right: 15px;
        }

        .form-check-input {
            margin-right: 5px;
        }


        /* 댓글 작성칸 */
        .reply-container {
            color: #000;
        }
        .commentBox {
            display: inline-flex;
        }

        .fa-solid {
            flex: 0.3;
        }

        .form-control {
            flex: 1;
        }


    </style>
</head>

<body>
    <%@ include file="../include/header.jsp" %>

    <div class="wrap">

        <div class="content-container">
            <div class="board-container">
                <h1 class="main-title">${b.boardNo}번 게시물</h1>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                        value="${b.writer}" disabled>
                </div>
                <div class="mb-3 category-box">
                    <label for="category-input" class="form-label">카테고리</label>
                    <c:forEach var="ctgr" items="${ctgrList}">
                        <lable for="category_${ctgr.code}">
                            <input type='radio' id="category_${ctgr.code}" class="form-check-input" name='category'
                                value="${ctgr.code}" disabled ${ctgr.code==b.category ? 'checked' : '' }>${ctgr.codeNm}
                        </lable>
                    </c:forEach>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput2" class="form-label">글제목</label>
                    <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목" name="title"
                        value="${b.title}" disabled>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>

                    <p class="main-content">
                        ${b.content}
                    </p>
                </div>

                <!-- 버튼 그룹 -->
                <div class="button-group" role="group">
                    <c:choose>
                        <c:when test="${flag}">
                            <button id="mod-btn" type="button" class="btn btn-warning btn-lg m-2">수정</button>
                            <button id="del-btn" type="button" class="btn btn-danger btn-lg m-2">삭제</button>
                            <button id="list-btn" type="button" class="btn btn-dark btn-lg m-2">목록</button>
                            <button id="like-btn" type="button" class="btn btn-warning btn-lg m-2 hidden"><i class="fa-solid fa-heart-circle-plus"></i></button>
                        </c:when>
                        <c:when test="${user eq b.id}">
                            <button id="mod-btn" type="button" class="btn btn-warning btn-lg m-2">수정</button>
                            <button id="del-btn" type="button" class="btn btn-danger btn-lg m-2">삭제</button>
                            <button id="list-btn" type="button" class="btn btn-dark btn-lg m-2">목록</button>
                            <button id="like-btn" type="button" class="btn btn-warning btn-lg m-2 hidden"><i class="fa-solid fa-heart-circle-plus"></i></button>
                        </c:when>
                        <c:otherwise>
                            <button id="mod-btn" type="button" class="btn btn-warning btn-lg m-2 hidden">수정</button>
                            <button id="del-btn" type="button" class="btn btn-danger btn-lg m-2 hidden">삭제</button>
                            <button id="list-btn" type="button" class="btn btn-dark btn-lg m-2" data-aaa="${user}" data-aaewfwefaa="${b.id}">목록</button>
                            <button id="like-btn" type="button" class="btn btn-warning btn-lg m-2"><i class="fa-solid fa-heart-circle-plus"></i></button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>



            <!-- 댓글 -->
            <div class="reply-container">
                <!-- 댓글 입력 창 -->
                <div class="card mb-2">
                    <div class="card-header bg-light">
                        <i class="fa fa-comment fa"></i> 댓글
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <div class="form-inline mb-2">
                                    <label for="replyId" class="commentBox">
                                        <i class="fa-solid fa-circle-user fa-2x"></i>
                                        <input type="text" class="form-control ml-2" id="replyId" value="${user}" disabled>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <textarea id="replyContent" class="form-control" rows="3"
                                    placeholder="댓글을 입력해 주세요."></textarea>
                            </li>
                            <li>
                                <button type="button" id="btnReg_reply" class="btn btn-dark mt-3">등록</button>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- 댓글 목록 창 -->
                <div class="card mb-2">
                    <div class="card-header bg-light">
                        <i class="fa fa-comment fa"></i> 댓글 목록
                    </div>
                    <div id="replyBody" class="card-body p-4">
                        <c:forEach var="rply" items="${rplyList}">
                            <ul data-replyNo="${rply.replyNo}">
                                <li>${rply.id}</li>
                                <li>${rply.regDate}</li>
                                <li class="list-group-item" data-initvalue="${rply.content}">${rply.content}</li>
                                <li>
                                    <c:choose>
                                        <c:when test="${flag}">
                                            <div class="reply_initMode">
                                                <button class="mod_reply" type="button">수정</button>
                                                <button class="del_reply" type="button">삭제</button>
                                            </div>
                                            <div class="reply_modifyMode hidden">
                                                <button class="save_reply" type="button">저장</button>
                                                <button class="cancel_reply" type="button">취소</button>
                                            </div>
                                        </c:when>
                                        <c:when test="${user eq rply.id}">
                                            <div class="reply_initMode">
                                                <button class="mod_reply" type="button">수정</button>
                                                <button class="del_reply" type="button">삭제</button>
                                            </div>
                                            <div class="reply_modifyMode hidden">
                                                <button class="save_reply" type="button">저장</button>
                                                <button class="cancel_reply" type="button">취소</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!--Do Nothing-->
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div> <!-- end reply container  -->
        </div> <!-- end content container  -->
        <%@ include file="../include/footer.jsp" %>
    </div>


<script>
        const [$modBtn, $delBtn, $listBtn, $likeBtn] = [...document.querySelector('div[role=group]').children];

        const $btnReg_reply = document.getElementById('btnReg_reply');

        // const $modBtn = document.getElementById('mod-btn');
        //수정 버튼
        $modBtn.onclick = e => {
            location.href = '/horror/community/modify?boardNo=${b.boardNo}';
        };

        //삭제 버튼
        $delBtn.onclick = e => {
            if (!confirm('정말 삭제하시겠습니까?')) {
                return;
            }
            location.href = '/horror/community/delete?boardNo=${b.boardNo}';
        };

        //목록 버튼
        $listBtn.onclick = e => {
            location.href = '/horror/community/list?pageNum=${p.pageNum}&amount=${p.amount}';
        };

        //좋아요 버튼
        $likeBtn.onclick = e => {

            fetch("/horror/community/like", {
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        "id": '${user}',
                        "boardNo": "${b.boardNo}"
                    })
                })
                .then((response) => response.json())
                .then((data) => alert(data.message))
                .catch((error) => console.log("error:", error));
            console.log($id.value);
        };

        //댓글 등록 버튼
        $btnReg_reply.onclick = e => {

            const $replyContent = document.getElementById('replyContent');

            fetch("/horror/community/reply", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        "id": '${user}',
                        "boardNo": "${b.boardNo}",
                        "content": $replyContent.value
                    })
                })
                .then((response) => response.json())
                .then((data) => {
                    // 댓글 그리기
                    drawReplyHtml(data);

                    // 댓글 내용 초기화
                    $replyContent.value = "";
                    location.href = '/horror/community/content/${b.boardNo}';
                   
                })
                .catch((error) => console.log("error:", error));
            
            
        };

        // 댓글 그리기
        function drawReplyHtml(dataList) {

            // 댓글 목록을 표현할 태그 가져오기
            const $replyBody = document.getElementById('replyBody');

            // 태그 수동으로 만들기
            let li = '';
            let ul = '';
            for (var data of dataList) {
                li = '';
                li += makeLiTag(data.id);
                li += makeLiTag(data.regDate);
                li += makeLiTag_content(data.content);
                li += makeLiTag_last();

                ul += makeUlTag(data.replyNo, li);
            }

            // 최종 완성한 태그 입력
            $replyBody.innerHTML = ul;

            // 추가된 댓글 등록 버튼들에 onClick 이벤트 연결하기
            const $reply_delButtons = document.querySelectorAll('.del_reply');
            $reply_delButtons.forEach(button =>
                button.addEventListener('click', event => {
                    const boardNo = "${b.boardNo}";
                    const replyNo = event.target.parentElement.parentElement.parentElement.getAttribute('data-replyno');

                    // 삭제 요청
                    fetch(`/horror/community/reply/\${boardNo}/\${replyNo}`, {
                            method: "DELETE"
                        })
                        .then((response) => response.json())
                        .then((data) => {
                            if (data.STATUS === "OK") {
                                // 삭제 성공한 ul 태그 삭제
                                event.target.parentElement.parentElement.parentElement.remove();
                            }
                        })
                        .catch((error) => console.log("error:", error));
                })
            );

            // 추가된 댓글 수정 버튼들에 onClick 이벤트 연결하기
            const $reply_modButtons = document.querySelectorAll('.mod_reply');
            $reply_modButtons.forEach(button =>
                button.addEventListener('click', event => {
                    const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                    // 댓글 모드 switching
                    toggleReplyMode($content);
                })
            );

            // 추가된 댓글 취소 버튼들에 onClick 이벤트 연결하기
            const $reply_cancelButtons = document.querySelectorAll('.cancel_reply');
            $reply_cancelButtons.forEach(button =>
                button.addEventListener('click', event => {
                    const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                    // 취소 클릭 시, 원래 데이터로 원복
                    $content.innerHTML = $content.getAttribute('data-initvalue');

                    // 댓글 모드 switching
                    toggleReplyMode($content);
                })
            );

            // 추가된 댓글 저장 버튼들에 onClick 이벤트 연결하기
            const $reply_saveButtons = document.querySelectorAll('.save_reply');
            $reply_saveButtons.forEach(button =>
                button.addEventListener('click', event => {
                    const boardNo = "${b.boardNo}";
                    const replyNo = event.target.parentElement.parentElement.parentElement.getAttribute('data-replyno');
                    const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                    // 수정 요청
                    fetch('/horror/community/reply/', {
                            method: "PUT",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify({
                                "boardNo": boardNo,
                                "replyNo": replyNo,
                                "content": $content.innerHTML
                            })
                        })
                        .then((response) => response.json())
                        .then((data) => {
                            if (data.status === "OK") {
                                // 댓글 모드 switching
                                toggleReplyMode($content, data.message)
                                .then(alert);

                                // 저장되었으니 data-initvalue도 변경해주자
                                $content.setAttribute('data-initvalue', $content.innerHTML);
                            }
                        })
                        .catch((error) => console.log("error:", error));
                })
            );

            // li 태그 만들기
            function makeLiTag(value) {
                return '<li>' + value + '</li>';
            }

            // li content 태그 만들기
            function makeLiTag_content(value) {
                return `<li class="list-group-item" data-initvalue="\${value}">` + value + '</li>';
            }

            // li 마지막 태그 만들기
            function makeLiTag_last() {
                var tagString = '';
                tagString += '<li>';
                tagString += '<div class="reply_initMode">';
                tagString += '<button class="mod_reply" type="button">수정</button>';
                tagString += '<button class="del_reply" type="button">삭제</button>';
                tagString += '</div>';
                tagString += '<div class="reply_modifyMode hidden">';
                tagString += '<button class="save_reply" type="button">저장</button>';
                tagString += '<button class="cancel_reply" type="button">취소</button>';
                tagString += '</div>';
                tagString += '</li>';
                                   
                return tagString;
            }

            // ul 태그 만들기
            function makeUlTag(replyNo, value) {
                // JSP 에서 '백틱-템플릿리터럴'이 동작하게 하려면 \ 역슬러쉬를 추가해줘야함.
                return `<ul data-replyno="\${replyNo}">` + value + '</ul>';
            }
        }

        // 추가된 댓글 삭제 버튼들에 onClick 이벤트 연결하기
        const $reply_delButtons = document.querySelectorAll('.del_reply');
        $reply_delButtons.forEach(button =>
            button.addEventListener('click', event => {
                const boardNo = "${b.boardNo}";
                const replyNo = event.target.parentElement.parentElement.parentElement.getAttribute('data-replyno');

                // 삭제 요청
                fetch(`/horror/community/reply/\${boardNo}/\${replyNo}`, {
                        method: "DELETE"
                    })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data.STATUS === "OK") {
                            // 삭제 성공한 ul 태그 삭제
                            event.target.parentElement.parentElement.parentElement.remove();
                        }
                    })
                    .catch((error) => console.log("error:", error));
            })
        );

        // 추가된 댓글 수정 버튼들에 onClick 이벤트 연결하기
        const $reply_modButtons = document.querySelectorAll('.mod_reply');
        $reply_modButtons.forEach(button =>
            button.addEventListener('click', event => {
                const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                // 댓글 모드 switching
                toggleReplyMode($content);
            })
        );

        // 추가된 댓글 취소 버튼들에 onClick 이벤트 연결하기
        const $reply_cancelButtons = document.querySelectorAll('.cancel_reply');
        $reply_cancelButtons.forEach(button =>
            button.addEventListener('click', event => {
                const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                // 취소 클릭 시, 원래 데이터로 원복
                $content.innerHTML = $content.getAttribute('data-initvalue');

                // 댓글 모드 switching
                toggleReplyMode($content);
            })
        );

        // 추가된 댓글 저장 버튼들에 onClick 이벤트 연결하기
        const $reply_saveButtons = document.querySelectorAll('.save_reply');
        $reply_saveButtons.forEach(button =>
            button.addEventListener('click', event => {
                const boardNo = "${b.boardNo}";
                const replyNo = event.target.parentElement.parentElement.parentElement.getAttribute('data-replyno');
                const $content = event.target.parentElement.parentElement.parentElement.querySelector('li.list-group-item');

                // 수정 요청
                fetch('/horror/community/reply/', {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "boardNo": boardNo,
                            "replyNo": replyNo,
                            "content": $content.innerHTML
                        })
                    })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data.status === "OK") {
                            // 댓글 모드 switching
                            toggleReplyMode($content, data.message)
                            .then(alert);

                            // 저장되었으니 data-initvalue도 변경해주자
                            $content.setAttribute('data-initvalue', $content.innerHTML);
                        }
                    })
                    .catch((error) => console.log("error:", error));
            })
        );

        // 댓글 모드 전환
        async function toggleReplyMode($content, message) {

            // 저장, 취소 버튼 show <-> hide
            const $saveReply = $content.parentElement.querySelector('.reply_modifyMode');
            $saveReply.classList.toggle('hidden');

            // 수정, 삭제 버튼 hide <-> show
            const $cancleReply = $content.parentElement.querySelector('.reply_initMode');
            $cancleReply.classList.toggle('hidden');

            $content.toggleAttribute('contenteditable');

            if( message !== null && message !== undefined ) {
                return message;
            }
        }
    </script>
</body>
</html>