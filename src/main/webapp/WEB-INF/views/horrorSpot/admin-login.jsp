<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <style>
      .container
      {
            width:300px;
        height:300px;
        margin:0 auto;
        margin-top: 200px;
      }
      
      .form-control{
        margin: 20px 0 20px 0;
      }
    </style>
</head>
<body>
    <div class="container">
        <form class="form-signin" action="/horror/spot" method="post">
          <h2 class="form-signin-heading">Admin Login</h2>
          <label for="inputID" class="sr-only">ID</label>
          <input type="email" id="inputID" class="form-control" name="id" placeholder="Id" required autofocus>
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
          <button class="btn btn-primary btn-block" type="submit">Sign in</button>
        </form>
      </div> <!-- /container -->
</body>
</html>