<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
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
	boolean exist=false;
	String sql = "select * from users where name='" + username+ "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if (exist) {
		    session.setAttribute("errorInfo"," 该用户名已存在!");
			response.sendRedirect("../error.jsp");

	    }
	    else{
	        sql=null;
		    sql =String.format("insert into users(name,password,balance,phone,addr) values('%s','%s','0',null,null)",username,password);
		    SqlBean.executeUpdate(sql);
		    response.sendRedirect("../login.jsp");
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

