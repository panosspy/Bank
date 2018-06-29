<!--Διαγραφεί από τη βάση τον πελάτη-->
<%-- 
    Document   : doRemoveCustomer
    Created on : 14 Δεκ 2012, 12:08:07 μμ
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91");
    
    ResultSet rscheckcustomer = null;
    ResultSet rsappcheck=null;
    PreparedStatement psarrcheck=null;
    PreparedStatement pscheckcustomer=null;
    PreparedStatement pscheckid=null;
    
    
    String id=request.getParameter("customervat");
    String message="Customer deleted from our database successfully!";
    
    
    try{
        //το qyery για να βρεθεί ο πελάτης στη βάση
        String sqlOption="SELECT * FROM customer WHERE vat=?";

        pscheckcustomer=conn.prepareStatement(sqlOption);
        pscheckcustomer.setString(1,id);
        rscheckcustomer=pscheckcustomer.executeQuery();
    //Έλενχος για το εάν έχει αίτηση που τρέχει ακόμη για δάνειο 
    if(rscheckcustomer.next())
    {
      String sql2="SELECT * FROM application WHERE customer_id=?";
      psarrcheck=conn.prepareStatement(sql2);
      psarrcheck.setInt(1,rscheckcustomer.getInt("customer_id"));
      rsappcheck=psarrcheck.executeQuery();
      if(rsappcheck.next()){
          //Σε περίπτωση που έχει αίτηση ανακατεύθυνση και εκτύπωση ανάλογου μηνύματος 
          message="You can't been removed from our bank when you have an application running!";
          response.sendRedirect("removeCustomer.jsp?error2="+message);
      }
      //περίπτωση όπου το delete εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
      String sql = "DELETE FROM customer WHERE vat=?";
      pscheckid=conn.prepareStatement(sql);
      pscheckid.setString(1,id);
      pscheckid.executeUpdate();
      
      response.sendRedirect("removeCustomer.jsp?error2="+message);
      
      
      
    }
    
    //περίπτωση όπου το query δεν εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
    else
    {
      message="Customer doesn't exist in our database!" ;
      response.sendRedirect("removeCustomer.jsp?error2="+message);
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{
         if(pscheckcustomer!=null){
             pscheckcustomer.close();
         }
         if(rscheckcustomer!=null){
             rscheckcustomer.close();
         }
         if(rsappcheck!=null){
             rsappcheck.close();
         }
         if(psarrcheck!=null){
             psarrcheck.close();
         }
         if(pscheckid!=null){
             pscheckid.close();
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
