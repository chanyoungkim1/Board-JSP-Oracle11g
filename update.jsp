<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 액션</title>
</head>
<body bgcolor="#fef7ca">
<%
	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));	
	
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";
	
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
		ResultSet rs;
	//		java에서 조회한 결과값을 저장,불러올수있음
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,"kcy","971018");
		
	stmt = conn.createStatement();
		
	String sqlList = "SELECT BBS_CREATENAME, BBS_TITLE, BBS_CONTENT FROM MYBBS_TB WHERE BBS_NUM="+bbsNum;
	rs = stmt.executeQuery(sqlList);  
	
	if( rs.next() ) {
		String bbsCreatename      = rs.getString("BBS_CREATENAME");
		String bbsTitle      = rs.getString("BBS_TITLE");
 		String bbsContent    = rs.getString("BBS_CONTENT");
	
%>
<form  method=post action="updateaction.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>">
	<table border :1px>
			<thead>
				<tr>
					<th colspan>게시글 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>작성자 : <%=bbsCreatename%><input type=hidden name="bbsCreatename" size=50  maxlength=50 value="<%=bbsCreatename%>"> </td>
					
				</tr>
				<tr>
					<th>제목 : <input type=text name="updateBbsTitle" size=50  maxlength=50 value="<%=bbsTitle%>"> </th>
					
				</tr>
				<tr>
					<td>내용 : <textarea name="updateBbsContent" cols=50 rows=10><%=bbsContent%></textarea></td>
				</tr>						
				
			</tbody>
		
		</table>
<%
	}
%>
<%-- 	<input type="submit" value="수정" OnClick="window.location='updateaction.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>'"> --%>
	
	<input type="submit" value="수정" OnClick="window.location='updateaction.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>'">
	<input type=button value="목록" OnClick="window.location='view.jsp?bbsNum=<%= bbsNum %>&pg=<%=pg%>'">

</body>
</html>