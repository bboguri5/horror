<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .frame01 {
            display: flex;
            justify-content: space-between;
        }

        .content-container {
            width: 60%;
            margin: 150px auto;
            position: relative;
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

        .titleBox,
        .countryBox {
            width: 48%;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <div class="content-container">
            <form action="/horror/spot_board/${arg}" method="post">
                <c:if test="${arg eq 'modify'}">
                    <input type="hidden" name="spotNo" value="${spotNo}">
                </c:if>
                <div class="frame01">
                    <div class="mb-3 titleBox">
                        <label for="exampleFormControlInput1" class="form-label ">명칭</label>
                        <input type="text" class="form-control title" id="exampleFormControlInput1" placeholder="명칭"
                            name="title" value="${s.title}" >
                    </div>
                    <div class="mb-3 countryBox">
                        <label for="exampleFormControlInput2" class="form-label ">국가</label>
                        <input type="text" class="form-control country" id="exampleFormControlInput2" placeholder="국가"
                            name="country" value="${s.country}" >
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput3" class="form-label ">주소</label>
                    <input type="text" class="form-control address" id="exampleFormControlInput3" placeholder="주소"
                        name="address" value="${s.address}" >
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <textarea name="content" class="main-content form-control" id="exampleFormControlTextarea1"
                        rows="10">${s.content}</textarea>
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="mod-btn" type="submit" class="btn btn-warning">완료</button>
                    <button id="to-list" type="button" class="btn btn-dark">목록</button>
                </div>
            </form>

        </div>
    </div>

</body>
<script>

      //목록버튼 이벤트
      const $toList = document.getElementById('to-list');
        $toList.onclick = e => {
            location.href = '/horror/spot_board/spot';
        };
</script>
</html>