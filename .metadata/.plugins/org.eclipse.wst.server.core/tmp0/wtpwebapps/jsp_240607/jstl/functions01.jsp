<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>java 문자열 출력</p>
	<p>fn:contains : 문자열 포함 여부</p>
	<p>Hello, Java Server Page! => ${fn:contains("Hello, Java Server Page!", "java") }	
	<p>Hello, Java Server Page! => ${fn:contains("Hello, Java Server Page!", "Java") }	
	
	<p>fn:containsIgnoreCasse : 문자열 포함 여부</p>
	<p>Hello, Java Server Page! => ${fn:containsIgnoreCase("Hello, Java Server Page!", "java") }	
	<p>Hello, Java Server Page! => ${fn:containsIgnoreCase("Hello, Java Server Page!", "Java") }	
</body>
</html>