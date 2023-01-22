
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import DataBaseCon.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Datapoint
 */
public class usersignup extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String uname=request.getParameter("uname");  
        String upassword=request.getParameter("upassword"); 
        String uemail=request.getParameter("uemail");  
        String urepassword=request.getParameter("urepassword");  
        String uaddress=request.getParameter("uaddress");
        String umobile=request.getParameter("umobile");
        System.out.println(uname);
        
        PrintWriter out = response.getWriter();
        Connection con=null;
        try{
            con=DbConnection.getConnection();
             String sql = "INSERT INTO userdetails (uname,uemail,umobile,upassword,urepassword,uaddress) values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, uemail);
            
               ps.setString(3, umobile);
		ps.setString(4, upassword);	   
              ps.setString(5, urepassword);
            ps.setString(6, uaddress);
         
            int row = ps.executeUpdate();
            if (row > 0) {
             response.sendRedirect("user.jsp");
              }else{
            request.setAttribute("failed", "Registration failed");
                 RequestDispatcher rd = request.getRequestDispatcher("/usersignup.jsp");
                          rd.forward(request, response); 
            }
                          
                          
           
        }catch(Exception e){ 
        e.printStackTrace();
        }
    }

    
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
