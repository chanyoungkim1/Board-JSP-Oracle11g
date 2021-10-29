<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>



<%
	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
 	ResultSet rs;
// 		java에서 조회한 결과값을 저장,불러올수있음
		
	int visit = Integer.parseInt(request.getParameter("bbsNum"));
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,"kcy","971018");
   	
	stmt = conn.createStatement();
		
	String sqlList = "SELECT BBS_TITLE, BBS_CREATENAME, BBS_CONTENT, BBS_FILE, BBS_VISIT FROM MYBBS_TB WHERE BBS_NUM="+visit;
	rs = stmt.executeQuery(sqlList);  
	
	if( rs.next() ) {
		String bbsTitle      = rs.getString("BBS_TITLE");
  		String bbsCreatename = rs.getString("BBS_CREATENAME");
 		String bbsContent    = rs.getString("BBS_CONTENT");
  		String bbsFile       = rs.getString("BBS_FILE");
  		int bbsVisit         = rs.getInt("BBS_VISIT");
  		if( bbsFile == null ) {
  			bbsFile = "";
  		}
  		bbsVisit++;
  					
  		String sql3 = "UPDATE MYBBS_TB SET BBS_VISIT = " + bbsVisit + " WHERE BBS_NUM = " + visit;
  		stmt.executeUpdate(sql3);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
</head>
<body bgcolor="#fef7ca">

	<h3><a href="main.jsp">메인으로</a></h3>
	<table border : 1px, width="600">
		<thead>
			<tr>
				<td>작성자</td>
				<td><%=bbsCreatename  %></td>
			</tr>
			<tr>
				<th>제목</th>	
				<th><%=bbsTitle  %></th>
			</tr>
			<tr>
				<td>내용</td>
				<td wdith="400" height="250"><%=bbsContent.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
<%-- 			<td wdith="400" height="250"><%=bbsContent.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td> --%>
			</tr>
			<tr>
				<td>첨부</td>	
				<td><%=bbsFile  %></td>
			</tr>
		
		</thead>
		
<%
	}
%>
	</table>
	
	<input type=button value="수정" OnClick="window.location='update.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>'">
	<input type=button value="삭제" OnClick="window.location='deleteaction.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>'">
	<input type=button value="목록" OnClick="window.location='bbs.jsp?pg=<%=pg%>'">
	<input type=button value="답글" OnClick="window.location='reply.jsp?bbsNum=<%=bbsNum%>&pg=<%=pg%>'">

<% 
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>