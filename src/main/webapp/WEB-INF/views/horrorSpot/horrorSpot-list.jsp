<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="../include/static-head.jsp" %>
</head>
<style>
 
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
                        <td>${s.title}</td>
                        <td>${s.country}</td>
                        <td>${s.address}</td>
                        <td>${s.content}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>

<script>
    function detailEvent() {
        //상세보기 요청 이벤트
        const $table = document.querySelector(".articles");

        $table.addEventListener('click', e => {


            if (!e.target.matches('.articles td')) return;

            console.log('tr 클릭됨! - ', e.target);

            let bn = e.target.parentElement.firstElementChild.value;
            console.log(bn);
            location.href = '/horror/spotDetail?spotNo='+bn
        });
    }

    (function () {
        detailEvent();
    })();
</script>

</html>