<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
<%@page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("gb2312");
	response.setContentType("text/html;charset=gb2312");
	response.setCharacterEncoding("gb2312");
	String username=(String)session.getAttribute("username");
	session.setAttribute("username",username);
	String sql;
	SqlBean.OpenConn();
	ResultSet rs;
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ҵĶ���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
              <%              
	          sql = "select * from orders,goods where buyer='"+username+"' and orders.gid=goods.gid";
	          rs=SqlBean.executeQuery(sql);
	          String img;
	          int i=0;
		      while (rs.next()) {	   
		      i++; 
              %>               
                  <form action="action/deleorder.jsp" method="post">
                  <%img="upload/"+rs.getString("gpicture");%>		              
		              <div class="goods">
		                 <a href="goodsdetail.jsp?gid=<%=rs.getString("gid")%>">
		                  <img src=<%=img %> width=170 height=170>
		                  </a>
		                  <br>
		                  ��Ʒ���ƣ�<%=rs.getString("gname") %><br>
		                  �۸�<%=rs.getString("gprice")%><br>		                  
		                  ���ң�<%=rs.getString("gowner") %><br>
		                  <input type="hidden" name="oid" value=<%=rs.getString("oid")%>>
		                  <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
		                  <input type="submit" value="ɾ��">
		              </div>
		          </form>      	      
              <%              
              }
              if(i==0){%>
	          
	          <p >���ﳵΪ�գ�ȥ<a href="buy.jsp">����</a>�ɣ�</p>
	          
	         <%}
              rs.close();
	          SqlBean.closeStmt();
	          SqlBean.closeConn();
              %>              	 
  </body>
</html>
