<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/jiyeonCommon.css">


    <style>

        .wrap {
            margin-top: 150px !important;
        }

        .content-container {
            position: relative;
        }

        .content-container .main-title {
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            border-bottom: 2px solid rgb(75, 73, 73);
            padding: 0 20px 15px;
            width: fit-content;
            margin: 20px auto 30px;
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
            bottom: -15%;
            left: 50%;
            transform: translateX(-50%);
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
    </style>
</head>

<body>
    <%@ include file="../include/header.jsp" %>

    <div class="wrap">

        <div class="content-container">

            <form action="/horror/community/modify" method="post">

                <input type="hidden" name="boardNo" value="${board.boardNo}">

                <h1 class="main-title">${board.boardNo}번 게시물</h1>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                        value="${board.writer}" maxlength="7">
                </div>
                <div class="mb-3">
                    <label for="category-input category-box" class="form-label">카테고리</label>
                    <c:forEach var="ctgr" items="${ctgrList}">
                        <lable for="category_${ctgr.code}">
                            <input type='radio' id="category_${ctgr.code}" class="form-check-input" name='category' value="${ctgr.code}" ${ctgr.code == board.category ? 'checked' : ''} >${ctgr.codeNm}
                        </lable>
                    </c:forEach>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput2" class="form-label">글제목</label>
                    <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목" name="title"
                        value="${board.title}">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <textarea name="content" class="form-control" id="exampleFormControlTextarea1"
                        rows="10">${board.content}</textarea>
                </div>


                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="mod-btn" type="submit" class="btn btn-warning btn-lg m-2">완료</button>
                    <button id="to-list" type="button" class="btn btn-dark btn-lg m-2">목록</button>
                </div>

            </form>

        </div>

        <%@ include file="../include/footer.jsp" %>

    </div>

    <script>

        // 목록버튼 이벤트
        const $toList = document.getElementById('to-list');
        $toList.onclick = e => {
            location.href = '/horror/community/list';
        };
    </script>


</body>

</html>