<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="../include/static-head.jsp" %>
<style>
    /* modal */
    #map {
        width: 700px;
        height: 500px;
        margin: 10px 0 10px 20px;
    }

    .frame01 {
        display: flex;
        justify-content: space-between;
        padding: 20px 20px 0 20px ;

    }

    .form-control.address {
        width: 100%;
    }

    .main-content {
        height: 300px;
        border: 2px solid #76787a;
        padding: 15px;
        border-radius: 10px;
    }

    .titleBox,
    .countryBox {
        width: 40%;
    }

    .modal-content {
        background: #323539;
        color: #fff;
        border: 2px solid #76787a;
    }

    .modal-body {
        overflow: auto;
    }

    .modal-body::-webkit-scrollbar {
        width: 20px;
        background-color: black;
        border-radius: 10px;
    }

    .modal-body::-webkit-scrollbar-thumb {
        background-color: #474646;
        border-radius: 10px;
    }

    .modal-body::-webkit-scrollbar-track {
        border-radius: 10px;
        background-color: grey;
        box-shadow: inset 0px 0px 5px white;
    }

    .addressBox,.contentBox
    {
        padding: 20px 20px 0 20px ;
    }

    .modal-title
    {
        margin-left: 30px;
    }

    /* page bottom menu */

    .bottom-section {
        display: flex;
        justify-content: center;
        margin-top: 100px;
    }

    .page-link {
        background: #323539;
        color: #fff;
        border: 2px solid #76787a;
    }

    /* admin tag */
    .ad {
        width: 300px;
        height: 300px;
        display: block;
        background: #fff;
    }

    #modifyBtn {
        margin-left: 30px;
    }

    .table>:not(caption)>*>* {
        padding:1rem 0rem 1rem 3rem;
    }

    #writeBtn {
        margin: 30px 0 30px 0;
        float: right;
        margin-right: 50px;
        width: 120px;
    }

    tbody {
        width: 80%;
    }

    /* select box  */

    .searchBox{
        width: 100%;
        display: flex;
        justify-content: flex-start;
        margin-bottom: 30px;
    }
    .searchBox form
    {
        display: flex;
        justify-content: space-around;
        width: 50%;
   
    }
    .searchBox form .form-control
    {
        width: 70%;
    }
    .searchBox form .form-select{
        width: 25%;
    }
    .formInner
    {
        margin-right: 10px;
    }
    
    .totalbtn
    {
        margin-left: 44%;
    }

</style>

<body>
    <div class="wrap">
        <div class="board-list">
                <div class="searchBox">
                    <form action="/horror/spot" method="get">
                        <select class="form-select formInner" name="type" id="search-type">
                            <option value="title">명칭</option>
                            <option value="address">주소</option>
                        </select>
                        <input type="text" class="form-control formInner" name="keyword" value="${search.keyword}">
                        <button class="btn btn-primary formInner" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                    <a href="/horror/spot" class="totalbtn btn btn-dark">전체글</a>

                </div>
            </div>

            <table class="table table-dark table-striped table-hover articles">
                <tr>
                    <th>명칭</th>
                    <th>국가</th>
                    <th>주소</th>
                    <th>내용</th>
                    <c:if test="${flag}">
                        <th></th>
                    </c:if>
                </tr>
                <c:forEach var="s" items="${spotList}">
                    <tr>
                        <input type="hidden" name="spotNo" value="${s.spotNo}">
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-title="${s.title}"
                            data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">
                            ${s.title}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-title="${s.title}"
                            data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">
                            ${s.country}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-title="${s.title}"
                            data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">
                            ${s.shortAddress}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-title="${s.title}"
                            data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">
                            ${s.shortContent}</td>
                        <c:if test="${flag}">
                            <td>
                                <a href="/horror/modify?spotNo=${s.spotNo}" id="modifyBtn"
                                    class="btn btn-warning">수정</a>
                                <a id="deleteBtn" class="btn btn-danger">삭제</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${flag}">
                <a href="/horror/write" id="writeBtn" class="btn btn-dark">등록</a>
            </c:if>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="staticBackdropLabel"> Horror Spot Detail Info </h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- Modal Body-->
                        <div class="modal-body">
                            
                            <!-- kakao map -->
                            <div id="map"></div>
                            <!-- koakao map End -->

                            <!-- Modal Body Content-->
                            <div class="frame01">
                                <div class="mb-3 titleBox">
                                    <label for="exampleFormControlInput1" class="form-label ">명칭</label>
                                    <input type="text" class="form-control title" id="exampleFormControlInput1"
                                        placeholder="명칭" name="title"  disabled>
                                </div>
                                <div class="mb-3 countryBox">
                                    <label for="exampleFormControlInput2" class="form-label ">국가</label>
                                    <input type="text" class="form-control country" id="exampleFormControlInput2"
                                        placeholder="국가" name="country"  disabled>
                                </div>
                            </div>
                            <div class="mb-3 addressBox">
                                <label for="exampleFormControlInput3" class="form-label ">주소</label>
                                <input type="text" class="form-control address" id="exampleFormControlInput3"
                                    placeholder="주소" name="address"  disabled>
                            </div>
                            <div class="mb-3 contentBox ">
                                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                                <p class="main-content">                                   
                                </p>
                            </div>
                        </div>
                        <!-- Modal Body End -->

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal End -->

            <!-- 게시글 목록 하단 영역 -->
            <div class="bottom-section">
                <!-- 페이지 버튼 영역 -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg pagination-custom">

                        <c:if test="${pm.prev}">
                            <li class="page-item"><a class="page-link"
                                    href="/horror/spot?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&type=${search.type}&keyword=${search.keyword}">prev</a>
                            </li>
                        </c:if>

                        <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li data-page-num="${n}" class="page-item">

                                <a class="page-link" href="/horror/spot?pageNum=${n}&amount=${pm.page.amount}&type=${search.type}&keyword=${search.keyword}">${n}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pm.next}">
                            <li class="page-item"><a class="page-link"
                                    href="/horror/spot?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&type=${search.type}&keyword=${search.keyword}">next</a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </div>
                <a class="ad" href="javascript:void(0)" onClick="javascript:goPost()"></a>
            </div>


        <script>

        (function () {

            // modal start 
            $('#staticBackdrop').on('shown.bs.modal', function (e) 
            {
                $('#staticBackdrop').trigger('focus')
                console.log(e);
                PutContentValues(e);
                GetkakaoMap(e);
            })// modal end 

            fixSearchOption(); // select option fix  

            const result = '${flag}';
            if(result === 'true') // login status 
            {
                alertServerMessage();
                deleteBtn();
            }

        })();


        // 검색 - 옵션 선택 시 
        function fixSearchOption() {
        const $select = document.getElementById('search-type');
            for (let $opt of [...$select.children]) {
                    console.log($opt);
                    if ($opt.value === '${s.type}') {
                        $opt.setAttribute('selected', 'selected');
                        break;
                    }
                };
        }

        // 로그인 시 .ad class의 a 태그 삭제 
        const result = '${flag}';
        if(result === 'true')
        {
            const $ad = document.querySelector('.ad');
            $ad.remove();
        }
    
        
        // 게시물 등록 알림 팝업창
        function alertServerMessage() {
            const msg = '${msg}';
            // console.log('msg: ', msg);

            if (msg === 'writeSuccess') {
                alert('게시물이 정상 등록되었습니다.');
            }
            else if(msg === 'modifySuccess')
            {
                alert('게시물 수정이 완료되었습니다.');
            }
            else if(msg === 'deleteSuccess')
            {
                alert('삭제가 완료되었습니다.');
            }
        }

        // 값 없는 post 방식
        function goPost() {
            let form = document.createElement('form');
            form.setAttribute('method', 'post');
            form.setAttribute('action', '/horror/loginForm');
            document.body.appendChild(form);
            form.submit();
        }

        function deleteBtn(){
            const $delBtn = document.getElementById('deleteBtn');
            $delBtn.onclick = e => {
                const spotNo = e.target.parentElement.parentElement.firstElementChild.value;
                console.log(spotNo);
                if (!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }
                location.href = "/horror/delete?spotNo=" + spotNo;
            };
        }    


        function PutContentValues(e) {
            const [$title, $country, $address] = document.querySelectorAll('.form-control');
            $title.value = $(e.relatedTarget).data('title');
            $country.value = $(e.relatedTarget).data('country');
            $address.value = $(e.relatedTarget).data('address');
            $('.main-content').text($(e.relatedTarget).data('content'));
        }

        // bootStrap modal >> kakaoMap 
        function GetkakaoMap(e) {
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch($(e.relatedTarget).data('address'), function (result, status) {

                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;color:#000;">'+$(e.relatedTarget).data('title')+'</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                    console.log(map);
                }
                map.relayout();

            });
        }

          


          
        </script>