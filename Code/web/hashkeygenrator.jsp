<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String ownername=request.getParameter("ownername");
String fid=request.getParameter("fid");
String hkeystatus="yes";
  String hashkey = null;
    Random RANDOM = new SecureRandom();
    int mac1_LENGTH = 7;
    String letters = "0123456789";
    String uid = "";
    for (int i = 0; i < mac1_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        uid += letters.substring(index, index + 1);
    }
  hashkey=uid;
ResultSet rs=null;
try
{
Connection con = DbConnection.getConnection();
        String qry="update filedetails set hashkey='"+hashkey+"' where fid='"+fid+"' and ownername='"+ownername+"'";
	Statement st=con.createStatement();

        
	
int i=st.executeUpdate(qry);;
if(i>0){
response.sendRedirect("dataownerreq.jsp");
}else{
    response.sendRedirect("requst notupdated");
}
}catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
%>

