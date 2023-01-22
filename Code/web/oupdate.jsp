

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="com.util.mail_send"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String uemail=request.getParameter("uemail");
String fid=request.getParameter("fid");
String ownerstaus="yes";
ResultSet rs=null;
Connection con=null;
String hashkey=null;
String secretkey=null;


try
{
 con = DbConnection.getConnection();
        String qry="update userreq set ownerstaus='"+ownerstaus+"' where fid='"+fid+"' and uemail='"+uemail+"'";
	Statement st=con.createStatement();

        
	
int i=st.executeUpdate(qry);;
if(i>0){
    String sql="select secretkey,hashkey from filedetails  where  fid='"+fid+"'";
    PreparedStatement ps=con.prepareStatement(sql);
    rs=ps.executeQuery(sql);
    while(rs.next()){
        hashkey=rs.getString("hashkey");
        secretkey=rs.getString("secretkey");
        }
    mail_send.sendMail("the secretkey"+secretkey+"The Hash key is"+hashkey, hashkey, uemail);
response.sendRedirect("index.html?msg=mail send sucessfully");
}else{
    response.sendRedirect("requst notupdated");
}
}catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
%>


