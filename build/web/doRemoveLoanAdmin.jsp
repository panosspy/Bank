<!--Διαγραφεί του loan admin από τη βάση-->
<%-- 
    Document   : doRemoveLoanAdmin
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
    
    
    String id=request.getParameter("loanadminid");
    String message="Loan Admin deleted from our database successfully!";
    
    
    try{
        //το qyery για να βρεθεί ο πελάτης στη βάση
        String sqlOption="SELECT * FROM loan_admin WHERE admin_id=?";

        pscheckcustomer=conn.prepareStatement(sqlOption);
        pscheckcustomer.setString(1,id);
        rscheckcustomer=pscheckcustomer.executeQuery();
    //Έλενχος για το εάν έχει αίτηση που τρέχει ακόμη για δάνειο 
    if(rscheckcustomer.next())
    {
      String sql2="SELECT * FROM application WHERE app_admin_id=?";
      psarrcheck=conn.prepareStatement(sql2);
      psarrcheck.setString(1,rscheckcustomer.getString("admin_id"));
      rsappcheck=psarrcheck.executeQuery();
      if(rsappcheck.next()){
          //Σε περίπτωση που έχει αίτηση ανακατεύθυνση και εκτύπωση ανάλογου μηνύματος 
          message="You can't remove this loan administrator from our bank when he has a loan application (with customer) running!";
          response.sendRedirect("removeLoanAdmin.jsp?error2="+message);
      }
      else{
      //περίπτωση όπου το delete εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
        String sql = "DELETE FROM loan_admin WHERE admin_id=?";
        pscheckid=conn.prepareStatement(sql);
        pscheckid.setString(1,id);
        pscheckid.executeUpdate();
      
        response.sendRedirect("removeLoanAdmin.jsp?error2="+message);
      }
      
      
    }
    
    //περίπτωση όπου το query δεν εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
    else
    {
      message="Loan Admin doesnt exist in our database!" ;
      response.sendRedirect("removeLoanAdmin.jsp?error2="+message);
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
