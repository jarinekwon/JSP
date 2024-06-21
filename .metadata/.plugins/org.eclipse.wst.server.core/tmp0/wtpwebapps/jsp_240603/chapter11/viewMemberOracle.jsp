<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	Statement stmt = null;
// 	쿼리문 이용을 위한 인터페이스
	ResultSet rs = null;
// 	쿼리 결과를 받기 위한 인터페이스

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	String sql = "select id, pw, name, class, tel from member2";
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver"); // 생략 가능
				conn = DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
// 				createStatement() 메소드 호출해서 쿼리 이용하는 Statement 객체 생성
				rs = stmt.executeQuery(sql);
// 				executeQuery 메ㅗㅅ드로 select 쿼리 실행
// 				쿼리 결과는 ResultSet으로 담음
				
				while(rs.next()) {
// 				next() -> 쿼리 결과가 있으면 참
					%>
					<tr>
						<td><%= rs.getString("id") %></td>
<!-- 						getString -> 문자타입의 컬럼 값 받을 때 사용 -->
						<td><%= rs.getString("name") %></td>
						<td>
							<%
								int n_class = rs.getInt("class");
// 								getInt -> 숫자타입의 컬럼 값을 받을 때 사용
								if (n_class == 1) {
									out.print("일반회원");
								} else {
									out.print("교수님");
								}
							%>
						</td>
						<td><%= rs.getString("tel") %></td>
					</tr>
					<%
				}
				out.print("데이터베이스 연결이 성공했습니다.");
			}catch(SQLException ex){
				out.print("데이터베이스 연결이 실패했습니다.");
				out.print(ex.getMessage());
			}finally{
				try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
				}
				catch (SQLException se){
					se.printStackTrace();
				}
			}
		%>
	</table>
</body>
</html>