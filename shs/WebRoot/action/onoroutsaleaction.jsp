<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
<%@page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";    
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("utf-8");
	String gid = request.getParameter("gid");
	String onorout = request.getParameter("onorout");
	String username=(String)session.getAttribute("username");
	boolean exist=false;
	String sql = "select * from users where name='" + username+ "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if (exist) {
		    if(onorout.equals("out")){
		        sql = "update goods set soldout='1' where gid='"+gid+"'";
            }
            else if((onorout.equals("on"))){
                sql = "update goods set soldout='0' where gid='"+gid+"'";		        
            }
            SqlBean.executeUpdate(sql);
            response.sendRedirect("../mytrade.jsp");
	    }
	    else{
	        session.setAttribute("errorInfo","请登录!");
			response.sendRedirect("../error.jsp");
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

