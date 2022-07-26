<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board-list.css">

</head>

<body>
    <%@ include file="../include/header.jsp" %>

    <div class="wrap">
        <div class="board-list">
            <div class="searchBox">
                <form action="/horror/spot" method="get">
                    <select class="form-select formInner" name="type" id="search-type">
                        <option value="title">명칭</option>
                        <option value="address">주소</option>
                    </select>
                    <input type="text" class="form-input formInner" name="keyword" value="${search.keyword}">
                    <button class="btn btn-primary formInner" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <div class="pageReset">
                    <a href="/horror/spot" class="totalbtn btn btn-dark">전체글</a>
                    <select id="selBox" class="form-select" name="sel">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                    </select>
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
                                <a id="deleteBtn" class="btn btn-danger" onclick="deleteBtn(event)">삭제</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${flag}">
                <a href="/horror/write" id="writeBtn" class="btn btn-dark">등록</a>
            </c:if>
        </div>
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
                                    placeholder="명칭" name="title" disabled>
                            </div>
                            <div class="mb-3 countryBox">
                                <label for="exampleFormControlInput2" class="form-label ">국가</label>
                                <input type="text" class="form-control country" id="exampleFormControlInput2"
                                    placeholder="국가" name="country" disabled>
                            </div>
                        </div>
                        <div class="mb-3 addressBox">
                            <label for="exampleFormControlInput3" class="form-label ">주소</label>
                            <input type="text" class="form-control address" id="exampleFormControlInput3"
                                placeholder="주소" name="address" disabled>
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

                            <a class="page-link"
                                href="/horror/spot?pageNum=${n}&amount=${pm.page.amount}&type=${search.type}&keyword=${search.keyword}">${n}</a>
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
    </div>
</body>

<script src="/js/board-list.js"></script>
<script>


    fixPageCountOption();
    appendPageActive(); // append page Active 


    // page count option 
    function fixPageCountOption() {
        const $select = document.getElementById('selBox');
        for (let $opt of [...$select.children]) {
            console.log('${search.amount}');
            if ($opt.value === '${search.amount}') {
                $opt.setAttribute('selected', 'selected');
                break;
            }
        };
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
</script>