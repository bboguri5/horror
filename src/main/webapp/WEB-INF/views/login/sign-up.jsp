<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>


    <style>
        .container {
            color: #fff;
            margin-top: 200px;
            width: 45%;
            position: relative;
        }
        .idBox{
            display: flex;
            justify-content: space-between;
        }
        #login-id{
            margin-right: 10px;
            width: 300px;
        }

        h4.mb-3
        {
              font-family: "horror", sans-serif;
              color: #740707;
              /* text-shadow: 5px 1px 2px #e31515; */
                font-size: 80px;
        }

        .btn
        {
            font-family: 'East Sea Dokdo', cursive;
            background: #560E07 ;
            color: #fff;
            border: 0;
            font-size: 25px;
        }

        label{
            font-family: 'East Sea Dokdo', cursive;
            margin-bottom: 5px;
            font-size: 30px;
        }

        .joinbtn{
            position: absolute;
            right: 30px;
        }
   
    </style>

</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">Sign Up</h4>
                <form action="/signUp" class="validation-form" method="post" onsubmit="return warnJoin()" >
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="login-id">아이디</label>
                            <div class="idBox">
                                <input type="text" class="form-control" id="login-id" name = "id" placeholder="아이디 중복확인 필수입니다. " value="${inputId}" required>
                                <button class="checkID btn btn-warning" type="button" onclick="checkID()"> 중복확인 </button>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="login-pwd">패스워드</label>
                            <input type="text" class="form-control" id="login-pwd" name="pwd" placeholder="패스워드를 입력해주세요." value="" disabled>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="login-Name">이름</label>
                            <input type="text" class="form-control" id="login-Name" name="name" placeholder="이름을 입력해주세요." value="" disabled>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="login-birth">생년월일</label>
                            <input type="text" class="form-control" id="login-birth" name="birth" placeholder="ex) 19920125" value="" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="login-email">이메일</label>
                            <input type="email" class="form-control" id="login-email" name="email" placeholder="ex) you@example.com" disabled>
                        </div>
                    </div>
                    <button class="joinbtn btn btn-danger btn-lg btn-block" type="submit">가입 완료</button>
                </form>
            </div>
        </div>

    </div>

    <script>
            function warnJoin()
            {
                if(confirm("심약자 노약자 임산부는 회원가입이 불가합니다."))
                {
                   if(confirm("감당하실 수 있겠습니까?"))
                   {
                        if(confirm("레알?"))
                        {
                            return true;
                        }
                   }
                
                }
                return false;
            }

           function checkID()
           {
                const $loginId = document.getElementById('login-id');
                console.log($loginId);
                location.href = '/signUp?inputId='+$loginId.value;
           }

           const idResult = '${checkID}'

            if(idResult === "success"){
                alert("가입 가능한 ID입니다.");
                disabledTrue();
            }
            else if (idResult === "fail"){
                alert("ID 중복입니다.");
            }
            
            function disabledTrue()
            {
                const $formList = document.querySelectorAll('.form-control');
                for(const formList of $formList)
                {
                    console.log(formList);
                    formList.disabled = false;
                }
            }
    </script>

</html>