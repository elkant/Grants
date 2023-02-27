/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package login;

import database.dbConnweb;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Geofrey Nyabuto
 */
public class login extends HttpServlet {
HttpSession session;
String username,password,fname,mname,lname,userid,level,pass,fullname,status,nextPage,email;
MessageDigest m;
String userAccess;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
      session=request.getSession();
          dbConnweb conn = new dbConnweb();
         //conn.st.executeUpdate("Set GLOBAL  max_connections=6000");
          
          username=password=fname=mname=lname=userid=level=pass=fullname=status=nextPage="";
          userAccess=",";
          username=request.getParameter("username").trim();
          pass=request.getParameter("password").trim();
         
          HashMap<String, String> kd= new HashMap<>();
          
          
          System.out.println("username : "+username+" password : "+pass);
          m = MessageDigest.getInstance("MD5");
       m.update(pass.getBytes(), 0, pass.length());
       password = new BigInteger(1, m.digest()).toString(16);
        System.out.println("username : "+username+" password : "+password);  
        String logger="SELECT userid,fname,mname,lname,level,"
       + "access_reports,access_maintenance,email " 
                + " FROM users WHERE username=? && password=?" ;
        conn.pst=conn.conne.prepareStatement(logger);
        conn.pst.setString(1, username);
        conn.pst.setString(2, password);
         conn.rs=conn.pst.executeQuery();
         if(conn.rs.next()==true)
         {
             userid=conn.rs.getString(1);
             fname=conn.rs.getString(2);
             mname=conn.rs.getString(3);
             lname=conn.rs.getString(4);
             level=conn.rs.getString(5);
             email=conn.rs.getString("email");
             fullname=fname+" "+mname+" "+lname;
             
             
             kd.put("userid", userid);
             kd.put("fullname", fullname);
             kd.put("level", level);
             kd.put("username", username);
             kd.put("fname", fname);
             kd.put("mname", mname);
             kd.put("lname", lname);
             kd.put("email", email);
             
          
             
             if(conn.rs.getInt("access_reports")==1){userAccess+="reports,";}
             if(conn.rs.getInt("access_maintenance")==1){userAccess+="maintenance,";}
             
             
             
        
         
             
           session.setAttribute("kd_session", kd);  
           status="success"; 
           nextPage="home.jsp";
          
           System.out.println("access rights : "+session.getAttribute("userAccess"));
         }
         else
         {
             status="<font color=\"red\"><b>Failed:</b> Wrong username and password combination.</font>";
             nextPage="index.jsp";
             session.setAttribute("login", status);
         }
         System.out.println("STATUS IS :  "+status);
         if(conn.conne!=null){
 conn.conne.close();
         }
         
         if(conn.rs!=null){
         conn.rs.close();
         }
         
         if(conn.pst!=null){
         conn.pst.close();
         }
        
         response.sendRedirect(nextPage);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (NoSuchAlgorithmException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (NoSuchAlgorithmException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
