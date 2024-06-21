<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("input", "");
// 	pageContext -> jsp 기본 객체
// 	input 필드에 널값 셋팅
	pageContext.setAttribute("input2", "bbb");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[표현 언어의 연산자]</h3>
	${empty ""}<br>
<!-- 	""의 값이 없어서 참 -->
	\${empty ""} => ${empty ""}<br> 
	\${empty "aaa"} => ${empty "aaa"}<br> 
<!-- 	"aaa"의 값이 있어서 거짓 -->
	\${empty input} => ${empty input}<br>
<!-- 	input 필드에 값이 있어서 참 -->
	\${empty input2} => ${empty input2}<br>
<!-- 	input2 필드에 값이 있어서 거짓 -->
	\${(5>2) ? 5:2} => ${(5>2) ? 5:2}<br>
	\${5>2} => ${5>2}<br>
	\${2 gt 10} => ${2 gt 10}<br>
	\${5+2} => ${5+2}<br>
	\${5/2} => ${5/2}<br>
	\${5%2} => ${5%2}<br>
	\${5 mod 2} => ${5 mod 2}<br>
</body>
</html>