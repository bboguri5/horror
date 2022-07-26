<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>

    <div class="wrap">

        <div class="content-container">

            <form action="/recboard/recmodify" method="post">

                <input type="hidden" name="boardNo" value="${board.boardNo}">

                <h1 class="main-title">${board.boardNo}번 게시물</h1>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                        maxlength="10" value="${board.writer}">
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
                    <button id="mod-btn" type="submit" class="btn btn-warning">완료</button>
                    <button type="button" class="btn btn-dark">목록</button>
                </div>

            </form>

        </div>

    </div>



</body>
</html>