<%@page import="db.JdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="db.JdbcUtil.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>아이디</td><td>이름</td><td>전화</td><td>주소</td><td>취미</td>
	</tr>
<%
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	try{
		con=JdbcUtil.getConnection();
		
		
		String sql="select m.mem_id,mem_name,tel,address,hobby from mem m left join mem_hobby h on m.mem_id=h.mem_id";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
			String id="";
		while(rs.next()){
			if(!id.equals(rs.getString(1))) {
		
%>
	<tr>
		<td><%=rs.getString(1) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(5) %>
<%		
	id=rs.getString(1);
		} else{
%>	
		
		<%=rs.getString(5) %>
	
<%
		
		}
		}
	} catch(Exception e){
		e.printStackTrace();	
		if(con != null) con.rollback();
	}finally{
		if(pstmt != null)
		pstmt.close();
		if(rs!=null)
		rs.close();
		if(con != null)
		con.close();
		
	}
%>
</table>
</body>
</html>