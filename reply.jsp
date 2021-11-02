<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 페이지</title>
</head>
<body bgcolor="#fef7ca">
<%
	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));	
	
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";

		Connection conn;
		Statement stmt;
 		ResultSet rs;
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"kcy","971018");
		stmt = conn.createStatement();
		
%>
	<form  method=post action="replyaction.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>">
		<table border :1px>
			<thead>
				<tr>
					<th colspan>답글 쓰기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>제목 : <input type="text" size=50  maxlength=50 placeholder="제목 을 입력해주세요." name="inputBbsTitle" ></td>
					<br>
				</tr>
				<tr>
					<td>내용 <textarea name="inputBbsContent" cols=50 rows=10></textarea></td>
				</tr>
				
			</tbody>
		</table>

		<input type="submit" value="등록" OnClick="window.location='replyaction.jsp?bbsNum=<%= bbsNum %>&pg=<%=pg%>'">
		<input type=button value="취소" OnClick="window.location='view.jsp?bbsNum=<%= bbsNum %>&pg=<%=pg%>'">
	</form>
<%
		stmt.close();
		conn.close();
		
		
	} 
	catch (Exception e) {
		
	e.printStackTrace();

    out.println("DB 연동 실패");
    }

%>
</body>
</html>