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
	String username=(String)session.getAttribute("username");
	String oid = request.getParameter("oid");
	session.setAttribute("username",username); 
	    boolean exist=false;
	    String sql = "select * from users where name='" + username+ "'"; //判断用户是否登录
	    SqlBean.OpenConn();
        ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if(exist){
			sql = "delete from orders where oid='"+oid+"'";	 
			SqlBean.executeUpdate(sql);
            response.sendRedirect("../myorder.jsp");   	   
		}
		else{
		    session.setAttribute("errorInfo","请登录!");
			response.sendRedirect("../error.jsp");		    
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

