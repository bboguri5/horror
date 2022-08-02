<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/jiyeonCommon.css">

    <style>
        .content-container {
            width: 70%;
            margin: 100px auto 100px;
            color: white;
        }

        .content-container .main-title {
            text-align: center;
        }

        .content-container .button {
            margin-top: 50px;
            text-align: center;
        }

        .content-container h1 {
            margin: 0 auto 50px;
            text-align: center;
        }

        .firstBox {
            display: flex;
            justify-content: space-between;
        }

        .month,
        .day,
        .time {
            margin-right: 5px;
        }

        .secondBox {
            display: flex;
            justify-content: space-between;
        }

        .channel,
        .genre,
        .limit {
            margin-right: 5px;
        }

        .thirdBox {
            display: flex;
            justify-content: space-between;
        }

        .title,
        .director,
        .movieTime {
            margin-right: 5px;
        }

        .uploaded-list {
            display: flex;
        }

        .img-sizing {
            display: block;
            width: 100px;
            height: 100px;
        }
        /* .hide {
            display: none;
        } */
    </style>

</head>

<body>
    <!-- header -->
    <%@ include file="../include/header.jsp" %>
    <!-- /header -->
    <div class="content-container">

        <h1 class="hide">${calendar.calendarNo}번</h1>
        <h1>영화 상세보기</h1>

        <div class="firstBox">
            <div class="month col-md-3 mb-3">
                <label for="month-input" class="form-label">월</label>
                <input type="text" class="form-control" id="month-input" placeholder="월" name="month"
                    value="${calendar.month}" disabled>
            </div>
            <div class="day col-md-3 mb-3">
                <label for="day-input" class="form-label">일</label>
                <input type="text" class="form-control" id="day-input" placeholder="일" name="day"
                    value="${calendar.day}" disabled>
            </div>
            <div class="time col-md-3 mb-3">
                <label for="time-input" class="form-label">시간</label>
                <input type="text" class="form-control" id="time-input" placeholder="시간" name="time"
                    value="${calendar.time}" disabled>
            </div>
        </div>

        <div class="secondBox">
            <div class="channel col-md-3 mb-3">
                <label for="channel-input" class="form-label">채널</label>
                <input type="text" class="form-control" id="channel-input" placeholder="채널" name="channel"
                    value="${calendar.channel}" disabled>
            </div>
            <div class="genre col-md-3 mb-3">
                <label for="genre-input" class="form-label">장르</label>
                <input type="text" class="form-control" id="genre-input" placeholder="장르" name="genre"
                    value="${calendar.genre}" disabled>
            </div>
            <div class="limit col-md-3 mb-3">
                <label for="limit-input" class="form-label">나이제한</label>
                <input type="text" class="form-control" id="limit-input" placeholder="나이제한" name="limit"
                    value="${calendar.limit}" disabled>
            </div>
        </div>

        <div class="thirdBox">
            <div class="title col-md-3 mb-3">
                <label for="title-input" class="form-label">제목</label>
                <input type="text" class="form-control" id="title-input" placeholder="제목" name="title"
                    value="${calendar.title}" disabled>
            </div>
            <div class="movieTime col-md-3 mb-3">
                <label for="movie-time-input" class="form-label">영상시간</label>
                <input type="text" class="form-control" id="movie-time-input" placeholder="영화시간" name="movieTime"
                    value="${calendar.movieTime}" disabled>
            </div>
            <div class="director col-md-3 mb-3">
                <label for="director-input" class="form-label">감독명</label>
                <input type="text" class="form-control" id="director-input" placeholder="감독명" name="director"
                    value="${calendar.director}" disabled>
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <p class="main-content">
                ${calendar.content}
            </p>

        </div>

        <!-- 파일 첨부 영역 -->
        <div class="form-group">
            <ul class="uploaded-list"></ul>
        </div>

        <div class="button">
            <div class="btn-group btn-group-lg custom-btn-group" role="group">
                <c:if test="${flag}">
                    <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                    <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                    <button id="list-btn" type="button" class="btn btn-dark">목록</button>
                </c:if>
            </div>
        </div>

    </div>

    <script>
        const [$modBtn, $delBtn, $listBtn] // 54줄 잡아옴 role이 group인애
        = [...document.querySelector('div[role=group]').children];

        // const $modBtn = document.getElementById('mod-btn');
        //수정버튼
        $modBtn.onclick = e => { // get임 post할려면 form써야됌
            location.href = '/horror/calendar_board/modify?calendarNo=${calendar.calendarNo}';
        };

        //삭제버튼
        $delBtn.onclick = e => {
            if (!confirm('정말 삭제하시겠습니까?')) {
                return;
            }
            location.href = '/horror/calendar_board/delete?calendarNo=${calendar.calendarNo}';
        };
        //목록버튼
        $listBtn.onclick = e => { // page에서 pagenum/ amount/ 잊지않기위해쓴다//pageNum=${p.pageNum}&amount=${p.amount}
            location.href = '/horror/calendar_board/list?';
        };
    </script>

    <script>
        // start JQuery 
        $(document).ready(function () {

            function isImageFile(originFileName) {
                //정규표현식 / $는 머머로 끝나는 / 저거 3개로끝나면 true / i는 대소문자구분 x 대문자 JPG등 도 걸림
                const pattern = /jpg$|gif$|png$/i;
                return originFileName.match(pattern);
            }

            // 파일의 확장자에 따른 렌더링 처리
            function checkExtType(fileName) {

                // 원본 파일 명 추출
                let originFileName = fileName.substring(fileName.indexOf("_") + 1);

                // 확장자 추출후 이미지인지까지 확인
                if (isImageFile(originFileName)) { // 파일의 이미지라면

                    const $img = document.createElement('img');
                    $img.classList.add('img-sizing');
                    $img.setAttribute('src', '/loadFile?fileName=' + fileName); // 풀경로 컨트롤러/98줄
                    $img.setAttribute('alt', originFileName); // 풀경로에서 원본파일이름만뽑음
                    $('.uploaded-list').append($img);
                }
                // 이미지가 아니라면 다운로드 링크를 생성
                else {

                    const $a = document.createElement('a');
                    $a.setAttribute('href', '/loadFile?fileName=' + fileName) // loadFile하면 byte배열보내줌

                    const $img = document.createElement('img');
                    $img.classList.add('img-sizing');
                    $img.setAttribute('src', '/img/file_icon.jpg');
                    $img.setAttribute('alt', originFileName);

                    $a.append($img);
                    $a.innerHTML += '<span>' + originFileName + '</span>';

                    $('.uploaded-list').append($a);

                }

            }

            // 드롭한 파일을 화면에 보여주는 함수
            function showFileData(fileNames) {

                // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
                // 이미지면 썸네일을 렌덜이하고 아니면 다운로드 링크를 렌더링한다.
                for (let fileName of fileNames) {
                    checkExtType(fileName);
                }
            }

            // 파일 목록 불러오기
            function showFileList() {
                fetch('/horror/calendar_board/file/' + '${calendar.calendarNo}')
                    .then(res => res.json())
                    .then(fileNames => {
                        showFileData(fileNames);
                    });
            }

            showFileList();


        });
        // end jQuery
    </script>

</body>

</html>