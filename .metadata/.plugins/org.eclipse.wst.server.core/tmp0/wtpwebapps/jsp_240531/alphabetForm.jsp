<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Alphabet" id="alph"></jsp:useBean>
<jsp:setProperty property="str" name="alph"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("입력된 알파벳이 " + alph.getStr() + "는 " + alph.process());	
	%>
</body>
</html>