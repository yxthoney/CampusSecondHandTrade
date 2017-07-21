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
	session.setAttribute("username",username); 
	String gid = request.getParameter("gid");	
	    boolean exist=false;
	    String sql = "select * from users where name='" + username+ "'"; //判断用户是否登录
	    SqlBean.OpenConn();
        ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if(exist){
		    exist=false;
		    sql="select * from orders where gid='" + gid+ "'and buyer='"+username+"'"; //判断用户是否已经购买过该物品
            rs=SqlBean.executeQuery(sql);
		    while (rs.next()) {
		        exist = true;		    
		    }
    		if (!exist) {		    
    		    sql = "select gowner from goods where gid='" + gid+ "'"; //判断这个物品的卖家是否是自己
    		    rs=SqlBean.executeQuery(sql);
    		    boolean isme=false;
    		    String owner;
    		    while (rs.next()){
    		        owner=rs.getString("gowner");
    		        if(owner.trim().equals(username.trim())){
    		            isme=true;
    		        }
    		    }
    		    if(isme){
    		        session.setAttribute("errorInfo","不能购买自己的物品哦!");
    		        response.sendRedirect("../error.jsp");
    		    }
    		    else{
    		        sql =String.format("insert into orders(gid,buyer) values('%s','%s')",gid,username);
                    SqlBean.executeUpdate(sql);
                    response.sendRedirect("../myorder.jsp");
                }
    	    }
    	    else{
    	        session.setAttribute("errorInfo","您已经购买过该物品啦!");
    		    response.sendRedirect("../error.jsp");
    	    }	   
		}
		else{
		    session.setAttribute("errorInfo","请登录!");
			response.sendRedirect("../error.jsp");		    
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

