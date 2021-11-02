<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 액션</title>
</head>
<body>

<%

	int bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	int pg = Integer.parseInt(request.getParameter("pg"));	
 	String sv 	 = request.getParameter("bbsSearch");
	
	String bbsTitle      = request.getParameter("inputBbsTitle");
	if (bbsTitle 	 == null){
		bbsTitle 	 = "";
	}
	bbsTitle             = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8"); 
	String bbsContent    = request.getParameter("inputBbsContent");	
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
		
		int bbsUppost = 0; 
		int bbsIndent = 0; 
		int bbsStep = 0;
		int ref = 0;
		
		String sql1   = "SELECT BBS_UPPOST, BBS_INDENT , BBS_STEP , BBS_REF FROM MYBBS_TB WHERE BBS_NUM =" +bbsNum;
		ResultSet rs2 = stmt.executeQuery(sql1);
		if(rs2.next()){
			bbsUppost = rs2.getInt(1);
			bbsIndent = rs2.getInt(2);
			bbsStep   = rs2.getInt(3);
			ref       =    rs2.getInt("BBS_REF");
		}
		rs2.close();
		
		String sql4   = "UPDATE MYBBS_TB SET BBS_STEP=BBS_STEP+1 WHERE BBS_NUM="+bbsUppost+"And BBS_STEP>"+bbsStep;
		stmt.executeUpdate(sql4);
		
	    int newnumber = 0;
	    
		String sql2   = "SELECT NVL(MAX(BBS_NUM),0) AS BBS_NUM FROM MYBBS_TB ORDER BY BBS_NUM DESC";
		ResultSet rs1 = stmt.executeQuery(sql2);
		if( rs1.next() ) {
			newnumber = rs1.getInt("BBS_NUM") + 1;
		}
		rs1.close();
		boolean titleNullcheck = false;
		boolean contentNullcheck = false;
		
		if( bbsTitle.length() <=0) {
			titleNullcheck   = true;
		}	

		if( bbsContent.length() <=0) {
			contentNullcheck = true;
		}	
		
		if( titleNullcheck == true || contentNullcheck == true ){
%> 
		<script> alert("공백이 있습니다.");history.back(); </script> 
<% 
		}
		else{
%> 
		
		<script> alert("답글이 작성되었습니다.."); </script> 

<% 
			bbsIndent = bbsIndent +1;
			bbsStep = bbsStep -1;
   			String sql ="INSERT INTO MYBBS_TB( BBS_NUM, BBS_TITLE , BBS_CREATENAME, BBS_CONTENT ,BBS_UPPOST , BBS_INDENT , BBS_STEP ,BBS_REF ) VALUES("+newnumber+",'" + bbsTitle + "','" + session.getAttribute("USER_ID") + "','" + bbsContent + "','" + bbsNum + "','" + bbsIndent + "','" + bbsStep + "','" + ref +  "')";
  			stmt.executeUpdate(sql);	
%>
<!--   			response.sendRedirect("bbs.jsp?pg=1&sv="); -->
			<a herf="bbs.jsp?pg=<%=pg %>&sv=<%=sv %>"></a>
<% 
		}
		
		
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