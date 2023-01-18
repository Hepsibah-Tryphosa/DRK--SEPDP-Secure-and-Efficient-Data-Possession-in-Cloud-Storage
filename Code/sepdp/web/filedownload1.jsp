<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.login"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="com.util.userlogin"%>
<%@page import="java.util.*"%>
<%@page import="com.util.DownloadHistory"%>

<%
    try {
    String secretkey = request.getParameter("secretkey");
System.out.println(secretkey);

  String fname=null;
    String fid = request.getParameter("fid");
   // String fileName = request.getParameter("fileName");
    String hashkey = request.getParameter("hashkey");
    System.out.println(hashkey);
    //DownloadHistory dwn = new DownloadHistory();
    System.out.println(fid);
    Connection con = DbConnection.getConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement st=con.createStatement();
          Statement st1=con.createStatement();
     InputStream is=null;
               ResultSet rt=st.executeQuery("select fname,file from filedetails where secretkey='"+secretkey+"' and hashkey='"+hashkey+"' and fid='"+fid+"' ");
if(rt.next()){
         is=rt.getAsciiStream("file");
         fname=rt.getString("fname");
         
          BufferedReader br=new BufferedReader(new InputStreamReader(is));
         String temp=null;
         StringBuffer sb=new StringBuffer();
         while((temp=br.readLine())!=null){
            sb.append(temp);
         }
          br.close();
          
          response.setHeader("Content-Disposition","attachment;filename=\""+fname+"\"");        
         out.write(sb.toString());
         
       String uemail=session.getAttribute("uemail").toString();
           
             DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	   //get current date time with Date()
	     Date date = new Date();
	     System.out.println(dateFormat.format(date));
             String time=dateFormat.format(date); 
         
        // st1.executeUpdate("insert into downloads (filename,name,time)values('"+fname+"','"+name+"','"+time+"')");
         
          }
    }catch(Exception e){
    e.printStackTrace();
    }
%>