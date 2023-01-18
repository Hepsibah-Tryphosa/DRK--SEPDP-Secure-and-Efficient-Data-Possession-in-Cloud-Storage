

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String uemail=request.getParameter("uemail");
String fid=request.getParameter("fid");
String tpaStatus="yes";
ResultSet rs=null;
try
{
Connection con = DbConnection.getConnection();
        String qry="update userreq set tpaStatus='"+tpaStatus+"' where fid='"+fid+"' and uemail='"+uemail+"'";
	Statement st=con.createStatement();

        
	
int i=st.executeUpdate(qry);;
if(i>0){
response.sendRedirect("tpaTOuser.jsp");
}else{
    response.sendRedirect("requst notupdated");
}
}catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
%>

