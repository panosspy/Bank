<!--Σελίδα διαδικαστικού χαρακτήρα όπου εισάγονται στη ΒΔ τα στοιχεία της φόρμας-->
<%-- 
    Document   : doCustomerCheck
    Created on : Dec 12, 2012, 11:28:12 AM
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
    ResultSet rsappnum = null;
    ResultSet rscustid = null;
    ResultSet rsmatch = null;
    PreparedStatement pscheckcustomer=null;
    PreparedStatement pscheckid=null;
    
    String id=request.getParameter("customervat");
    String message="Customer exists in our database";
    
    
    try{
        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
        String sqlOption="SELECT * FROM customer WHERE vat=?";
        //εκτέλεση query στη ΒΔ για την αποφυγή δημιουργίας διπλότυπων
        String sqlOption2="SELECT application_id FROM application";

        pscheckcustomer=conn.prepareStatement(sqlOption);
        pscheckcustomer.setString(1,id);

        rscheckcustomer=pscheckcustomer.executeQuery();

        
        if(rscheckcustomer.next())
        {
          String sql = "SELECT customer_id FROM customer WHERE vat=?";
          pscheckid=conn.prepareStatement(sql);
          pscheckid.setString(1,id);
          rscustid=pscheckid.executeQuery();

          //περίπτωση όπου το query εκτελέστηκε επιτυχώς στη ΒΔ -> ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
          if(rscustid.next()){
              String sql2 = "SELECT customer_id FROM application";
              rsmatch = conn.createStatement().executeQuery(sql2);
              rsmatch.first();
              int i = rscustid.getInt("customer_id");
              rsmatch.last();
              int p = rsmatch.getRow();
              for(int a=1;a<=p;a++){
                rsmatch.absolute(a);
                if(i==rsmatch.getInt("customer_id")){
                    message = "The customer has already an application running! He cant make a new one!";
                    response.sendRedirect("loanAdminCheckCustomer.jsp?error2="+message);
                    return;
                }
              }
              //Έλενχος για τον αριθμό που θα πάρει η αίτηση στη βάση
              rsappnum=conn.createStatement().executeQuery(sqlOption2);
              int elen=0;
              int j=1;
              while(rsappnum.next()){
                if(j!=rsappnum.getInt("application_id")){
                    session.setAttribute("appnum",j-1);
                    elen=1;
                    session.setAttribute("customerid",rscustid.getInt("customer_id"));
                    response.sendRedirect("applicationForm.jsp?error2="+message);
                }
                j++;
              }
              if(elen==0){
                session.setAttribute("appnum",j);
              }
              session.setAttribute("customerid",rscustid.getInt("customer_id"));
              response.sendRedirect("applicationForm.jsp?error2="+message);
          }
        }

        //περίπτωση όπου το query δεν εκτελέστηκε επιτυχώς στη ΒΔ -> ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
        else
        {
          message="Customer doesn't exist in our database!" ;
          response.sendRedirect("loanAdminCheckCustomer.jsp?error2="+message);
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
