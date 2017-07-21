<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*" %>
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
	String gid = request.getParameter("gid");
	String gname = request.getParameter("gname");
	String gprice = request.getParameter("gprice");
	String gdescription = request.getParameter("gdescription");
	String gclassify = request.getParameter("gclassify");
	String username=(String)session.getAttribute("username");
	session.setAttribute("username",username); 
	boolean exist=false;
	String sql = "select * from users where name='" + username+ "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if (exist) {	    
		    sql ="update goods set gname='"+gname+"',gclass='"+gclassify+"',gprice='"+gprice+"',gdescription='"+gdescription+"' where gid='"+gid+"'";
		    SqlBean.executeUpdate(sql);
		    session.setAttribute("result","修改成功!");
		    response.sendRedirect("../success.jsp");
	    }
	    else{
	        session.setAttribute("errorInfo","请登录!");
			response.sendRedirect("../error.jsp");
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

