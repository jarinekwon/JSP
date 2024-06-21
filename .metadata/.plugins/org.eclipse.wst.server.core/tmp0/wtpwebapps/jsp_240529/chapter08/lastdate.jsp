<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie lastDate = null;
	String msg = ""; // 화면 출력 메시지
	boolean found = false; // 처음 방문 여부
	String newValue = "" + System.currentTimeMillis(); // 현재시간 정보를 위한 값
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		System.out.print("@# cookies.length => " + cookies.length);
		
		for(int i = 0; i < cookies.length; i++){
			lastDate = cookies[i];
			if(lastDate.getName().equals("lastDateCookie")) {
// 			반복하면서 쿠키이름이 lastDateCookie가 있으면 처음 방문이 아님
				found = true;
				break;
			}
		}
		
		if(!found){ // 처음 방문
			msg = "처음 방문입니다...";
			lastDate = new Cookie("lastDateCookie", newValue);
// 			처음 방문일 때 lastDateCookie 쿠키이름으로 시간정보를 저장
			lastDate.setMaxAge(365*24*60*60);
			lastDate.setPath("/");
			response.addCookie(lastDate);
		} else{ // 처음 방문이 아님(lastDate 쿠키객체에 같이 있음)
			long conv = Long.parseLong(lastDate.getValue());
// 			lastDate 쿠키에 있는 시간정보 값을 long 변수로 가져옴
			msg = "당신의 마지막 방문: " + new Date(conv);
			lastDate.setValue(newValue);
// 			다음 방문을 위한 값 설정
			response.addCookie(lastDate);
		}
// 		if/else 처음방문/아닐때(lastDate 쿠키객체에 같이 있음)
// 		처음이든 아니든 lastDate 쿠키객체를 만들어줌
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= msg %></h2>
</body>
</html>