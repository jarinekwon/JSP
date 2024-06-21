<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String number = request.getParameter("number");
	%>
<%-- 	<c:set var="number" value="${number}"></c:set> --%>
	<c:set var="number" value="<%= number %>"></c:set>
	<c:out value="${number}"></c:out>
	<c:choose>
<%-- 	다중 조건문 --%>
		<c:when test="${number %2 == 0}">
<%-- 		조건이 참일 때(test에 조건식에 var 변수를 사용) --%>
			<c:out value="${number}"></c:out>
		</c:when>
		<c:when test="${number %2 == 1}">
			<c:out value="${number}"></c:out>
		</c:when>
	</c:choose>
</body>
</html>