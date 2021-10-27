# Helping-JSP-Oracle11g
<h2>우리집주변 일대일 자원봉사 매칭 서비스 </h2><br>
<h3>V0.00</h3>
login.jsp , loginaction.jsp , main.jsp , bbs.jsp <br>
오라클 DB연동 , 메인페이지 , 게시판 틀 작성

-메모- login.jsp 에서 이름 한글 입력시 한글꺠짐 오류 발생 하였다.
 PageEncoding = "UTF-8" 은 *.JSP파일 자체의 인코딩 방법이었고
 
 클라이언트 (브라우저) 로 응답정보를 내리는 헤더 정보에 포함되는 값 이 된다. (문서의 Charset = UTF-8)
 ContentType="text/html; charset = UTF-8"  은 사용자가 서버로 JSP 요청을 하면 서버(WAS) 측에서
 html을 통한 문자 전송시 ISO-8859-1 charset 이외의 문자들은 인코딩 되어 서버측으로 전송하게 되고
 서버측은 인코딩된 문자를 받아서 디코딩 한다. 따라서 
 브라우저를 통해 전송할때 charset 자체를 지원하지 않기때문에 default 인코딩 charset인 ISO-8859-1로
 디코딩 되어 한글이 깨졌고 깨진 한글을 다시 ISO-8859-1로 인코딩후 UTF-8로 디코딩 해주면 정상적으로 한글을
 확인할 수 있게 된다. /* 하기 코드 참조 */
 String USER_NM = request.getParameter("INPUT_USER_NM");	
 <h5>USER_NM        = new String(USER_NM.getBytes("ISO-8859-1"), "UTF-8"); </h5>

<hr><h3>V0.01</h3>

