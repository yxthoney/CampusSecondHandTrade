<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>right</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">

  </head>
  
  <%String username=(String)session.getAttribute("username");
      session.setAttribute("username",username); 
      if(username==null){ 
      %>
  <body  class="pic"  background="img/login.png">
  <br><br><br>  
           <form target="_top" action="action/loginaction.jsp" name="form1" onsubmit="return on_submit()" method="post">
               <table width=100% align="center">
                  <tr>
                    <td >
                                                           用户名:<input name="name" type="text" id="name" size="15">
                  </tr>
                  <tr>
                     <td>
                                                              密码： <input name="password" type="password" id="password" size="15">
                  </tr>
                   <tr height="10%">
                      <td>
                      </td>
                    </tr>
                    <tr align="center">
                        <td  align="center">
                            <input name="confirm" type="submit" value="确定" >&nbsp;&nbsp;
                            <input name="reset" type="reset" value="重置">
                        </td>                             
                    </tr>
                 </table>
            </form>
      </body>
   <%}
    else{
              String sql="select * from orders where buyer='"+username+"'";
              SqlBean.OpenConn();
              ResultSet rs=SqlBean.executeQuery(sql);
              int asbuyer=0;
              while(rs.next()){
                  asbuyer++;
              }
              sql="select * from orders,goods where orders.gid=goods.gid and goods.gowner='"+username+"'";
              rs=SqlBean.executeQuery(sql);
              int seller=0;
              while(rs.next()){
                  seller++;
              }
     %>
         <body class="border" bgcolor=#e9e9e9>
            <table width=100% align="center">
            <tr height=20><td></td></tr>
                  <tr>
                    <td>
                                                        我是卖家：<a target="center1" href="orderasseller.jsp"><%=seller %></a>笔订单
                     <br><br>
                                                        我是买家：<a target="center1" href="myorder.jsp"><%=asbuyer %></a>笔订单
                     </td>
                  </tr>
                 </table>
         <%
         rs.close();
         SqlBean.closeStmt();
	     SqlBean.closeConn();
         }%> 
  </body>
</html>
