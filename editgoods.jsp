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
	String username=(String)session.getAttribute("username");
    session.setAttribute("username",username);  
	String sql;
	ResultSet rs;
	SqlBean.OpenConn();
	sql="select * from goods where gid='"+gid+"'";      
    rs=SqlBean.executeQuery(sql);
    String gclass;
	while (rs.next()) {
	  gclass=rs.getString("gclass");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    <base href="<%=basePath%>">
    
    <title>修改商品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	

  </head>
  
  <body>
  <input type="button" onclick="location='mytrade.jsp'" value="查看出售物品">
  <input type="button" onclick="location='newsale.jsp'" value="出售新商品">
  <input class="border" type="button" onclick="location='editsale.jsp'" value="修改商品信息">
  <input type="button" onclick="location='deletesale.jsp'" value="删除出售物品">
  <input type="button" onclick="location='orderasseller.jsp'" value="查看订单">
         
      <form action="action/editgoodsaction.jsp" method="post">
      <table width="100%" align="center" cellpadding="10">
              <tr>
              <td>
                                                  商品信息：
                  </td>
              </tr>
              <tr height="10">
                  <td width="50">名称</td>
                  <td><input type="text" name="gname" value=<%=rs.getString("gname")%>></td>
              </tr>
              <tr>   
              <td>商品分类</td>
              <td>
                <input type="radio" name="gclassify" value="food" <%if(gclass.trim().equals("food")){ %>checked<%} %>>食品 &nbsp;
                <input type="radio" name="gclassify" value="clothing" <%if(gclass.trim().equals("clothing")){ %>checked<%} %>>服装&nbsp;
                <input type="radio" name="gclassify" value="dailyuse" <%if(gclass.trim().equals("dailyuse")){ %>checked<%} %>>日用&nbsp;
                <input type="radio" name="gclassify" value="study" <%if(gclass.trim().equals("study")){ %>checked<%} %>>学习 &nbsp;
                <input type="radio" name="gclassify" value="sports" <%if(gclass.trim().equals("sports")){ %>checked<%} %>>运动&nbsp;
                <br>
                <input type="radio" name="gclassify" value="digital" <%if(gclass.trim().equals("digital")){ %>checked<%} %>>数码&nbsp;
                <input type="radio" name="gclassify" value="furniture" <%if(gclass.trim().equals("furniture")){ %>checked<%} %>>家具 &nbsp;
                <input type="radio" name="gclassify" value="toy" <%if(gclass.trim().equals("toy")){ %>checked<%} %>>玩具&nbsp;
                <input type="radio" name="gclassify" value="other" <%if(gclass.trim().equals("other")){ %>checked<%} %>>其它&nbsp;
              </td>
              </tr>
              <tr>
                  <td width="50">价格</td>
                  <td><input type="text" name="gprice" value=<%=rs.getString("gprice")%>></td>
              </tr>
              <tr>
                  <td width="50">描述</td>
                  <td><input type="text" size=100 name="gdescription" value=<%=rs.getString("gdescription")%>></td>
              </tr>      
		      <tr>
		          <td align="center">
		          <input type="hidden" name=gid value=<%=gid%>>
		          <input type="submit" value="确认修改">
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


