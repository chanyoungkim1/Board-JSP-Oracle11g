<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인액션</title>
</head>
<body>
	<h1> 로그인 체크 </h1>
<%
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:ORCL1";

		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
 		ResultSet rs;
// 		java에서 조회한 결과값을 저장,불러올수있음
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"kcy","971018");
   	

		String USER_ID = request.getParameter("INPUT_USER_ID");
		String USER_PW = request.getParameter("INPUT_USER_PW");	
		
		stmt  = conn.createStatement();
// 		CONNECTION 객체로연결한 후에 Query작업을 수행하기 위해 사용
		pstmt = conn.prepareStatement("select * from MYBUSER_TB");
// 		미개발자가 미리 작성한 쿼리문을 컴파일 하고 ?로 처리한부분에 사용자 입력값을 넣음
		rs=pstmt.executeQuery();
		

		
		String sql = "SELECT USER_ID,USER_PW FROM MYBUSER_TB WHERE USER_ID='" + USER_ID + "' AND USER_PW='" + USER_PW + "'";
		stmt.executeUpdate(sql);
		rs = stmt.executeQuery(sql);
		
		boolean isLogin = false;
		while( rs.next() ) {
			isLogin = true;
		}
		
		if( isLogin ) {
			session.setAttribute("USER_ID", USER_ID);
			session.setAttribute("USER_PW", USER_PW);
			response.sendRedirect("main.jsp");
		} else {
			%> <script> alert("로그인실패"); history.back(); </script> <% 
		}



		conn.close();
	
	} catch (Exception e) {       
        out.println("DB 연동 실패");
    }

%>
	

	
	
</body>
</html>