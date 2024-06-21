<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
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
	<%
		Connection conn = null;
// 		데이터베이스 연결을 위한 인터페이스
		try {
// 		데이터베이스 서버나 네트워크 오류가 발생할 수 있기에 예외처리
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 			연결정보 -> 자기 pc에 포트: 3306, database: atom
			String user = "scott";
			String password = "tiger";
// 			데이터베이스 아이디/비밀번호

			Class.forName("oracle.jdbc.driver.OracleDriver"); 
// 			mysql jdbc 드라이버 로딩
			conn = DriverManager.getConnection(url, user, password);
// 			getConnection 메소드로 데이터베이스 정보를 통해서 db연결
			out.print("데이터베이스 연결이 성공했습니다.");
		}
		catch(SQLException ex) {
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage());
// 			getMessage() -> 기본 오류 메세지
		}
		finally {
			if(conn != null) {
				conn.close();
// 				Connection 객체에 연결정보가 있으면 종료 
			}
		}
	%>
</body>
</html>