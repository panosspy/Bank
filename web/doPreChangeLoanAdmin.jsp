<!--Έλενχος ύπαρξεις του loan admin στη βάση με βάση το id του-->
<%-- 
    Document   : doPreChangeLoanAdmin
    Created on : 14 Δεκ 2012, 1:23:43 μμ
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
    
    ResultSet rscheck = null;
    PreparedStatement pscheck = null;
    
    String id=request.getParameter("loanadminid");
    String message="Loan Admin exist in our database";
    
    
    try{
    //Έλενχος στη βάση εαν υπάρχει ο loan admin στη βάση   
    String sqlOption="SELECT * FROM loan_admin WHERE admin_id = ?";
                
    pscheck=conn.prepareStatement(sqlOption);
    pscheck.setString(1,id);
    rscheck=pscheck.executeQuery();
    
        
    
    if(rscheck.next())
    {
      session.setAttribute("admin_id",id);
      
      response.sendRedirect("loanAdminChange.jsp");
    }
    else
    {
      //Σε περίπτωση που δεν υπάρχει στη βάση ο loan admin ανακατεύθυνση και εκτύπωση ανάλογου μηνύματος
      message="Wrong id!" ;
      response.sendRedirect("preChangeLoanAdmin.jsp?error2="+message);
    }
    
    
    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{
         if(pscheck!=null){
             pscheck.close();
         }
         if(rscheck!=null){
             rscheck.close();
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