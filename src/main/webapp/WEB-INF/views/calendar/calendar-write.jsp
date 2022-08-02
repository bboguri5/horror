<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/jiyeonCommon.css">

    <style>
        .write-container {
            width: 50%;
            margin: 100px auto 100px;
            font-size: 1.2em;
        }

        .write-container h1 {
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
        .movie-time {
            margin-right: 5px;
        }

        .fileDrop {
            width: 600px;
            height: 200px;
            border: 1px dashed gray;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5em;
        }

        .uploaded-list {
            display: flex;
        }

        .img-sizing {
            display: block;
            width: 100px;
            height: 100px;
        }
    </style>
</head>

<body>
    <!-- header -->
    <%@ include file="../include/header.jsp" %>
    <!-- /header -->
    <div class="wrap">

        <div class="write-container">

            <h1>영화 등록하기</h1>

            <form id="write-form" action="/horror/calendar_board/write" method="post" autocomplete="off" enctype="multipart/form-data">
                <!-- name은 calendar의 데이터이름 // name이 있어야 데이터를 옮긴다-->
                <div class="firstBox">
                    <div class="month col-md-3 mb-3">
                        <label for="month-input" class="form-label">월</label>
                        <input type="text" class="form-control" id="month-input" placeholder="0월" name="month">
                    </div>
                    <div class="day col-md-3 mb-3">
                        <label for="day-input" class="form-label">일</label>
                        <input type="text" class="form-control" id="day-input" placeholder="0일" name="day">
                    </div>
                    <div class="time col-md-3 mb-3">
                        <label for="time-input" class="form-label">시간</label>
                        <input type="text" class="form-control" id="time-input" placeholder="00:00" name="time">
                    </div>
                </div>

                <div class="secondBox">
                    <div class="channel col-md-3 mb-3">
                        <label for="channel-input" class="form-label">채널</label>
                        <input type="text" class="form-control" id="channel-input" placeholder="채널" name="channel">
                    </div>
                    <div class="genre col-md-3 mb-3">
                        <label for="genre-input" class="form-label">장르</label>
                        <input type="text" class="form-control" id="genre-input" placeholder="장르" name="genre">
                    </div>
                    <div class="limit col-md-3 mb-3">
                        <label for="limit-input" class="form-label">나이제한</label>
                        <input type="text" maxlength="2" class="form-control" id="limit-input"
                            placeholder="ex) 12/15/19/전" name="limit">
                    </div>
                </div>

                <div class="thirdBox">
                    <div class="title col-md-3 mb-3">
                        <label for="title-input" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title-input" placeholder="제목" name="title">
                    </div>
                    <div class="movieTime col-md-3 mb-3">
                        <label for="movie-time-input" class="form-label">영상시간</label>
                        <input type="text" class="form-control" id="movie-time-input" placeholder="00분"
                            name="movieTime">
                    </div>
                    <div class="director col-md-3 mb-3">
                        <label for="director-input" class="form-label">감독명</label>
                        <input type="text" class="form-control" id="director-input" placeholder="감독명" name="director">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="content-input" class="form-label">내용</label>
                    <textarea name="content" class="form-control" id="content-input" rows="10"></textarea>
                </div>

                <!-- 첨부파일 드래그 앤 드롭 영역 -->
                <div class="form-group">
                    <div class="fileDrop">
                        <span>Drop Here!!</span>
                    </div>
                    <div class="uploadDiv">
                        <input type="file" name="files" id="ajax-file" style="display:none;">
                    </div>
                    <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                    <div class="uploaded-list">

                    </div>
                </div>

                <div class="d-grid gap-2">
                    <button id="reg-btn" class="btn btn-dark" type="button">글 작성하기</button>
                    <button id="to-list" class="btn btn-warning" type="button">목록으로</button>
                </div>

            </form>

        </div>

    </div>


    <script>
        //월 일 변환함수
        function add() {
            const $monthInput = document.getElementById('month-input');
            const $dayInput = document.getElementById('day-input');
        }

        // 게시물 등록 입력값 검증 함수
        function validateFormValue() {
            // 이름입력태그, 제목 입력태그
            const $monthInput = document.getElementById('month-input');
            const $dayInput = document.getElementById('day-input');
            const $timeInput = document.getElementById('time-input');
            const $channelInput = document.getElementById('channel-input');
            const $genreInput = document.getElementById('genre-input');
            const $titleInput = document.getElementById('title-input');
            const $movieTimeInput = document.getElementById('movie-time-input');
            const $limitInput = document.getElementById('limit-input');
            const $directorInput = document.getElementById('director-input');
            const $contentInput = document.getElementById('content-input');
            let flag = false; // 입력 제대로하면 true로 변경

            console.log('month: ', $monthInput.value);
            console.log('day: ', $dayInput.value);
            console.log('time: ', $timeInput.value);
            console.log('channe: ', $channelInput.value);
            console.log('genre: ', $genreInput.value);
            console.log('title: ', $titleInput.value);
            console.log('title: ', $movieTimeInput.value);
            console.log('limit: ', $limitInput.value);
            console.log('director: ', $directorInput.value);
            console.log('content: ', $contentInput.textContent);

            if ($monthInput.value.trim() !== '월' &&
                (13 > $monthInput.value.trim() > 0)) {
                alert('(1~12)월 로 입력해주세요');
            } else if ($dayInput.value.trim() !== '일' &&
                (32 > $dayInput.value.trim() > 0)) {
                alert('(1~31)일 로 입력해주세요');
            } else if ($timeInput.value.trim() === '') {
                alert('시간은 필수값입니다~');
            } else if ($channelInput.value.trim() === '') {
                alert('채널은 필수값입니다~');
            } else if ($genreInput.value.trim() === '') {
                alert('장르는 필수값입니다~');
            } else if ($titleInput.value.trim() === '') {
                alert('제목은 필수값입니다~');
            } else if ($limitInput.value.trim() !== '전' &&
                $limitInput.value.trim() !== '12' &&
                $limitInput.value.trim() !== '15' &&
                $limitInput.value.trim() !== '19') {
                alert('전 or 12 or 15 or 19중 하나를 입력하세요');
            } else if ($movieTimeInput.value.trim() === '') {
                alert('영상시간은 필수값입니다~');
            } else if ($directorInput.value.trim() === '') {
                alert('감독명은 필수값입니다~');
            } else if ($contentInput.value.trim() === '') {
                alert('내용은 필수값입니다~');
            } else {
                flag = true;
            }

            console.log('flag:', flag);

            return flag;
        }

        // 게시물 입력값 검증
        const $regBtn = document.getElementById('reg-btn');

        $regBtn.onclick = e => {
            e.preventDefault(); // 고유동작을중지?
            console.log("글작성 클릭!");
            // 입력값을 제대로 채우지 않았는지 확인 / 바로 위
            if (!validateFormValue()) {
                return;
            }

            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $form = document.getElementById('write-form');
            $form.submit();
        };

        //목록버튼 이벤트
        const $toList = document.getElementById('to-list');
        $toList.onclick = e => {
            location.href = '/horror/calendar_board/list';
        };

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

                // hidden input을 만들어서 변환파일명을 서버로 넘김
                const $hiddenInput = document.createElement('input');
                $hiddenInput.setAttribute('type', 'hidden');
                $hiddenInput.setAttribute('name', 'fileNames');
                $hiddenInput.setAttribute('value', fileName); // 변해야돼기떄문에 ''붙이면안됌

                $('#write-form').append($hiddenInput);

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

            // 드롭한 파일
            function showFileData(fileNames) {

                // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
                // 이미지면 썸네일을 렌덜이하고 아니면 다운로드 링크를 렌더링한다.
                for (let fileName of fileNames) {
                    checkExtType(fileName);
                }
            }

            // drag & drop 이벤트
            const $dropBox = $('.fileDrop');

            // drag 진입 이벤트
            $dropBox.on('dragover dragenter', e => {
                e.preventDefault(); // 기본기능방지
                $dropBox
                    .css('border-color', 'red')
                    .css('background', 'lightgray');
            });

            // drag 탈출 이벤트
            $dropBox.on('dragleave', e => {
                e.preventDefault();
                $dropBox
                    .css('border-color', 'gray')
                    .css('background', 'transparent');
            });

            // drop 이벤트
            $dropBox.on('drop', e => {
                e.preventDefault(); // 이게있어야 안에넣엇을때 탭이안넘어감
                // console.log('드롭 이벤트 작동!');

                // 드롭된 파일 정보를 서버로 전송

                // 1. 드롭된 파일 데이터 읽기
                // console.log(e);

                const files = e.originalEvent.dataTransfer.files;
                // console.log('drop file data: ', files);

                // 2. 읽은 파일 데이터를 input[type-file]태그에 저장 / 59줄
                const $fileInput = $('#ajax-file');
                $fileInput.prop('files', files); // input에 파일정보를 담는다 /form태그라생각

                // console.log($fileInput);

                // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
                const formData = new FormData();

                // 4. 전송할 파일들을 전부 FormData안에 포장
                for (let file of $fileInput[0].files) {
                    formData.append('files', file); //controller 76줄에 감
                }

                // 5. 비동기 요청 전송
                const reqInfo = {
                    method: 'POST',
                    body: formData
                    // headers: { / form-data는 기본값이라서 굳이안써도됌
                    //     'content-type': 'multipart/form-data'
                    // }
                }
                fetch('/ajax-upload', reqInfo)
                    .then(res => {
                        // console.log(res.status);
                        return res.json();
                    })
                    .then(fileNames => { // 컨트롤러에서 파일보냄 res.json()가 fileNames
                        console.log(fileNames);

                        showFileData(fileNames);
                    });

            });


        });
        // end jQuery
    </script>

</body>

</html>