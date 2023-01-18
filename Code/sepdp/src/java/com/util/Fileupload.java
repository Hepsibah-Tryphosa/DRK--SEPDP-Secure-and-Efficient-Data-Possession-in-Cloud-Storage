package com.util;
import java.util.*;
import FileReador.ContentExtractor;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import EncryptionDecryption.Algorithem;
import DataBaseCon.DbConnection;
import FileReador.ContentExtractor;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215)
public class Fileupload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        

String ownername    = request.getParameter("ownername");
String abfile = request.getParameter("abfile");
String secretkey      = request.getParameter("sckey");
String publickey      = request.getParameter("pbkey");
String hashkey="no";
String hkeystatus="no";

InputStream inputStream = null;
        Part filePart = request.getPart("file");
       String fname= "";
         long filesize=filePart.getSize();
String filetype=filePart.getContentType();
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());  
            fname=filePart.getSubmittedFileName();
            // obtains input stream of the upload file
inputStream=filePart.getInputStream();           
String str = ContentExtractor.getStringFromInputStream(filePart.getInputStream());
  

         
                
Connection con = null;
PreparedStatement ps = null;
String query="insert into filedetails(fname,ownername,file,encstr,secretkey,abfile,publickey,hkeystatus,hashkey) values(?,?,?,?,?,?,?,?,?)";
try{
  String encstr=new Algorithem().encrypt(str);
con = DbConnection.getConnection();
ps  = con.prepareStatement(query);

ps.setString(1, fname);
ps.setString(2, ownername);
ps.setBinaryStream(3, inputStream);
ps.setString(4,encstr);
ps.setString(5,secretkey);
ps.setString(6, abfile);
ps.setString(7, publickey);
ps.setString(8, hkeystatus);
ps.setString(9, hashkey);

int no = ps.executeUpdate();

if(no>0){
response.sendRedirect("owner.jsp?msg=Success");
}
else{
response.sendRedirect("Upload.jsp?msg=Faild");
}
}catch(Exception e){
    System.out.println("Error:"+e.getMessage());
}
finally{
try{
ps.close();
con.close();
}catch(Exception e1){
System.out.println("Error while closing");
}
}
    }
    
}
