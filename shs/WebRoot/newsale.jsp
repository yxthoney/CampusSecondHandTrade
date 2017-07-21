<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <script>
    function on_submit(){
      if(form1.gname.value==""){
        alert("请输入商品名称！");
        form1.gname.focus();
        return false;
      }
      if(form1.gprice.value==""){
        alert("请输入商品价格！");
        form1.gprice.focus();
        return false;
      }
      if(form1.gpicture.value==""){
        alert("请选择图片！");
        form1.gpicture.focus();
        return false;
      }
      if(form1.gdescription.value==""){
        alert("商品描述不能为空！");
        form1.gdescription.focus();
        return false;
      }
      else return true;
    }
  </script>
  <head>
    <base href="<%=basePath%>">
    
    <title>出售物品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <input type="button" onclick="location='mytrade.jsp'" value="查看出售物品">
  <input class="border" type="button" onclick="location='newsale.jsp'" value="出售新商品">
  <input type="button" onclick="location='editsale.jsp'" value="修改商品信息">
  <input type="button" onclick="location='deletesale.jsp'" value="删除出售物品">
  <input type="button" onclick="location='orderasseller.jsp'" value="查看订单">
      <% String username=(String)session.getAttribute("username");
         session.setAttribute("username",username); 
       %>
       
      <form action="action/saleaction.jsp" name="form1" onsubmit="return on_submit()" method="post" enctype="multipart/form-data">
      <table border="0" width="100%" height="100%" cellpadding="0"> 
          <tr>   
              <td>商品名称：</td>
              <td><input type="text" name="gname"></td>
          </tr>
          <tr>   
              <td>商品分类：</td>
              <td>
                <input type="radio" name="gclassify" value="food">食品 &nbsp;
                <input type="radio" name="gclassify" value="clothing">服装&nbsp;
                <input type="radio" name="gclassify" value="dailyuse">日用&nbsp;
                <input type="radio" name="gclassify" value="study">学习 &nbsp;
                <input type="radio" name="gclassify" value="sports">运动&nbsp;
                <br>
                <input type="radio" name="gclassify" value="digital">数码&nbsp;
                <input type="radio" name="gclassify" value="furniture">家具 &nbsp;
                <input type="radio" name="gclassify" value="toy">玩具&nbsp;
                <input type="radio" name="gclassify" value="other">其它&nbsp;
              </td>
          </tr>
          <tr>   
              <td>商品价格：</td>
              <td><input type="text" name="gprice"></td>
          </tr>
          <tr>   
              <td>商品图片:</td>
              <td><input type="file" name="gpicture"></td>
          </tr>
          <tr>   
              <td>商品描述：</td>
              <td><input type="text" style="height:51px;width:449px" name="gdescription"></td>
          </tr>
          <tr>
              <td></td>              
              <td><input type="submit" value="提交"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="reset" value="重置">
              </td>
          </tr>   
      </table>
      </form>
  </body>
</html>
