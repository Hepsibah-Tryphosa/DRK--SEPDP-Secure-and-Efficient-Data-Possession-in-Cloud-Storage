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
public class signup extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("ownername");  
        String password=request.getParameter("opassword"); 
        String email=request.getParameter("oemail");  
        String repassword=request.getParameter("orepassword");  
        String address=request.getParameter("oaddress");
        String mobile=request.getParameter("omobile");
        System.out.println(name);
        String skey = null;
    Random RANDOM = new SecureRandom();
    int mac1_LENGTH = 7;
    String letters = "0123456789";
    String uid = "";
    for (int i = 0; i < mac1_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        uid += letters.substring(index, index + 1);
    }
  skey=uid;
  String publickey=skey;
  System.out.println(publickey);
        PrintWriter out = response.getWriter();
        Connection con=null;
        try{
            con=DbConnection.getConnection();
             String sql = "insert into  ownerreg (name,password,repassword,mobile,email,address,publickey) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            
               ps.setString(3, repassword);
		ps.setString(4, mobile);	   
              ps.setString(5, email);
            ps.setString(6, address);
           ps.setString(7, publickey);
            int row = ps.executeUpdate();
            if (row > 0) {
             response.sendRedirect("index.html");
              }else{
            request.setAttribute("failed", "Registration failed");
                 RequestDispatcher rd = request.getRequestDispatcher("/owner signup.html");
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
