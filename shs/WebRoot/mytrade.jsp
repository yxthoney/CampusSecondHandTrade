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
    
    <title>�ҵĽ���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <input class="border" type="button" onclick="location='mytrade.jsp'" value="�鿴������Ʒ">
  <input type="button" onclick="location='newsale.jsp'" value="��������Ʒ">
  <input type="button" onclick="location='editsale.jsp'" value="�޸���Ʒ��Ϣ">
  <input type="button" onclick="location='deletesale.jsp'" value="ɾ��������Ʒ">
  <input type="button" onclick="location='orderasseller.jsp'" value="�鿴����">
      <table width="100%" align="center" border="1" cellpadding="10">
          <thead align="center" valign="middle">
          <tr>
              <td colspan=5><b>�ҳ��۵���Ʒ</b><br>*��ɫ��ƷΪ�¼���Ʒ����Ʒ�¼ܺ󲻻���ʾ�ڹ���ҳ</td>
          </tr>
          </thead>
          <tr height="2">
              <td width="80">����</td>
              <td width="80">�۸�</td>
              <td width="100">����</td>
              <td width="100">ͼƬ</td>
              <td width="80">����</td>
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
		              <input type="submit" value="�¼�">
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
		              <input type="submit" value="�ϼ�">
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
