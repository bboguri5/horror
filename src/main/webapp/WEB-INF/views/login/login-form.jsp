<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%@ include file="../include/static-head.jsp" %>
  </head>
<body>
  <style>
    .container
    {
      width:300px;
      height:300px;
      margin:0 auto;
      margin-top: 200px;
      color: #fff;
      position: relative;
    }

    .form-signin-heading{
      font-family: 'horror', sans-serif;
      color: #740707;
      font-size: 100px;
    }
    
    .form-control{
      margin: 20px 0 20px 0;
    }


    .btn{
      font-family: 'East Sea Dokdo', cursive;
      border: 0;
      color: #fff;
      background: #560E07 ;
      font-size: 25px;
      padding: 0 10px 0 10px;
    }

    /* .signUpBtn{
      display: block;
    position: absolute;
    left: 196px;
    bottom: 90.4px;
    width: 90px;
    
    }*/

    .signInBtn
    {
      margin-left: 120px;
    } 


  </style>
    <div class="container">
        <form class="form-signin" action="/signIn" method="post">
          <h2 class="form-signin-heading"> Login </h2>
          <label for="inputID" class="sr-only">ID</label>
          <input type="id" id="inputID" class="form-control" name="id" placeholder="Id" required autofocus>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
          <input type="hidden" name="cnt" value="${cnt}" class="cnt">
          <button class="signInBtn btn btn-danger btn-block" type="submit">Sign in</button>
          <a href="/signUp"class="signUpBtn btn btn-danger ">Sign up</a>
        </form>
      </div>
</body>

<script>

const result = '${login}';
 
if(result === 'false')
{
  alert("아이디 또는 비밀번호가 일치하지 않습니다.\n 확인 후 다시 입력해 주시기 바랍니다.");
}

</script>

</html>