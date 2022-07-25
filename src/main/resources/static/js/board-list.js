(function () {

    startModal(); //modal
    fixSearchOption(); // select search option fix  
    selectPageCount(); // select countpage view 

})();

const result1 = '${flag}';
if (result1 === 'true') // login status 
{
    const $ad = document.querySelector('.ad');
    $ad.remove();
}

const result2 = '${flag}';
if (result2 === 'true') // login status 
{
    alertServerMessage();
    deleteBtn();

}

function selectPageCount() {
    const $selBox = document.querySelector('#selBox')
    $selBox.addEventListener('change', e => {
        location.href = '/horror/spot?amount=' + e.target.value;
    });
}


// page list active add 
function appendPageActive() {
    const curPageNum = '${pm.page.pageNum}';
    const $ul = document.querySelector('.pagination');

    for (const $li of [...$ul.children]) {
        if (curPageNum === $li.dataset.pageNum) {
            $li.classList.add('active');
            break;
        }
    }
}


// search option
function fixSearchOption() {
    const $select = document.getElementById('search-type');
    for (let $opt of [...$select.children]) {
        console.log($opt);
        if ($opt.value === '${search.type}') {
            $opt.setAttribute('selected', 'selected');
            break;
        }
    };
}


// popup 
function alertServerMessage() {
    const msg = '${msg}';
    // console.log('msg: ', msg);

    if (msg === 'writeSuccess') {
        alert('게시물이 정상 등록되었습니다.');
    } else if (msg === 'modifySuccess') {
        alert('게시물 수정이 완료되었습니다.');
    } else if (msg === 'deleteSuccess') {
        alert('삭제가 완료되었습니다.');
    }
}

// no value post send
function goPost() {
    let form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('action', '/horror/loginForm');
    document.body.appendChild(form);
    form.submit();
}






// modal start
function startModal() {
    $('#staticBackdrop').on('shown.bs.modal', function (e) {
        $('#staticBackdrop').trigger('focus')
        console.log(e);
        PutContentValues(e);
        GetkakaoMap(e);
    })
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
                content: '<div style="width:150px;text-align:center;padding:6px 0;color:#000;">' + $(e.relatedTarget).data('title') + '</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
            console.log(map);
        }
        map.relayout();

    });
}

// modal end