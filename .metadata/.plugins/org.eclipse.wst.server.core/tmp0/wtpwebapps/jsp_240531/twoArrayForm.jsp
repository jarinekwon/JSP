<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.TwoArray" id="tarr"></jsp:useBean>
<jsp:setProperty property="num" name="tarr"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print(tarr.getNum() + "*" + tarr.getNum() + "는 <br>" + tarr.process());	
	%>
</body>
</html>