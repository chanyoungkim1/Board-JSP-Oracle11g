# Board-JSP-Oracle11g
<h2>JSP 게시판 제작 </h2><br>
<hr><h3>V0.00</h3>
<h4>-진행사항-</h4><br>
login.jsp , loginaction.jsp , main.jsp , bbs.jsp <br>
오라클 DB연동 , 메인페이지 , 게시판 틀 작성
<h4>-메모-</h4><br> 
login.jsp 에서 이름 한글 입력시 한글꺠짐 오류 발생 하였다.
 PageEncoding = "UTF-8" 은 *.JSP파일 자체의 인코딩 방법이었고
 클라이언트 (브라우저) 로 응답정보를 내리는 헤더 정보에 포함되는 값 이 된다. (문서의 Charset = UTF-8) <br>
 ContentType="text/html; charset = UTF-8"  은 사용자가 서버로 JSP 요청을 하면 서버(WAS) 측에서 html을 통한 문자 전송시 <br>
 ISO-8859-1 charset 이외의 문자들은 인코딩 되어 서버측으로 전송하게 되고 서버측은 인코딩된 문자를 받아서 디코딩 한다. 따라서  <br>
 브라우저를 통해 전송할때 charset 자체를 지원하지 않기때문에 default 인코딩 charset인 ISO-8859-1로 <br>
 디코딩 되어 한글이 깨졌고 깨진 한글을 다시 ISO-8859-1로 인코딩후 UTF-8로 디코딩 해주면 정상적으로 한글을 확인할 수 있게 된다.<br>
 /* 하기 코드 참조 */<br>
<h5> String USER_NM = request.getParameter("INPUT_USER_NM");	<br>
 USER_NM        = new String(USER_NM.getBytes("ISO-8859-1"), "UTF-8"); </h5>

<hr><h3>V0.01</h3>
	write.jsp , writeaction.jsp , delete.jsp , view.jsp

	 - 메모 - 글작성 시  글제목 , 내용 NULL 일 때 글작성 안되게하기 -> 완료

<hr><h3> V0.02</h3>  
	  update.jsp , updateaction.jsp , bbs.jsp<br>
	글수정 작성 , 답글달기 작성 / 게시글 검색 , 게시판 페이징 처리(보완)
	 - 메모 -
	<br> &nbsp;  4Page 에서 수정 후 4page로 가기 -> 완료
	<br> 답글달기 -> 완료
	<br> 페이지 [1][2][3] 식으로 만들기 / 페이징 처리 마지막 페이지 글 없는데 나오는것.
	<br> 검색 버튼 누른뒤에도 검색 내용 남게하기 

<hr><h3> V0.03</h3>  
 10/16 bbs.jsp , view.jsp 
	<br>
	 게시글 검색 , 게시판 페이징 처리  
	- 메모-  : view.jsp / bbs.jsp 에서 제목,내용 부분 html 스크립트"<%","%>" 등 입력시 오류 -> replaceAll 사용하여 출력 가능하게 변경
	<br> 미해결부분
	1.while(rs.next() && skipR -- > 0); while(rs.next() && i++ < rowSize){} 문에서 rs.next()가 두번 사용되어 가장 첫글은 나오지 않는문제 
	<br> 1-2. 1문제 해결하고자 while문 하나로 변경 while(rs.next() && skipR -- > 0); 사용시 첫번째 글 부터 나오지만 2pg 3pg 이동시 게시글 출력 이		상 문제
 	 &nbsp; 1번 부분 : while문 수정으로 해결
  	 2. 검색 bbs.jsp form(96 line) 부분 value=%searchValue% 로 검색 후에도 검색어 남게하기 -> 완료 
 	<br> 2-2 페이지 이동 부분bbs.jsp line 226  에서 [2](페이지버튼)클릭시  searchValue(검색)값 유지 되도록 하기.<br>
<hr><h3> V0.04</h3>  
