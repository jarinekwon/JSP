<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Capital" id="capi"></jsp:useBean>
<jsp:setProperty property="str" name="capi"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("입력된 알파벳이 " + capi.getStr() + "는 " + capi.process());	
	%>
</body>
</html>