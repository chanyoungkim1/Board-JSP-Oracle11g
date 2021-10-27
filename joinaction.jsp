<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 액션</title>
</head>
<body>
<%

	String USER_ID = request.getParameter("INPUT_USER_ID");
	String USER_PW = request.getParameter("INPUT_USER_PW");	
	String USER_NM = request.getParameter("INPUT_USER_NM");	
	USER_NM        = new String(USER_NM.getBytes("ISO-8859-1"), "UTF-8");
	
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:ORCL1";

		Connection conn;
		Statement stmt;
 		ResultSet rs;
// 		java에서 조회한 결과값을 저장,불러올수있음
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"kcy","971018");
   	

		
		stmt = conn.createStatement();
// 		CONNECTION 객체로연결한 후에 Query작업을 수행하기 위해 사용
	//	String sql = "INSERT INTO MYBUSER_TB  VALUES(USER_ID,USER_PW,USER_NM)";

		String sql = "INSERT INTO MYBUSER_TB (USER_ID,USER_PW,USER_NM) VALUES('" + USER_ID + "','" + USER_PW + "','" + USER_NM + "')";

		stmt.executeUpdate(sql);
%>
		alert("회원가입이 완료되었습니다.");
<% 
		response.sendRedirect("login.jsp");

		

		conn.close();
		
	} catch (Exception e) {       
        out.println("DB 연동 실패");
    }

	%>
	
	
</body>
</html>