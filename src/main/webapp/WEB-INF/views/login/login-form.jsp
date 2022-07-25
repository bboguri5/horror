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
    
    .form-control{
      margin: 20px 0 20px 0;
    }

    .signUpBtn{
      display: block;
    position: absolute;
    left: 196px;
    bottom: 90.4px;
    width: 90px;
    
    }
    .signInBtn
    {
      margin-left: 100px;
    }

  </style>
    <div class="container">
        <form class="form-signin" action="/signIn" method="post">
          <h2 class="form-signin-heading">Admin Login</h2>
          <label for="inputID" class="sr-only">ID</label>
          <input type="id" id="inputID" class="form-control" name="id" placeholder="Id" required autofocus>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
          <input type="hidden" name="cnt" value="${cnt}" class="cnt">
          <button class="signInBtn btn btn-primary btn-block" type="submit">Sign in</button>
        </form>
        <a href="/signUp"class="signUpBtn btn btn-primary ">Sign up</a>
      </div> 
</body>

<script>

const result = '${login}';
 
if(result === 'false')
{
  alert("로그인이 실패하였습니다. 다시 입력해주세요.");
}

</script>

</html>