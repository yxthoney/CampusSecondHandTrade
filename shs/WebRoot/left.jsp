<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>left</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">


  </head>
  
  <body bgcolor=#e9e9e9>
  <div align="center">
    <br><br>
    <a class="a1" href="classify.jsp?classify=food" target="center1">ʳƷ</a><br>
    <a class="a1" href="classify.jsp?classify=clothing" target="center1">��װ</a><br>
    <a class="a1" href="classify.jsp?classify=dailyuse" target="center1">����</a><br>
    <a class="a1" href="classify.jsp?classify=study" target="center1">ѧϰ</a><br>
    <a class="a1" href="classify.jsp?classify=sports" target="center1">�˶�</a><br>
    <a class="a1" href="classify.jsp?classify=digital" target="center1">����</a><br>
    <a class="a1" href="classify.jsp?classify=furniture" target="center1">�Ҿ�</a><br>
    <a class="a1" href="classify.jsp?classify=toy" target="center1">���</a><br>
    <a class="a1" href="classify.jsp?classify=other" target="center1">����</a><br>
  </div>
  </body>
</html>
