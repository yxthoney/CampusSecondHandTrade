<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%String username=(String)session.getAttribute("username");
      session.setAttribute("username",username); 
      if(username==null){ 
      %>
    <table bgcolor="e9e9e9" width=100% >
        <tr>
            <td>
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     欢迎您！您目前的状态是游客，请
            <a target="_top" href="login.jsp" >登陆</a> 或
            <a target="_top" href="register.jsp" >注册</a>
            </td>
            <td align="right" width=10%>
            <a target="_top" href="homepage.jsp">首页</a>
            </td>
        </tr>
    </table>
    <%}
    else{
     %>
     <table bgcolor="e9e9e9" width=100% >
        <tr>
            <td>
               <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        尊敬的会员
               <a target="_top" href="myzone.jsp"><%=username %></a>
                                        ，欢迎您！
               
            </td>
             <td align="right">
             <a class="menu" target="_top" href="myzone.jsp" >个人空间</a>
             <a class="menu" target="_top" href="action/logoutaction.jsp" >退出登陆</a>
            <a target="_top" href="homepage.jsp">首页</a>
            </td>
        </tr>
    </table>
     
     <%} %>
  </body>
</html>
