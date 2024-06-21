<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>[ 세션 값을 얻어오는 메소드를 사용한 예제 ]</h3>
		<hr>
	</center>
		<%
			String str_id = session.getId();
// 			getId() -> 세션 고유의 id를 가져옴
			long last_time = session.getLastAccessedTime();
// 			getLastModified() -> 클라이언트로 마지막으로 요청 보낸 시간을 long형으로 변환(밀리세컨드)
			long create_time = session.getCreationTime();
// 			getCreationTime() -> 세션 만들어진 시간(밀리세컨드)
			long time_used = (last_time - create_time) / 60000;
// 			웹 사이트에 머문 시간(분)
			int inactive = session.getMaxInactiveInterval() / 60; // 분으로 계산
// 			getMaxInactiveInterval() -> 세션 유지 시간(기본은 30분) => 초 단위
			boolean b_new = session.isNew();
		%>
		[1] 세션 ID는 [<%= str_id %>] 입니다.<br><br>
		[2] 당신이 웹 사이트에 머문 시간은 [<%= time_used %>]분 입니다.<br><br>
		[3] 세션의 유효시간은 [<%= inactive %>]분 입니다.<br><br>
		[4] 세션이 새로 만들어졌나요?<br>
		<%
			if(b_new) {
				out.print("예!! 새로운 세션을 만들었습니다.");
			} else {
				out.print("아니요!! 새로운 세션을 만들지 않았습니다.");
				
			}
		%>

</body>
</html>