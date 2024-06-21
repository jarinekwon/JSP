<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Asterisk" id="ast"></jsp:useBean>
<jsp:setProperty property="num" name="ast"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("입력된 정수가 " + ast.getNum() + "는 <br>" + ast.process());
		
	%>
	
<%-- 	<% --%>
<!--	for(int i = ast.getNum(); i > 0; i--) { -->
<!-- 		out.println(ast.process(i)+ "<br>"); -->
<!-- 	} -->
<%-- 	%> --%>
</body>
</html>