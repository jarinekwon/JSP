<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		Connection conn = null;
		DataSource ds = null;
	%>
	<%
		try {
			Context ctx = new InitialContext();
// 			InitialContext() -> dbcp 사용하기 위해 객체 생성
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			out.print("DBCP 연동 성공");
		} catch(NamingException ne) {
// 		dbcp name을 못찾을 때 사용
			ne.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
// 				dbcp 연결된 정보가 있으면 자동 반납
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>