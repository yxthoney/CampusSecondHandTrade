<%@ page contentType="text/html;charset=gb2312"%> 
<%@ page import="java.sql.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="SqlBean" scope="page"  class="sql.SQLServerConnBean"/>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";    
			
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss");
    Date myDate = new Date();
    String tempname=formatter.format(myDate);
    
	SmartUpload su=new SmartUpload();
    su.initialize(pageContext);
    su.setMaxFileSize(1000000);
    su.setTotalMaxFileSize(2000000); 
    su.upload();
 //   su.save("D://myeclipse//workspace//shs//WebRoot//upload");
	String gname =su.getRequest().getParameter("gname");
	String gprice = su.getRequest().getParameter("gprice");
	String gdescription = su.getRequest().getParameter("gdescription");
	String gclassify = su.getRequest().getParameter("gclassify"); 
	String gpicture=null;
	com.jspsmart.upload.File file= su.getFiles().getFile(0);
	file.saveAs("D:\\myeclipse\\workspace\\shs\\WebRoot\\upload\\"+tempname+"."+file.getFileExt(),SmartUpload.SAVE_PHYSICAL);
	if (file.isMissing()){%>
        <script language=javascript>
        alert("请先选择要上传的文件！");
        window.location='newsale.jsp';
       </script>
	<%}
	else{
    gpicture=tempname+"."+file.getFileExt();
	}
	String username=(String)session.getAttribute("username");
	session.setAttribute("username",username); 
	boolean exist=false;
	String sql = "select * from users where name='" + username+ "'";
	SqlBean.OpenConn();
    ResultSet rs=SqlBean.executeQuery(sql);
		while (rs.next()) {
		    exist = true;		    
		}
		if (exist&&gpicture!=null) {	    
		    sql =String.format("insert into goods(gname,gprice,gpicture,gdescription,gowner,soldout,gclass) values('%s','%s','%s','%s','%s',0,'%s')",gname,gprice,gpicture,gdescription,username,gclassify);
            SqlBean.executeUpdate(sql);
            response.sendRedirect("../mytrade.jsp");
	    }
	    else{
	        session.setAttribute("errorInfo","请登录!");
			response.sendRedirect("../error.jsp");
	    }
	    rs.close();
	    SqlBean.closeStmt();
	    SqlBean.closeConn();
%>

