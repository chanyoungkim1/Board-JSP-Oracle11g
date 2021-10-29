<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import = "java.io.File" %>
<%@ page import   ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import   ="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 액션</title>
</head>
<body>

<%
//new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8")부분은 Browser 에서 Server로 보낼때는 ISO-8859-1이다. 이를 UTF-8로변환해줘야 한다.
// 	String bbsCreatename = request.getParameter("inputBbsCreatename");
// 	bbsCreatename        = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8"); 
// 	String bbsPw         = request.getParameter("inputBbsPw");	
// 	bbsPw                = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8"); 

	//10-26 23~28 line 추가 fileupload
// 	String directory = "C:/JSP/projects/MYB/src/main/webapp/FileSpace";
// 	int sizeLimit    = 100*1024*1024;
	
// 	MultipartRequest multi= new MultipartRequest(request ,directory , sizeLimit,
// 											"UTF-8" , new DefaultFileRenamePolicy() );	
	
	
	
	String bbsTitle      = request.getParameter("inputBbsTitle");
	String bbsTitle2 =bbsTitle;
	bbsTitle             = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8"); 
	String bbsContent    = request.getParameter("inputBbsContent");	
	String bbsContent2 = bbsContent;
	bbsContent           = new String(bbsContent.getBytes("ISO-8859-1"), "UTF-8"); 
	
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";

		Connection conn;
		Statement stmt;
 		ResultSet rs;
// 		java에서 조회한 결과값을 저장,불러올수있음
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"kcy","971018");
		stmt = conn.createStatement();
// 		CONNECTION 객체로연결한 후에 Query작업을 수행하기 위해 사용

	    int newnumber=0;
		String sql2   = "SELECT NVL(MAX(BBS_NUM),0) AS BBS_NUM FROM MYBBS_TB ORDER BY BBS_NUM DESC";
		ResultSet rs1 = stmt.executeQuery(sql2);
		if( rs1.next() ) {
			newnumber = rs1.getInt("BBS_NUM")+1;
		}
		rs1.close();
		//String sql = "INSERT INTO MYBBS_TB (BBS_NUM, BBS_TITLE, BBS_CREATENAME, BBS_PW,BBS_CONTENT) VALUES("+newnumber+",'" + bbsTitle + "','" + bbsContent + "','" + bbsPw + "','" + bbsContent + "')";
		//String sql ="INSERT INTO MYBBS_TB( BBS_NUM, BBS_TITLE , BBS_CREATENAME , BBS_PW , BBS_CONTENT) VALUES("+newnumber+",'" + bbsTitle + "','" + session.getAttribute("USER_ID") + "','" + bbsPw + "','" + bbsContent + "')";
		
		boolean titleNullcheck = false;
		boolean contentNullcheck = false;
		
		if( bbsTitle2.length() <=0) {
			titleNullcheck = true;
		}	

		if( bbsContent2.length() <=0) {
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
   			String sql ="INSERT INTO MYBBS_TB( BBS_NUM, BBS_TITLE , BBS_CREATENAME, BBS_CONTENT ,BBS_REF) VALUES("+newnumber+",'" + bbsTitle + "','" + session.getAttribute("USER_ID") + "','" + bbsContent + "',"+newnumber+")";
  			stmt.executeUpdate(sql);	
  			response.sendRedirect("bbs.jsp");
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