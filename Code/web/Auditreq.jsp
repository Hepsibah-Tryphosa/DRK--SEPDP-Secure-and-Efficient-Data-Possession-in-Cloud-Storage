<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String ownername=request.getParameter("ownername");
String fid=request.getParameter("fid");
String hkeystatus="yes";
ResultSet rs=null;
try
{
Connection con = DbConnection.getConnection();
        String qry="update filedetails set hkeystatus='"+hkeystatus+"' where fid='"+fid+"' and ownername='"+ownername+"'";
	Statement st=con.createStatement();

        
	
int i=st.executeUpdate(qry);;
if(i>0){
response.sendRedirect("dataview.jsp");
}else{
    response.sendRedirect("requst notupdated");
}
}catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
%>

