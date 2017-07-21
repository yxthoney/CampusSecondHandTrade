<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    request.setCharacterEncoding("gb2312");
	response.setContentType("text/html;charset=gb2312");
	response.setCharacterEncoding("gb2312");	
	String username=(String)session.getAttribute("username");
    session.setAttribute("username",username); 
    String goods=request.getParameter("goods");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">

  </head>
  
  <body>
      <input onclick=history.go(-1) type=button value="返回"><br> 
      <%String sql="select * from goods where gname like '%"+goods+"%'or gdescription like '%"+goods+"%'or gclass like '%"+goods+"%'";
              SqlBean.OpenConn();
              ResultSet rs=SqlBean.executeQuery(sql);
              String img;
              int i=0;
              while(rs.next()){
              i++;
               %> 
               
               <form action="action/buyaction.jsp" method="post">        
                  <%img="upload/"+rs.getString("gpicture");%>		              
		              <div class="goods">
		                  <a href="goodsdetail.jsp?gid=<%=rs.getString("gid")%>">
		                  <img src=<%=img %> width=170 height=170">
		                  </a>
		                  <br>
		                  商品名称：<%=rs.getString("gname") %><br>
		                  价格：<%=rs.getString("gprice")%><br>
		                  卖家：<%=rs.getString("gowner") %><br>
		                  <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
		                  <input type="submit" value="加入购物车">
		              </div>
		              </form>
              <%
              }
              rs.close();
	          SqlBean.closeStmt();
	          SqlBean.closeConn();
	          if(i==0){
               %> 
                                没有找到符合条件的商品！<%=goods %>
          <%} %>
  </body>
</html>
