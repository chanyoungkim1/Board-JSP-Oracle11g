<%@ page language = "java" contentType = "text/html; charset=UTF-8"
    pageEncoding  = "UTF-8"%>
<%@ page language = "java" import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>회원가입</title>
</head>
<body bgcolor = "#fef7ca">
	<h1>회원가입</h1>
	<form action="joinaction.jsp" method="post" onsubmit="return input_check()">
	
		<input type="text" placeholder="아이디" name="INPUT_USER_ID" >
		<br>
		<input type="password" placeholder="패스워드" name="INPUT_USER_PW" >
		<br>
		<input type="text" placeholder="이름" name="INPUT_USER_NM" >
		<br>
		<input type="submit" value="가입하기">
		
<!-- 	onsubmit 은 함수를 실행하고 return 값이 False면 페이지의 데이터를 joinaction.jsp로 보내지않는다. -->
	</form>
	
	<script>
	function input_check(){
		var USER_ID = document.getElementById('USER_ID').value;
		var USER_PW = document.getElementById('USER_PW').value;
		var USER_NM = document.getElementById('USER_NM').value;
		
		if( USER_ID == null || USER_PW == null || USER_NM == null || USER_ID == "" || USER_PW =="" || USER_NM==""){
			alert("공백이 존재합니다.");
			return false;
		} else {
			
			return true;
			
		}
	}
	</script>
</body>
</html>