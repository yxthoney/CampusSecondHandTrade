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
	String username=(String)session.getAttribute("username");
    session.setAttribute("username",username);
    String addr = request.getParameter("addr");
    String phone = request.getParameter("phone");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	if(password2.trim()==""||password.trim()=="")
	{
	    session.setAttribute("errorInfo","输入不能为空!");
		response.sendRedirect("../error.jsp");
	}
    if(!password2.trim().equals(password.trim()))
	{
	    session.setAttribute("errorInfo","两次输入密码不一致!");
		response.sendRedirect("../error.jsp");
	}
	boolean exist=false;
	String sql = "select * from users where name='" + username+ "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if (exist) {
		    sql ="update users set password='"+password+"',phone='"+phone+"',addr='"+addr+"' where name='"+username+"'";
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

