<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
</head>
<body bgcolor="#fef7ca">

	<h1>로그인 페이지</h1>
	<form method="post" action="loginAction.jsp">
		<input type="text" placeholder="아이디" name="INPUT_USER_ID" >
		<br>
		<input type="password" placeholder="패스워드" name="INPUT_USER_PW" >
		<br>
		<input type="submit" value="로그인">
		
	</form>
		<button onClick="location.href='join.jsp'">회원가입</button>
	
</body>
</html>