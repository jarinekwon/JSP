<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%!
	Connection conn = null;
	Statement stmt = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
// 	String sql = "select id, pw, name, class, tel from member2";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = "", pw = "", name = "", sclass = "", p1 = "", p2 = "", p3 = "";			
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		sclass =request.getParameter("mclass");
		p1 = request.getParameter("phone1");
		p2 = request.getParameter("phone2");
		p3 = request.getParameter("phone3");
			
		try{
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			StringBuffer insertQuery = new StringBuffer();
			insertQuery.append("insert into member2 values('");
			insertQuery.append(id + "' , '");
			insertQuery.append(pw + "' , '");
			insertQuery.append(name + "' , '");
			insertQuery.append(sclass + "' , '");
			insertQuery.append(p1 + "-" + p2 + "-" + p3 + "')");
// 			insertQuery 조립

			out.print(insertQuery.toString());
// 			조합한 쿼리 확인				
			int re = stmt.executeUpdate(insertQuery.toString());
// 			executeUpdate 메소드는 insert 할 때 사용
				
			if(re == 1) {
				%>
					추가 성공
					<br>
					<a href="addFormOracle.html">추가작업</a>
					<a href="viewMemberOracle.jsp">조회작업</a>
				<%
			} else {
				%>
					<font color="red">추가 실패</font>
				<%
			}
				
		}catch(SQLException ex){
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print(ex.getMessage());
		}finally{
			try {
				if(stmt != null) {stmt.close();}
				if(conn != null) {conn.close();}
			}
			catch (SQLException se){
				se.printStackTrace();
			}
		}
		%>
</body>
</html>