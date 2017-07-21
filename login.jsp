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
      else return true;
    }
    function home(){
      top.location='homepage.jsp';
      return true;
    }
  </script>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
      <table width=60% cellspacing="1" align="center" height="100%" >
        <tr bgcolor=#a7dedf>
            <td height="25%" class=headword> 
                <img src="img/head.png">   
            </td>
        </tr>
        <tr>
            <td  height="50%" class="pic" background="img/shopping.png" >
                <table width="100%" >
                    <tr>
                        <td width="40%" >                                                                  
                        </td>
                        <td width="60%">
                            <form action="action/loginaction.jsp" name="form1" onsubmit="return on_submit()" method="post">
                            <table align="center">
                                <tr>
                                    <td>用户名：                                                                                                                                       
                                    </td>
                                    <td>
                                    <input name="name" type="text" id="name" size="19">
                                    </td>
                                </tr>
                                <tr>
                                    <td>密码：                                                                                                                                        
                                    </td>
                                    <td>
                                    <input name="password" type="password" id="password" size="20">
                                    </td>
                                </tr>
                                <tr height="10%">
                                    <td>
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
        <tr bgcolor=#a7dedf>
            <td align="center" height="25%"> 
            ©102333 二手交易网      
            </td>
        </tr>
    </table>
  </body>
</html>
