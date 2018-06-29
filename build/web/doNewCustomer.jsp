<!--Σελίδα διαδικαστικού χαρακτήρα όπου εισάγονται στη ΒΔ τα στοιχεία της φόρμας για νέο πελάτη-->
<%-- 
    Document   : doNewCustomer
    Created on : 14 Δεκ 2012, 11:30:37 πμ
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
   
    String custid=request.getParameter("customerid");
    int customerid = new Integer(custid).intValue();
    String customername=request.getParameter("customername");
    String customervat=request.getParameter("customervat");
    String customeridentitycard = request.getParameter("customeridentitycard");
    String customerphone = request.getParameter("customerphone");
    String message="The customer inserted successfull!";    
    int check=0;    
    
    
    try{
        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
        String sqlOption="INSERT INTO customer VALUES('"+customerid+"','"+customername+"','"+customervat+"','"+customeridentitycard+"','"+customerphone+"','null')"; 

        check=conn.createStatement().executeUpdate(sqlOption);
            
            //περίπτωση όπου το query εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
            if(check!=0){
               response.sendRedirect("newCustomer.jsp?error3="+message);

            }

            //περίπτωση όπου το query δεν εκτελέστηκε επιτυχώς στη ΒΔ και ανακατεύθυνση χρήστη και εκτύπωση ανάλογου μηνύματος
            else
            {
              message="An error occured during saving the application in our database.Please try again!" ;
              response.sendRedirect("newCustomer.jsp?error3="+message);

            }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{       
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>
