package sql;
import java.sql.*;
public class SQLServerConnBean {
    private Statement stmt=null;
    private Connection conn=null;
    ResultSet rs=null;
    public SQLServerConnBean(){}
    public void OpenConn()throws Exception
    {
        try{
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        	String url="jdbc:sqlserver://localhost:1433;databaseName=secondhand";
        	String user="sa";
        	String password="3721888";
        	conn=DriverManager.getConnection(url, user, password);
        }
        catch(SQLException e){
        	System.err.println("Data.OpenConn:"+e.getMessage());
        }
    }
    
    public ResultSet executeQuery(String sql){
    	rs=null;
    	try{
    		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    		rs=stmt.executeQuery(sql);
    	}
    	catch(SQLException e){
    		System.err.println("Data.excuteQuery:"+e.getMessage());
    	}
    	return rs;
    }
    
    public int executeUpdate(String sql){
    	stmt=null;
    	int ex;
    	try{
    		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    		ex=stmt.executeUpdate(sql);
    		return ex;
    	}
    	catch(SQLException e){
    		System.err.println("Data.excuteUpdate:"+e.getMessage());
    	}
    	return 0;
    }
    
    public void closeStmt(){
    	try{
    		stmt.close();
    	}
    	catch(SQLException e){
    		System.err.println("Data.closeStmt:"+e.getMessage());
    	}
    }
    public void closeConn(){
    	try{
    		conn.close();
    	}
    	catch(SQLException e){
    		System.err.println("Data.closeConn:"+e.getMessage());
    	}
    }
   
}
