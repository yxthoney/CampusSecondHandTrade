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
        alert("��������Ʒ���ƣ�");
        form1.gname.focus();
        return false;
      }
      if(form1.gprice.value==""){
        alert("��������Ʒ�۸�");
        form1.gprice.focus();
        return false;
      }
      if(form1.gpicture.value==""){
        alert("��ѡ��ͼƬ��");
        form1.gpicture.focus();
        return false;
      }
      if(form1.gdescription.value==""){
        alert("��Ʒ��������Ϊ�գ�");
        form1.gdescription.focus();
        return false;
      }
      else return true;
    }
  </script>
  <head>
    <base href="<%=basePath%>">
    
    <title>������Ʒ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  <input type="button" onclick="location='mytrade.jsp'" value="�鿴������Ʒ">
  <input class="border" type="button" onclick="location='newsale.jsp'" value="��������Ʒ">
  <input type="button" onclick="location='editsale.jsp'" value="�޸���Ʒ��Ϣ">
  <input type="button" onclick="location='deletesale.jsp'" value="ɾ��������Ʒ">
  <input type="button" onclick="location='orderasseller.jsp'" value="�鿴����">
      <% String username=(String)session.getAttribute("username");
         session.setAttribute("username",username); 
       %>
       
      <form action="action/saleaction.jsp" name="form1" onsubmit="return on_submit()" method="post" enctype="multipart/form-data">
      <table border="0" width="100%" height="100%" cellpadding="0"> 
          <tr>   
              <td>��Ʒ���ƣ�</td>
              <td><input type="text" name="gname"></td>
          </tr>
          <tr>   
              <td>��Ʒ���ࣺ</td>
              <td>
                <input type="radio" name="gclassify" value="food">ʳƷ &nbsp;
                <input type="radio" name="gclassify" value="clothing">��װ&nbsp;
                <input type="radio" name="gclassify" value="dailyuse">����&nbsp;
                <input type="radio" name="gclassify" value="study">ѧϰ &nbsp;
                <input type="radio" name="gclassify" value="sports">�˶�&nbsp;
                <br>
                <input type="radio" name="gclassify" value="digital">����&nbsp;
                <input type="radio" name="gclassify" value="furniture">�Ҿ� &nbsp;
                <input type="radio" name="gclassify" value="toy">���&nbsp;
                <input type="radio" name="gclassify" value="other">����&nbsp;
              </td>
          </tr>
          <tr>   
              <td>��Ʒ�۸�</td>
              <td><input type="text" name="gprice"></td>
          </tr>
          <tr>   
              <td>��ƷͼƬ:</td>
              <td><input type="file" name="gpicture"></td>
          </tr>
          <tr>   
              <td>��Ʒ������</td>
              <td><input type="text" style="height:51px;width:449px" name="gdescription"></td>
          </tr>
          <tr>
              <td></td>              
              <td><input type="submit" value="�ύ"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="reset" value="����">
              </td>
          </tr>   
      </table>
      </form>
  </body>
</html>
