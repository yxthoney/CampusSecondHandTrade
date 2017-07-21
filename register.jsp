<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <script> 
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
      if(form1.password2.value==""){
        alert("确认密码不能为空！");
        form1.password2.focus();
        return false;
      }
      if(form1.password.value!=form1.password2.value){
        alert("确认密码正确！");
        form1.password2.focus();
        return false;
      }
      else return true;
    }
    function home(){
      top.location='homepage.jsp';
      return true;
    }
    
  </script>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
      <table width=“100” cellspacing="1" align="center" height="100%">
        <tr bgcolor=#a7dedf>
            <td height="25%" class=headword> 
                <img src="img/head.png">
            </td>
        </tr>
        <tr>
            <td class="pic" background="img/shopping.png" height="50%">
                <table width="100%" >
                    <tr>
                        <td width="40%" >                                                                  
                        </td>
                        <td width="60%">
                            <form name="form1" action="action/registeraction.jsp" onsubmit="return on_submit()" method="post">
                            <table align="center">
                                <tr>
                                    <td>
                                                                                                用户名：                                                                                                                                        
                                    </td>
                                    <td>
                                    <input name="name" type="text" size="19">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                                                                                密码：                                                                                                                                        
                                    </td>
                                    <td>
                                    <input name="password" type="password" size="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                                                                                重复密码：                                                                                                                                        
                                    </td>
                                    <td>
                                    <input name="password2" type="password" size="20">
                                    </td>
                                </tr>                                
                                <tr align="center">
                                    <td colspan="2" align="center">
                                    <br>
                                    <input name="confirm" type="submit" value="确定" >
                                    &nbsp;&nbsp;                                    
                                    <input name="reset" type="reset" value="重置">
                                    &nbsp;&nbsp;
                                    <input onclick=history.go(-1) type=button value="返回">
                                    </td>                     
                                </tr>
                            </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor=#a7dedf align="center" height="25%"> 
            ©102333 二手交易网      
            </td>
        </tr>
    </table>
  </body>
</html>



