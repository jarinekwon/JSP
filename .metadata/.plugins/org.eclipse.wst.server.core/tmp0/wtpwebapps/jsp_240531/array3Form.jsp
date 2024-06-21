<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Array3" id="arr"></jsp:useBean>
<jsp:setProperty property="num" name="arr"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("입력된 정수의 갯수 " + arr.getNum() + "는 <br>" + arr.process());	
	%>
	
</body>
</html>