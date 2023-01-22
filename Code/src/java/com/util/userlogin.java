/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DataBaseCon.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class userlogin extends HttpServlet {

    @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String uname=request.getParameter("uname");
        String upassword=request.getParameter("upassword");
        String uemail=null;
              PrintWriter out = response.getWriter();
              Connection con=null; 
              PreparedStatement ps=null;
              ResultSet rs=null;
             HttpSession session=request.getSession();
      System.out.println(uname+","+upassword);
        try {
             con=DbConnection.getConnection();
             ps=con.prepareStatement("select uname,uemail,upassword from userdetails where uname=? and upassword=? ");
            ps.setString(1,uname);
            ps.setString(2, upassword);
             rs=ps.executeQuery();
        if(rs.next()){
uname =rs.getString(1);
uemail=rs.getString("uemail");
session.setAttribute("username", uname);
session.setAttribute("uemail", uemail);
response.sendRedirect("userhome.jsp");

}
else{
response.sendRedirect("index.jsp?msg=Login faild");
}

        
            }catch(Exception e){            
            e.printStackTrace();
        }
    }

   
}
