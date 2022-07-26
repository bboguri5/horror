<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .content-container {
            width: 60%;
            margin: 150px auto;
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

        .board-container .custom-btn-group {
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

    <div class="wrap">
        <%@ include file="../include/header.jsp" %>

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
                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                    <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                    <button id="list-btn" type="button" class="btn btn-dark">목록</button>
                    <button id="like-btn" type="button" class="btn btn-warning">좋아요</button>
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
                                        <input type="text" class="form-control ml-2" id="replyId" placeholder="로그인 아이디"
                                            disabled value="">
                                        <!-- value = 로그인 한 아이디 값 -->
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
                <div class="card-body p-4">
                    <div class="d-flex flex-start">
                        <div>
                            <h6 class="fw-bold mb-1">Lara Stewart</h6>
                            <div class="d-flex align-items-center mb-3">
                                <p class="mb-0">
                                    March 15, 2021
                                    <span class="badge bg-success">Approved</span>
                                </p>
                                <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                <a href="#!" class="text-success"><i class="fas fa-redo-alt ms-2"></i></a>
                                <a href="#!" class="link-danger"><i class="fas fa-heart ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="card mb-2">
                    <div class="card-header bg-light">
                        <i class="fa fa-comment fa"></i> 댓글 목록
                    </div>
                    <div id="replyBody" class="card-body p-4">
                        <c:forEach var="rply" items="${rplyList}">
                            <ul data-replyNo="${rply.replyNo}">
                                <li>${rply.id}</li>
                                <li>${rply.regDate}</li>
                                <li>${rply.content}</li>
                                <li>
                                    <button class="del_reply" type="button">삭제</button>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>




                    <!-- <div class="card mb-2">
                            <div class="card-header bg-light">
                                <i class="fa fa-comment fa"></i> 댓글 목록
                            </div>
                            <div id="replyBody" class="card-body">
                                <c:forEach var="rply" items="${rplyList}">
                                    <ul data-replyNo="${rply.replyNo}">
                                        <li>${rply.id}</li>
                                        <li>${rply.regDate}</li>
                                        <li>${rply.content}</li>
                                        <li><button class="del_reply" type="button">삭제</button></li>
                                    </ul>
                                </c:forEach>
                            </div>
                        </div> -->
                </div>
            </div>

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

                const $id = document.getElementById('userID');

                fetch("/horror/community/like", {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "id": $id.value,
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

                const $id = document.getElementById('userID');
                const $replyContent = document.getElementById('replyContent');

                fetch("/horror/community/reply", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            "id": $id.value,
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
                    li += makeLiTag(data.content);
                    li += makeLiTag('<button class="del_reply" type="button">삭제</button>');

                    ul += makeUlTag(data.replyNo, li);
                }

                // 최종 완성한 태그 입력
                $replyBody.innerHTML = ul;

                // 입력한 태그의 버튼들에 onClick 이벤트 연결하기
                const $reply_delButtons = document.querySelectorAll('.del_reply');
                $reply_delButtons.forEach(button =>
                    button.addEventListener('click', event => {
                        const boardNo = "${b.boardNo}";
                        const replyNo = event.target.parentElement.parentElement.getAttribute(
                            'data-replyno');

                        // 삭제 요청
                        fetch(`/horror/community/reply/delete/\${boardNo}/\${replyNo}`, {
                                method: "DELETE"
                            })
                            .then((response) => response.json())
                            .then((data) => {
                                if (data.STATUS === "OK") {
                                    // 삭제 성공한 ul 태그 삭제
                                    event.target.parentElement.parentElement.remove();
                                }
                            })
                            .catch((error) => console.log("error:", error));
                    })
                );

                // li 태그 만들기
                function makeLiTag(value) {
                    return '<li>' + value + '</li>';
                }

                // ul 태그 만들기
                function makeUlTag(replyNo, value) {
                    // JSP 에서 '백틱-템플릿리터럴'이 동작하게 하려면 \ 역슬러쉬를 추가해줘야함.
                    return `<ul data-replyno="\${replyNo}">` + value + '</ul>';
                }
            }

            // 입력된 태그의 버튼들에 onClick 이벤트 연결하기
            const $reply_delButtons = document.querySelectorAll('.del_reply');
            $reply_delButtons.forEach(button =>
                button.addEventListener('click', event => {
                    const boardNo = "${b.boardNo}";
                    const replyNo = event.target.parentElement.parentElement.getAttribute('data-replyno');

                    // 삭제 요청
                    fetch(`/horror/community/reply/delete/\${boardNo}/\${replyNo}`, {
                            method: "DELETE"
                        })
                        .then((response) => response.json())
                        .then((data) => {
                            if (data.STATUS === "OK") {
                                // 삭제 성공한 ul 태그 삭제
                                event.target.parentElement.parentElement.remove();
                            }
                        })
                        .catch((error) => console.log("error:", error));
                })
            );
        </script>

</body>

</html>