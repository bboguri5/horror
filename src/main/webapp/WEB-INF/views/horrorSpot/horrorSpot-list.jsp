<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="../include/static-head.jsp" %>

</head>
<style>
    #map {
        width: 700px;
        height: 500px;
        margin: 10px 0 10px 20px;
    }

    .frame01 {
        display: flex;
        justify-content: space-between;
    }
    
    .form-control.address {
        width: 100%;
    }

    .main-content {
        height: 300px;
        border: 3px solid #fff;
    }

    .titleBox , .countryBox{
        width: 40%;
    }
    
</style>

<body>
    <div class="wrap">
        <div class="board-list">
            <table class="table table-dark table-striped table-hover articles">
                <tr>
                    <th>명칭</th>
                    <th>국가</th>
                    <th>주소</th>
                    <th>내용</th>
                </tr>
                <c:forEach var="s" items="${spotList}">
                    <tr>
                        <input type="hidden" name="spotNo" value="${s.spotNo}">
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" 
                        data-title="${s.title}" data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">${s.title}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                        data-title="${s.title}" data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">${s.country}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                        data-title="${s.title}" data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">${s.address}</td>
                        <td data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                        data-title="${s.title}" data-country="${s.country}" data-address="${s.address}" data-content="${s.content}">${s.content}</td>
                    </tr>
                </c:forEach>
            </table>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">공포스팟</h5>
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
                                        placeholder="명칭" name="title" value="${s.title}" disabled>
                                </div>
                                <div class="mb-3 countryBox" >
                                    <label for="exampleFormControlInput2" class="form-label ">국가</label>
                                    <input type="text" class="form-control country" id="exampleFormControlInput2"
                                        placeholder="국가" name="country" value="${s.country}" disabled>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlInput3" class="form-label ">주소</label>
                                <input type="text" class="form-control address" id="exampleFormControlInput3"
                                    placeholder="주소" name="address" value="${s.address}" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                                <p class="main-content">
                                    ${s.content}
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
        </div>
    </div>


    <script>

        $('#staticBackdrop').on('shown.bs.modal', function (e) {
            $('#staticBackdrop').trigger('focus')
            
            PutContentValues(e);
            GetkakaoMap();
        })

        function detailEvent() {
            //상세보기 요청 이벤트
            const $table = document.querySelector(".articles");

            $table.addEventListener('click', e => {


                if (!e.target.matches('.articles td')) return;

                console.log('tr 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.value;
                console.log(bn);
                location.href = '/horror/spot?spotNo=' + bn
            });
        }


        function PutContentValues(e)
        {
            const [$title,$country,$address] = document.querySelectorAll('.form-control');
            $title.value = $(e.relatedTarget).data('title'); 
            $country.value = $(e.relatedTarget).data('country'); 
            $address.value = $(e.relatedTarget).data('address'); 
            $('.main-content').text($(e.relatedTarget).data('content'));
        }

        function GetkakaoMap()
        {
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
            geocoder.addressSearch('경기도 광주시 곤지암읍 신대리 114-1', function (result, status) {

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
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">곤지암</div>'
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