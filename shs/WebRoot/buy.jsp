<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������Ʒ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <div >
    <form action="action/searchaction.jsp" method="post">
    <table width=80% >
    <tr>        
      <td>������Ʒ��<input type="text" name="goods" size="60"><input type="submit" value="����">
      </tr>
      </table>
       </form>
    </div>
            
              <%
              String username=(String)session.getAttribute("username");
              session.setAttribute("username",username);  
              String sql="select * from goods where soldout='0'";
              SqlBean.OpenConn();
              ResultSet rs=SqlBean.executeQuery(sql);
              String img;
              while(rs.next()){
              
               %>          
                  <form action="action/buyaction.jsp" method="post">
                  <%img="upload/"+rs.getString("gpicture");%>		              
		              <div class="goods" >
		                  <a href="goodsdetail.jsp?gid=<%=rs.getString("gid")%>">
		                  <img src=<%=img %> width=170 height=170>
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
               %> 
  </body>
</html>
