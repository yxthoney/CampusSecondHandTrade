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
                                     ��ӭ������Ŀǰ��״̬���οͣ���
            <a target="_top" href="login.jsp" >��½</a> ��
            <a target="_top" href="register.jsp" >ע��</a>
            </td>
            <td align="right" width=10%>
            <a target="_top" href="homepage.jsp">��ҳ</a>
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
                                        �𾴵Ļ�Ա
               <a target="_top" href="myzone.jsp"><%=username %></a>
                                        ����ӭ����
               
            </td>
             <td align="right">
             <a class="menu" target="_top" href="myzone.jsp" >���˿ռ�</a>
             <a class="menu" target="_top" href="action/logoutaction.jsp" >�˳���½</a>
            <a target="_top" href="homepage.jsp">��ҳ</a>
            </td>
        </tr>
    </table>
     
     <%} %>
  </body>
</html>
