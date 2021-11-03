<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>

<%
	
	final int rowSize = 5;
	final int block   = 5;
	
	
	int pg  = 1;	
	if(request.getParameter("pg") != null) {
		pg  = Integer.parseInt(request.getParameter("pg"));
	}
	int cpg = pg;
	
	int startRow         = (pg - 1) * rowSize + 1; 
	int endRow           = pg * rowSize;
	int count 		     = 0;
	
	int allPage          = 0;
	int startPage1       = pg;
 	int endPage1         = ((pg - 1) )+block;
	int startbbsnum      = 0;
	int startnum         = 0;
	

	String searchValue   = request.getParameter("bbsSearch");
// 	String searchValue = null;
	String a = request.getParameter("bbsSearch");
	if (a==null){
		a = "";	
	}
	
	if (a	 != null){
		searchValue 	 =java.net.URLDecoder.decode(a);
// 		searchValue 	 = "";
	}
// 	String searchValue   = request.getParameter("bbsSearch");
	searchValue          = new String(searchValue.getBytes("ISO-8859-1"), "UTF-8"); 
	String searchValue2  = searchValue;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@localhost:1521:ORCL1";

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
 	ResultSet rs;
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,"kcy","971018");
	stmt = conn.createStatement();
	
	
	int bbsTotal  = 0;
	String sql2   = "SELECT COUNT(BBS_NUM) FROM MYBBS_TB WHERE BBS_DELETE_AT='N' AND BBS_TITLE LIKE '%"+searchValue+"%' ORDER BY BBS_NUM DESC";
	ResultSet rs1 = stmt.executeQuery(sql2);
	if( rs1.next() ) {
		bbsTotal  = rs1.getInt(1);
	}
	rs1.close();

//  	out.print("총 게시물 개수 = " +  bbsTotal +"| 페이지 = "+ pg+"| 검색개수 = "+ searchTotal);
	
	

	String sqlList = "SELECT BBS_NUM, BBS_TITLE, BBS_VISIT, BBS_CREATENAME , BBS_CREATEDATE , BBS_UPDATENAME, BBS_UPDATEDATE, BBS_UPPOST ,BBS_INDENT FROM MYBBS_TB WHERE BBS_DELETE_AT='N' AND BBS_TITLE LIKE '%"+searchValue+"%' ORDER BY   BBS_REF DESC ,  BBS_STEP DESC   ";
	rs = stmt.executeQuery(sqlList);  
	
	
	
	
%>
		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지1</title>
</head>
<body bgcolor="#fef7ca">		

	<h3><a href  = "main.jsp" >메인으로</a></h3>
	<hr> 게시판
	


	<form method = "post" action = "bbs.jsp?pg=<%=pg%>&searchValue=<%=searchValue%>">
<!-- 	<form method = "post" action = "bbs.jsp"> -->
		<select name="bbsCol"> 
 			<option  value = "searchAll">제목</option> 
		</select> 
<%
		String bb = request.getParameter("bbsSearch");	
%>
<%-- 		<input type='text'   name  = "bbsSearch" value ="<%=searchValue%>">  --%>
		<input type='text'   name  = "bbsSearch" value ="<%=pg%>1">
 		<input type="submit" value = "검색">
 	</form> 
 	
	<br>
	<hr> 
	<table>
		<thead>
			<tr>
				<th>글번호</th>	
				<th>제목</th>	
				<th>조회수</th>
				<th>글생성자</th>	
				<th>생성일</th>
				<th>글변경자</th>	
				<th>변경일</th>	
				<th>상위게시글번호</th>
			</tr>
		</thead>
<!-- 테이블 구성 요소 <th> 테이블 헤더 , <tr> 테이블 행 <td>테이블 열 -->
		<tbody>
<%
	if( bbsTotal==0 ) {
%>
			<tr>
				<th>등록된 글이 없습니다.</th>
			</tr>
<% 
	}else {
		
		int bbsnum  = 0;
		int i       = 0;
		startbbsnum = bbsTotal - (pg - 1) * rowSize;
		startnum    = startbbsnum - rowSize;
		int skipR   = (pg - 1) * rowSize;
		int skipRow = (pg - 1) * rowSize;

	while(rs.next() && skipR -- > 0 );
		
		while( i++ < rowSize){ 
			
			int bbs_num            = rs.getInt("BBS_NUM");
			String bbs_title       = rs.getString("BBS_TITLE").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>");
			int bbs_visit          = rs.getInt("BBS_VISIT");
		 	String bbs_createname  = rs.getString("BBS_CREATENAME");
		 	String bbs_createdate  = rs.getString("BBS_CREATEDATE");
		 	String bbs_updatename  = rs.getString("BBS_UPDATENAME");
		 		if( bbs_updatename == null ) {
		 			bbs_updatename = "";
		 		}
		 	String bbs_updatedate  = rs.getString("BBS_UPDATEDATE");
		 		if(bbs_updatedate==null){
		 			bbs_updatedate = "변경없음";
		 		}
		 	String bbs_uppost      = rs.getString("BBS_UPPOST");
		 		if(bbs_uppost	   == null){
		 			bbs_uppost     = "";
		 		}
		 	int bbsIndent          = rs.getInt("BBS_INDENT");
%>	 			
			<tr>
<% 
			for(int j=0; j<bbsIndent; j++){
%>
				&nbsp;&nbsp;&nbsp;
<% 	
			}
		 	if(bbsIndent !=0){
		 		for(int j=0; j<bbsIndent; j++){
%>				
				<td> &nbsp;&nbsp;	
<% 						
		 		}
%>			
				↖Re> <%=bbs_num  %></td>
<% 			
		 	}
		 	else{
%>
				<td><%=bbs_num  %></td>
<%
		 	}
%>

				<th><a href="view.jsp?bbsNum=<%=bbs_num %>&pg=<%=pg%>"><%=bbs_title%></a></th>
				<td><%=bbs_visit  %></td>
				<td><%=bbs_createname  %></td>
				<td><%=bbs_createdate  %></td>
				<td><%=bbs_updatename  %></td>
				<td><%=bbs_updatedate  %></td>
				<td><%=bbs_uppost  %></td>
				</tr>	
<%		
			
			boolean rscheck =rs.next(); // rs.next()첫번재 글부터 나오기 위해 마지막 위치 조정
			
			if( rscheck == false  ){
				break;
			}
			else{
			
			}
 		} // 137 line while(rs.next())
		
 		out.print("pg = " +  pg + "|| i = " +  i + "|| skipR = " +  skipR + "|| rowSize = " +  rowSize+ "|| skipRow = " +  skipRow + "|| bbsTotal = " +  bbsTotal + "|| searchValue = " +  searchValue+ "|| searchValue2 = " +  searchValue2  );
	} //	126 line else
%>

		</tbody>
	</table>
	<br>
	<a href="write.jsp">글쓰기</a>
	<br>
<%
	int pgCnt     = bbsTotal / block;
	int startPage = ((pg - 1) / block) * block + 1 ;
	int endPage   = startPage + block -1;
	int maxPage   = 0;
	maxPage = (int)Math.ceil(bbsTotal/rowSize); 
	if(endPage > maxPage){
		endPage = maxPage+1;
	}
	
	if ( endPage != maxPage){
%>
		<a href="bbs.jsp?pg=<%=endPage+1 %>"></a>
<% 		
	}
	if( pg>block ) {
		if ( pg > block){
%>
			[<a href="bbs.jsp?pg=1">◀◀</a>]
<%	
		}
%>
	[<a href="bbs.jsp?pg=<%=startPage-1%>">◀</a>]
<%
	}
%>
<%	

	
	for(int i = startPage; i <= endPage ; i++){
		
	
		if(i == pg ){
		
%>
			[<%=i%>]
<% 			
		}else {
%>
			[<a href="bbs.jsp?pg=<%=i%>&searchValue=<%=searchValue%>"><%=i  %></a>]
<% 
		}
	}
%>
<%
	if( endPage < pgCnt ) {
%>
		[<a href="bbs.jsp?pg=<%=endPage+1 %>">▶</a>]
		[<a href="bbs.jsp?pg=<%=maxPage+1 %>">▶▶</a>]
<% 
		
	} 	


	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>