<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 액션</title>
</head>
<body>

<%


	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));
		
	String bbsTitle      = request.getParameter("updateBbsTitle");
	bbsTitle             = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8"); 
	String bbsContent    = request.getParameter("updateBbsContent");	
	bbsContent           = new String(bbsContent.getBytes("ISO-8859-1"), "UTF-8"); 
	
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";

		Connection conn;
		Statement stmt;
 		ResultSet rs;
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"kcy","971018");
		stmt = conn.createStatement();
 
	
 
		String sql = "UPDATE MYBBS_TB SET BBS_TITLE ='" +bbsTitle + "', BBS_CONTENT = '"+bbsContent +"' ,BBS_UPDATEDATE = SYSDATE ,BBS_UPDATENAME = '" + session.getAttribute("USER_ID") + "'   WHERE BBS_NUM = " + bbsNum;
		stmt.executeUpdate(sql);
		//response.sendRedirect("bbs.jsp");
		//stmt.executeUpdate(sql);	 
		boolean titleNullcheck = false;
		boolean contentNullcheck = false;
		
		if( bbsTitle.length() <=0) {
			titleNullcheck = true;
		}	

		if( bbsContent.length() <=0) {
			contentNullcheck = true;
		}	
		
		if( titleNullcheck == true || contentNullcheck ==true ){
%> 
		<script> alert("공백이 있습니다.");history.back(); </script> 
<% 
		}
		else{
%> 
<% 

%> 
		<script> alert("수정되었습니다.");location.href="bbs.jsp?pg=<%=pg%>&sv="; </script> 
<%
		
		stmt.close();
		conn.close();
		}
		
	} 
	catch (Exception e) {
		
	e.printStackTrace();

    out.println("DB 연동 실패");
    }

%>
	
</body>
</html>