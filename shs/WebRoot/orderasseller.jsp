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
	String sql,sql2;
	SqlBean.OpenConn();
	ResultSet rs,rs2;
	
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
  <input type="button" onclick="location='mytrade.jsp'" value="�鿴������Ʒ">
  <input type="button" onclick="location='newsale.jsp'" value="��������Ʒ">
  <input type="button" onclick="location='editsale.jsp'" value="�޸���Ʒ��Ϣ">
  <input type="button" onclick="location='deletesale.jsp'" value="ɾ��������Ʒ">
  <input class="border" type="button" onclick="location='orderasseller.jsp'" value="�鿴����">
              <%                            
	          sql = "select * from orders,goods where orders.gid=goods.gid and goods.gowner='"+username+"'";
	          rs=SqlBean.executeQuery(sql);
	          String img;
	          String buyer;
	          int i=0;
		      while (rs.next()) {	
		      buyer=rs.getString("buyer");   
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
		                  ��ң�<%=buyer%><br>
		       <%
		           sql2 = "select * from users where name='"+buyer+"'";
	               rs2=SqlBean.executeQuery(sql2);
	               rs2.next();
		       %>
		                            ��ϵ�绰��<%=rs2.getString("phone") %><br>
		                           ��ϵ��ַ��<%=rs2.getString("addr") %><br>        
                </div>
		          </form>
		          <%  
		          rs2.close();         
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
