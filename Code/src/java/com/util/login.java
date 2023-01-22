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

public class login extends HttpServlet {

    @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        
        String publickey=null;
                PrintWriter out = response.getWriter();
              Connection con=null; 
              PreparedStatement ps=null;
              ResultSet rs=null;
             HttpSession session=request.getSession();
      
        try {
             con=DbConnection.getConnection();
             ps=con.prepareStatement("select name,password,publickey from ownerreg where name=? and password=? ");
            ps.setString(1,name);
            ps.setString(2, password);
             rs=ps.executeQuery();
        if(rs.next()){
name =rs.getString(1);
String pubkey = rs.getString("publickey");
            System.out.println("Ownr Name "+name+ " Pub Jey "+pubkey);
session.setAttribute("ownername", name);
session.setAttribute("publickey",pubkey);
response.sendRedirect("owner.jsp");

}
else{
response.sendRedirect("index.jsp?msg=Login faild");
}

        
            }catch(Exception e){            
            e.printStackTrace();
        }
    }

   
}
