<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Arithmetic" id="ari"></jsp:useBean>
<jsp:setProperty property="*" name="ari"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보입니다</h4>
	<%
	out.print(ari.getA() + "와 " + ari.getB() + "의 계산 결과는 " + ari.process(ari.getA(), ari.getS(), ari.getB()));
// 	out.print(ari.getA() + "와 " + ari.getB() + "의 계산 결과는 " + ari.getA() + ari.getS() + ari.getB() + "의 계산 결과는 " + ari.process(ari.getA(), ari.getS(), ari.getB()));
	%>
</body>
</html>