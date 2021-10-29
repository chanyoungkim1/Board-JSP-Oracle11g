<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
</head>
<body bgcolor="#fef7ca">
	<form method="post" action="writeaction.jsp" enctype = "mulipart/form-data" >
		<table border :1px>
			<thead>
				<tr>
					<th colspan>게시판 글쓰기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>제목 : <input type="text" placeholder="제목 을 입력해주세요." name="inputBbsTitle" ></td>
					<br>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>작성자 : <input type="text" placeholder="작성자 을 입력해주세요." name="inputBbsCreatename" ></td> -->
<!-- 					<br> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>비밀번호 :<input type="password" placeholder="게시글비밀번호" name="inputBbsPw" ></td> -->
<!-- 					<br> -->
<!-- 				</tr> -->
				<tr>
					<td>내용 <textarea name="inputBbsContent"></textarea></td>
				</tr>
				
			</tbody>
		</table>
		parameter1 : <input type = "text"   name  = "param1"> <br>
		<input type = "file"   name  = "file1"><br>
		<input type="submit" value="글쓰기">
		<input type="reset" value="초기화">

		

</body>
</html>