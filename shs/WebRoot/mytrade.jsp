<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username=(String)session.getAttribute("username");
ResultSet rs;
String sql;
SqlBean.OpenConn();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的交易</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <input class="border" type="button" onclick="location='mytrade.jsp'" value="查看出售物品">
  <input type="button" onclick="location='newsale.jsp'" value="出售新商品">
  <input type="button" onclick="location='editsale.jsp'" value="修改商品信息">
  <input type="button" onclick="location='deletesale.jsp'" value="删除出售物品">
  <input type="button" onclick="location='orderasseller.jsp'" value="查看订单">
      <table width="100%" align="center" border="1" cellpadding="10">
          <thead align="center" valign="middle">
          <tr>
              <td colspan=5><b>我出售的物品</b><br>*灰色物品为下架物品，物品下架后不会显示在购买页</td>
          </tr>
          </thead>
          <tr height="2">
              <td width="80">名称</td>
              <td width="80">价格</td>
              <td width="100">描述</td>
              <td width="100">图片</td>
              <td width="80">操作</td>
          </tr>
             <%              
              sql="select * from goods where gowner='"+username+"' order by soldout";
              rs=SqlBean.executeQuery(sql);
              String img;
              while(rs.next()){                                        
              %>
                  <tr height="2">
                  <td colspan=5>                  
                  <form action="action/onoroutsaleaction.jsp" method="post">
                  <table width="100%" align="center" cellpadding="10">
                  <%
                  String soldout=rs.getNString("soldout");	
                  if(soldout.equals("0")){	  
                   %>
                  <tr>
                  <td width="80"><%=rs.getString("gname") %><br></td>
		          <td width="80"><%=rs.getString("gprice")%></td>
		          <td width="100"><%=rs.getString("gdescription")%></td>
		          <%img="upload/"+rs.getString("gpicture");%>
		          <td width="100"><img src="<%=img%>" width="100" height="100"></td>
		          <td width="80">
		              <input type="hidden" name="onorout" value="out">
		              <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
		              <input type="submit" value="下架">
                  <%}
                  else{ %>
                  <tr bgcolor="#cccccc">
                  <td width="80"><%=rs.getString("gname") %><br></td>
		          <td width="80"><%=rs.getString("gprice")%></td>
		          <td width="100"><%=rs.getString("gdescription")%></td>
		          <%img="upload/"+rs.getString("gpicture");%>
		          <td width="100"><img src="<%=img%>" width="100" height="100"></td>
		          <td width="80">
		              <input type="hidden" name="onorout" value="on">
		              <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
		              <input type="submit" value="上架">
                  <%}
                  %>		          
		          </td>
		          </tr>
		          </table>
		          </form>
		          </td>
		          </tr> 
		          <%
		              }
	               %>        
      </table>      
      <% rs.close();
	     SqlBean.closeStmt();
	     SqlBean.closeConn(); 
	  %>
  </body>
</html>
