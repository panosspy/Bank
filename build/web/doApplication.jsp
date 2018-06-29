<!--Σελίδα διαδικαστικού χαρακτήρα όπου εισάγονται στη ΒΔ τα στοιχεία της φόρμας-->
<%-- 
    Document   : doApplication
    Created on : Dec 12, 2012, 11:13:22 AM
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
   
    PreparedStatement psdoapplic=null;
    
    String message="Application saved successfully!";    
    int check=0;
    
    try{
        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
        String sqlOption="INSERT INTO application VALUES('"+Integer.parseInt(request.getParameter("applicationid"))+"','"+Integer.parseInt(request.getParameter("customerid"))+"','"+Integer.parseInt(request.getParameter("salary"))+"','"+request.getParameter("employername")+"','"+Integer.parseInt(request.getParameter("income"))+"','"+request.getParameter("loantype")+"','"+Integer.parseInt(request.getParameter("loanamount"))+"','"+Integer.parseInt(request.getParameter("loantime"))+"','"+session.getAttribute("sUserName").toString()+"','manager001','0','NULL'"+",'"+request.getParameter("employeraddress")+"')"; 

        check=conn.createStatement().executeUpdate(sqlOption);
            
            //περίπτωση όπου το query εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
            if(check!=0){
               response.sendRedirect("applicationForm.jsp?error3="+message);

            }

            //περίπτωση όπου το query δεν εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
            else
            {
              message="An error occured during saving the application in our database.Please try again!" ;
              response.sendRedirect("applicationForm.jsp?error3="+message);

            }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{       
         if(psdoapplic!=null){
             psdoapplic.close();
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

