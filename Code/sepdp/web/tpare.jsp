

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String uemail=request.getParameter("uemail");
String fid=request.getParameter("fid");
String tpaStatus="no";
String ownerstaus="no";

String filename= null,aboutfile= null,hashkey= null,publickey= null,secretkey= null,ownername = null;


ResultSet rs=null;
try
{
Connection con = DbConnection.getConnection();
        String qry="select  ownername,secretkey,fname,hashkey,publickey from filedetails where fid='"+fid+"'";
	PreparedStatement ps=con.prepareStatement(qry);

        rs =ps.executeQuery(qry);
	while(rs.next())
	{
	
	filename=rs.getString("fname");
	
	hashkey=rs.getString("hashkey");
        publickey=rs.getString("publickey");
        ownername=rs.getString("ownername");
        secretkey=rs.getString("secretkey");
         }
String qry1="insert into userreq(fid,filename,hashkey,uemail,publickey,secretkey,ownername,tpaStatus,ownerstaus) values('"+fid+"','"+filename+"','"+hashkey+"','"+uemail+"','"+publickey+"','"+secretkey+"','"+ownername+"','"+tpaStatus+"','"+ownerstaus+"')";
PreparedStatement ps1=con.prepareStatement(qry1);
int i=ps.executeUpdate(qry1);
if(i>0){
response.sendRedirect("Fileview.jsp");
}else{
    response.sendRedirect("requst notupdated");
}
}catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
%>
