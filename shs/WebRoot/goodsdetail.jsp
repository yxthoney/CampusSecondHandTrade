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
    
    <title>��Ʒ��ϸ��Ϣ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <%
              String username=(String)session.getAttribute("username");
              session.setAttribute("username",username); 
              String gid = (String)request.getParameter("gid"); 
              String sql="select * from goods,users where goods.gid='"+gid+"' and goods.gowner=users.name";
              SqlBean.OpenConn();
              ResultSet rs=SqlBean.executeQuery(sql);
              String img;
              while(rs.next()){
                img="upload/"+rs.getString("gpicture");
               %> 
    <form action="action/buyaction.jsp" method="post"> 
    <table width=100% >
  <tr>
    <th rowspan="6" scope="col"><img src=<%=img %> width=300></th>
    <th colspan="2" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <td rowspan="2" align="left" valign="top">&nbsp;</td>
    <td><p class="bold">��Ʒ��Ϣ</p>      </td>
  </tr>
  <tr>
    <td><p>��Ʒ���ƣ�<%=rs.getString("gname") %></p>
      <p>�۸�<%=rs.getString("gprice")%></p>
    <p>������<%=rs.getString("gdescription")%></p></td>
  </tr>
  <tr>
    <td rowspan="2">&nbsp;</td>
    <td><p class="bold">������Ϣ</p>    </td>
  </tr>
  <tr>
    <td><p>���������<%=rs.getString("gowner") %></p>
    <p>��ϵ�绰��<%=rs.getString("phone")%></p>
    <p>��ϵ��ַ��<%=rs.getString("addr")%></p>
    </td>
  </tr>
  <tr>
    <td colspan="2"><br>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="hidden" name="gid" value=<%=rs.getString("gid")%>>
    <input type="submit" value="���빺�ﳵ">
    &nbsp;&nbsp;&nbsp;
      <input onclick=history.go(-1) type=button value="����"> 
    </td>
    
  </tr>
</table>
     </form>
    <%
              }
              rs.close();
	          SqlBean.closeStmt();
	          SqlBean.closeConn();
               %>
  </body>
</html>
