<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String username=null;
      username=(String)session.getAttribute("username");
      session.setAttribute("username",username);
      %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <script> 
    function myzone(){
      if(<%=username%>!=null){
        top.location='myzone.jsp';
        return true;
      }
      else {
        alert("请先登录！");
        top.location='login.jsp';
        return false;
        }
    }
    function on_submit(){
      if(form1.name.value==""){
        alert("用户名不能为空！");
        form1.name.focus();
        return false;
      }
      if(form1.password.value==""){
        alert("密码不能为空！");
        form1.password.focus();
        return false;
      }
      else return true;
    }
  </script>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎来到同济二手交易网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
      
      <iframe class="noborder" name="top" src="top.jsp" width=100% height="60"></iframe>
      <table width=1200 align="center">
      <tr >
      
        <td colspan="3" bgcolor=#a7dedf>        
        <img  width=90% src="img/head.png"/>
        </td>
      </tr>
      <tr height="10" valign="top" >
         <td bgcolor=#e9e9e9 colspan="3" width="15%">
             <a href="homepage.jsp" target="_top">
				<img width="150" src="img/sy.png">
			</a>
			 <a href="myzone.jsp" target="_top">
			<img onclick="return myzone();" width="150" src="img/grkj.png">		
			</a>    
          </td>
      </tr>
      <tr height="700">
        <td width=10% valign="top">
          <iframe class="border" name="left" src="left.jsp" width="150" height="300"></iframe>
        </td>
        <td width=70% height=100%>
          <table width=100% align="center" height="700" >
             <tr>                        
                <td height=100% width=100% valign="top" align="center">
                <iframe name="center1" class="border" src="buy.jsp" height="600" width=100%></iframe>
                </td>
             </tr>
           </table>
         </td>
         <td width=20% valign="top">
           <iframe class="noborder" name="right" src="right.jsp" width="230" height="200"></iframe>
           
         </td>
      </tr>
      </table>
    
  </body>
</html>
            