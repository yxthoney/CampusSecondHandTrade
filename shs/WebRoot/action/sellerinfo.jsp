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
	String username=(String)session.getAttribute("username");	
	String gid = request.getParameter("gid");
	String gowner = request.getParameter("gowner");
	session.setAttribute("username",username);
	String sql;
	ResultSet rs;
	SqlBean.OpenConn();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>联系卖家</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	

  </head>
  
  <body>
      <%sql="select * from users where name='"+username+"'";      
      rs=SqlBean.executeQuery(sql);
	  while (rs.next()) {
       %>
      <a>我的账户余额：<input type="text"name="balance" value="<%=rs.getString("balance") %>"></a>
      <%} %>
      <table border="0" width="100%" align="center" bgcolor="#ddffff" border="0" cellpadding="10">
              <tr height="10">
                  <td width="80">商品名称</td>
                  <td width="80">价格</td>
                  <td width="80">卖家</td>
                  <td width="80">联系电话</td>
                  <td width="80">卖家地址</td>
              </tr>
              <%              
	          sql = "select * from goods,users where goods.gid='"+gid+"' and goods.gowner=users.name";
              rs=SqlBean.executeQuery(sql);
		      while (rs.next()) {	    
              %>              
              <tr height="100">
		          <td><%=rs.getString("gname") %></td>
		          <td><%=rs.getString("gprice")%></td>
		          <td><%=rs.getString("gowner")%></td>
		          <td><%=rs.getString("phone")%></td>
		          <td><%=rs.getString("addr")%></td>
		      <%} %>
		      </tr>
              <%
              rs.close();
	          SqlBean.closeStmt();
	          SqlBean.closeConn();
               %>          
      </table> 
  </body>
</html>

