<%@page import="java.sql.*"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("utf-8");
	String username = request.getParameter("name");
	String password = request.getParameter("password");
	boolean exist = false;
	String pass=null;
	String sql = "select * from users where name='" + username + "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
			pass = rs.getString("password");
			exist=true;
		}
	if (exist&&password.trim().equals(pass.trim())) {
		session.setAttribute("username", username);
		response.sendRedirect("../homepage.jsp");
	}
	else{
	    session.setAttribute("errorInfo","登录出错!");
		response.sendRedirect("../error.jsp");
	}
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

