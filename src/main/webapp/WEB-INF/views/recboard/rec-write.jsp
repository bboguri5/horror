<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .write-container {
            width: 50%;
            margin: 200px auto 150px;
            font-size: 1.2em;
        }
    </style>
</head>

<body>
    <div class="wrap">
      
        <div class="write-container">

            <form id="write-form" action="/recboard/recwrite" method="post" autocomplete="off">

                <div class="mb-3">
                    <label for="writerInput" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="writerInput" placeholder="이름"
                        name="writer" maxlength="20">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput2" class="form-label">이미지</label>
                    <input name="img" class="form-control" id="exampleFormControlInput2" placeholder="이미지 링크 주소">
                </div>
                <div class="mb-3">
                    <label for="titleInput" class="form-label">글제목</label>
                    <input type="text" class="form-control" id="titleInput" placeholder="제목" name="title">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
                </div>

                <div class="d-grid gap-2">
                    <button id="reg-btn" class="btn btn-dark" type="button">글 작성하기</button>
                    <button id="to-list" class="btn btn-warning" type="button">목록으로</button>
                </div>

            </form>

        </div>

      
    </div>


    <script>

        //목록버튼 이벤트
        const $toList = document.getElementById('to-list');
        $toList.onclick = e => {
            location.href = '/recboard/reclist';
        };

        //게시물 입력값 검증 함수
        function validateFormValue(){
            // 이름입력, 제목입력 태그
            const $writerInput = document.getElementById('writerInput');
            const $titleInput = document.getElementById('titleInput');

            let flag = false; // 입력을 제대로 하면 true로 변경

            console.log('w: ', $writerInput);
            console.log('t: ', $titleInput);

            if($writerInput.value.trim() ===''){
            alert('작성자는 필수 입력 사항입니다.');
            } else if($titleInput.value.trim() === ''){
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

            if(!validateFormValue()) {
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