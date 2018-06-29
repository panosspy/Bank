<!--Έλενχος ύπαρξεις του πελάτη στη βάση με βάση το ΑΦΜ του και κράτημα στοιχείων σε session-->
<%-- 
    Document   : doPreChangeCustomer
    Created on : 14 Δεκ 2012, 12:28:35 μμ
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
    PreparedStatement pscheckcustomer=null;
    
    String vat=request.getParameter("customervat");
    String message="Customer exists in our database";
    
    
    try{
    //Έλενχος στη βάση εαν υπάρχει ο πελάτης στη βάση   
    String sqlOption="SELECT * FROM customer WHERE vat=?";
                
    pscheckcustomer=conn.prepareStatement(sqlOption);
    pscheckcustomer.setString(1,vat);
    
    rscheckcustomer=pscheckcustomer.executeQuery();
        
    
    if(rscheckcustomer.next())
    {
      //Κρατάμε σε session τα στοιχεία του και και κάνουμε ανακατεύθυνση 
      session.setAttribute("name",rscheckcustomer.getString("name"));
      session.setAttribute("vat",rscheckcustomer.getString("vat"));
      session.setAttribute("identitycard",rscheckcustomer.getString("identity_card"));
      session.setAttribute("phone",rscheckcustomer.getString("phone"));
      
      
      response.sendRedirect("changeCustomer.jsp");
    }
    
    
    
    else
    {
      //Σε περίπτωση που δεν υπάρχει στη βάση ο πελάτης ανακατεύθυνση και εκτύπωση ανάλογου μηνύματος
      message="Customer doesn't exist in our database!" ;
      response.sendRedirect("preChangeCustomer.jsp?error2="+message);
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
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>
