<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";	
	String username=(String)session.getAttribute("username");
    session.setAttribute("username",username); 
    String classify = (String)request.getParameter("classify");
    session.setAttribute("classify",classify); 
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����鿴��<%=classify %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
      <table  width=100% align="center">
      <tr bgcolor=#e9e9e9 >
        <td >
          &nbsp;&nbsp;&nbsp;&nbsp;
             	 <%if(classify.equals("food")){ %>  
             	 ʳƷ���� 
             	 <%} %>
             	 <%if(classify.equals("clothing")){ %>  
             	��װ����
             	 <%} %>
             	 <%if(classify.equals("dailyuse")){ %>  
             	 ���÷��� 
             	 <%} %>
             	 <%if(classify.equals("study")){ %>  
             	ѧϰ����
             	 <%} %>
             	 <%if(classify.equals("sports")){ %>  
             	 �˶�����
             	 <%} %>
             	 <%if(classify.equals("digital")){ %>  
             	�������
             	 <%} %>
             	 <%if(classify.equals("furniture")){ %>  
             	 �Ҿ߷���
             	 <%} %>
             	 <%if(classify.equals("toy")){ %>  
             	��߷��� 
             	 <%} %>
             	 <%if(classify.equals("other")){ %>  
             	 ������Ʒ 
             	 <%} %>
          </td>
      </tr>
      <tr>
        <td>
          <%String sql="select * from goods where gclass='" +classify+ "'";
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
		                  ��Ʒ���ƣ�<%=rs.getString("gname") %><br>
		                  �۸�<%=rs.getString("gprice")%><br>
		                  ���ң�<%=rs.getString("gowner") %><br>
		                  <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
		                  <input type="submit" value="���빺�ﳵ">
		              </div>
		              </form>
              <%
              }
              rs.close();
	          SqlBean.closeStmt();
	          SqlBean.closeConn();
	          if(i==0){
               %> 
               �÷�����û����Ʒ��
          <%} %>
          </td>
      </tr>
      </table>
  </body>
</html>
