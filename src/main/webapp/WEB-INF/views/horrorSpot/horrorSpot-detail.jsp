<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
</head>
<style>



</style>
<body>

    <div class="wrap">

        <div class="content-container">

            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">명칭</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="명칭" name="title"
                    value="${s.title}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput2" class="form-label">국가</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="국가" name="country"
                    value="${s.country}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput3" class="form-label">주소</label>
                <input type="text" class="form-control" id="exampleFormControlInput3" placeholder="주소" name="address"
                    value="${s.address}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                <p class="main-content">
                    ${s.content}
                </p>

            </div>

            <div class="btn-group btn-group-lg custom-btn-group" role="group" >
                <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                <button id="list-btn" type="button" class="btn btn-dark">목록</button>
            </div>

        </div>


    </div>


    <script>
        const [$modBtn, $delBtn, $listBtn] 
           = [...document.querySelector('div[role=group]').children];

        // const $modBtn = document.getElementById('mod-btn');
        //수정버튼
        $modBtn.onclick = e => {
            location.href = '/board/modify?boardNo=${b.boardNo}';
        };

        //삭제버튼
        $delBtn.onclick = e => {
            if(!confirm('정말 삭제하시겠습니까?')) {
                return;
            }
            location.href = '/board/delete?boardNo=${b.boardNo}';
        };
        //목록버튼
        $listBtn.onclick = e => {
            location.href = '/board/list?pageNum=${p.pageNum}&amount=${p.amount}';
        };

     
    </script>

</body>

</html>