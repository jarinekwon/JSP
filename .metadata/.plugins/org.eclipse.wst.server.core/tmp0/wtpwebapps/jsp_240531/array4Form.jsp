<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="array" class="question.Array4"></jsp:useBean>
<jsp:setProperty property="num" name="array"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("�Էµ� ������ ������ "+array.getNum()
			+"�� <br>"+array.process(array.getNum()));
	%>
</body>
</html>