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
    session.setAttribute("username",username);  
	String sql;
	ResultSet rs;
	SqlBean.OpenConn();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改我的信息</title>
    
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
      <form action="action/editinfoaction.jsp" method="post">
      <table width="100%" align="left" cellpadding="10">
              <tr>
                  <td colspan=2>*提交我的交易之前一定要完善个人信息，不然买家无法和您取得联系哦！
                  <br><br>
                  <b>我的信息：</b>
                  </td>
              </tr>
              <tr>
                  <td width="20%">联系电话</td>
                  <td><input type="text" name="phone" value=<%=rs.getString("phone")%>></td>                  
		      </tr>
		      <tr>
                  <td>联系地址</td>
                  <td><input type="text" name="addr" value=<%=rs.getString("addr")%>></td>
              </tr>
		      <tr>
                  <td>密码</td>
                  <td><input type="password" name="password" value=<%=rs.getString("password")%>></td>
              </tr>
		      <tr>
                  <td>重复密码</td>
                  <td><input type="password" name="password2" value=<%=rs.getString("password")%>></td>
              </tr> 
		      <tr>
		          <td><input type="submit" value="确认修改">
		          </td>
		      </tr>
       <%}
       rs.close();
	   SqlBean.closeStmt();
	   SqlBean.closeConn();
       %>          
      </table> 
      </form>
  </body>
</html>


