<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>error!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <table width=100%>
    <tr>
      <td width=60% align="center">
      <img src="img/error.png" align="middle">
      </td>
      
      <td>
      <%=session.getAttribute("errorInfo") %>
      <br><br><br>      	
      <input onclick=history.go(-1) type=button value="·µ»Ø">  
      </td> 
    </tr>
  </table>
  </body>
</html>
