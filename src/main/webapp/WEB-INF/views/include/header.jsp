<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header>
    <nav class="wrap">
        <a class="ad" href="javascript:void(0)" onClick="javascript:goPost()">Sign in</a>
        <a href="/horror/signUp"class="signUpBtn btn btn-primary ">Sign up</a>
    </nav>
</header>


<script>
    goPost();
    // no value post send
function goPost() {
    let form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('action', '/horror/loginForm');
    document.body.appendChild(form);
    form.submit();
}
</script>