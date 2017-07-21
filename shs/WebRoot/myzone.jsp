<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎来到二手交易网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
      <%String username=(String)session.getAttribute("username");
      session.setAttribute("username",username);  
      %>
      
    <iframe class="noborder" name="top" src="top.jsp" width=100% height="60"></iframe>
      <table width=1200 align="center">
      <tr>
        <td bgcolor=#a7dedf><img  width=90% src="img/head.png"/>
      </tr>    
      <tr height="10">
        <td bgcolor=#e9e9e9> 
            <a href="homepage.jsp" target="_top">
				<img width="150" src="img/sy.png">
			</a>
			<a href="buy.jsp" target="right">
				<img width="150" src="img/tbb.png">
			</a>
			<a href="mytrade.jsp" target="right">
				<img width="150" src="img/wdjy.png">
			</a>
			<a href="myorder.jsp" target="right">
				<img width="150" src="img/gwc.png">
			</a>
			<a href="editinfo.jsp" target="right">
				<img width="150" src="img/grxx.png">
			</a>					    
          </td>
       </tr>
       <tr height="700" valign="top">                        
          <td width="100%">
            <iframe name="right" class="border" src="buy.jsp" height="600" width="100%"></iframe>
          </td>
       </tr>
      </table>
  </body>
</html>
