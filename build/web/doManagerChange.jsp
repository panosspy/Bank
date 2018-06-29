<!--Σελίδα διαδικαστικού χαρακτήρα γίνεται αλλαγή στοιχείων του loan admin από την βάση-->
<%-- 
    Document   : doManagerChange
    Created on : 14 Δεκ 2012, 12:49:50 μμ
    Author     : boumpoukiotis
--%>

<%@page import="sun.awt.image.IntegerInterleavedRaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91");
   
    PreparedStatement pschange=null;
    
    String column=request.getParameter("element");
    String item=request.getParameter("itemchanged");
    String message="Change saved successfully";
    
    try{
        //εκτέλεση update στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
        String sql ="UPDATE manager SET "+column+"=? ";
        pschange=conn.prepareStatement(sql);
        pschange.setString(1,item);
        int check=0;
        check=pschange.executeUpdate();
        //Έλενχος για το εαν έγινε σωστά το update στη βάση και ανακατεύθυνση με ανάλογα μηνύματα
        if(check!=0){
            response.sendRedirect("managerChange.jsp?error3="+message);
        }
        else{
            message="Wrong attribute for target element! Try again!";
            response.sendRedirect("managerChange.jsp?error3="+message);
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{
         if(pschange!=null){
             pschange.close();
         }
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
