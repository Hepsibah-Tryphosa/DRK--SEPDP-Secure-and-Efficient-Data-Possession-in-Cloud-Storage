/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DataBaseCon.DbConnection;
public class DownloadHistory {
    public void storeHistory(String downloadedUser,String file_ID,String fileName,String oname,Date sqlDate){
        Connection con = null;
        PreparedStatement ps = null;
         try {
            con = DbConnection.getConnection();
            String query = "insert into downloads(downloadedUser, file_ID, fileName, oname, sqlDate) values(?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, downloadedUser);
            ps.setString(2, file_ID);
            ps.setString(3, fileName);
            ps.setString(4, oname);
            ps.setDate(5, sqlDate);
            int no = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error at Download "+e.getLocalizedMessage());
        }
        finally{
            try {
                ps.close();
                con.close();
            } catch (Exception e) {
            }
        }
    
    }
    
}
