<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제 액션</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL1";
	
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
		ResultSet rs;
	//		java에서 조회한 결과값을 저장,불러올수있음
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,"kcy","971018");
	stmt = conn.createStatement();
	
	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	String sql2   = "DELETE FROM MYBBS_TB WHERE BBS_NUM="+ bbsNum;
	ResultSet rs1 = stmt.executeQuery(sql2);
	
	
%>
	<script> alert("게시글이 삭제되었습니다.");location.href="bbs.jsp?pg=<%=pg%>"; </script> 
<% 
	
%>

</body>
</html>