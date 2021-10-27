<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>메인</title>
</head>
<body bgcolor = "#fef7ca">
<%
	if(session.getAttribute("USER_ID") == null) {
	
%>
	<h1>메인 페이지</h1>
	<a href = "login.jsp">로그인</a>
	<a href = "version.jsp">업데이트내역</a>
<%	
	} 
	else {
%>
	<h1>메인 페이지</h1>
<% 
	out.print(session.getAttribute("USER_ID") + "님 환영합니다");
	
%>	
	<form action="logout.jsp" method = "post">
	<button> 로그아웃 </button>
	</form>
	<a href = "bbs.jsp?pg=1&sv=">게시판</a>
	<a href = "version.jsp">업데이트내역</a>
<%
	}
%>
	
</body>
</html>