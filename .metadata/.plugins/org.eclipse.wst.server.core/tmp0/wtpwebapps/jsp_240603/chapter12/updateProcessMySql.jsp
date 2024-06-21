<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
	<%!
		Connection conn = null;
		DataSource ds = null;
		PreparedStatement pstmt = null;
	%>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
// 			Context ctx = new InitialContext();
// 			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
// 			conn = ds.getConnection();
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/mysql"))).getConnection();
		}catch(NamingException ne) {
			ne.printStackTrace();
		}catch(SQLException ex){
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage());
		}
		
		String id = "", name = "", v_class = "", tel = ""; 	
		id = request.getParameter("id");
		name = request.getParameter("name");
		v_class = request.getParameter("m_class");
		tel = request.getParameter("tel");
	
		StringBuffer updateQuery = new StringBuffer();
		updateQuery.append("update member2 set name=?, class=?, tel=? where id=?");
		
		try {
			pstmt = conn.prepareStatement(updateQuery.toString());
			pstmt.setString(1, name); // varchar 타입은 setString 메소드 사용
// 			pstmt.setString(2, v_class); // mysql 가서 casting(속도 저하)
			pstmt.setInt(2, Integer.parseInt(v_class)); // int 타입은 setInt 메소드 사용
			pstmt.setString(3, tel);
			pstmt.setString(4, id);
// 			? 4개 순서대로 값을 셋팅
		
			int re = pstmt.executeUpdate(); // 정상적으로 수정시 1이 반환

			if(re == 1) {
				%>
					<%= id %>의정보가 수정되었습니다.<br>
					[<a href="viewMemberMySql.jsp">목록보기</a>]
				<%
			} else {
				%>
					변경 실패
				<%
			}
		}catch(SQLException ex){
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage());
		}
		finally{
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}
			catch (SQLException se){
				se.printStackTrace();
			}
		}
	%>
</body>
</html>