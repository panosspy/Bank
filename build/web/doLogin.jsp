<!--Σελίδα διαδικαστικού χαρακτήρα όπου πραγματοποιούνται οι απαιτούμενες ενέργειες (σύνδεση με τη ΒΔ, δημιουργία sessions) για ταυτοποίηση χρηστών και ανακατεύθυνση τους ανάλογα με τον τύπο του καθενός σε αντίστοιχη σελίδα-->
<%-- 
    Document   : doLogin
    Created on : Dec 1, 2012, 4:18:46 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html>
<%
    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91");
    
    ResultSet rsdoLogin = null;
    ResultSet rsdoLogin2 = null;
    ResultSet rsdoLogin3 = null;
    PreparedStatement psdoLogin=null;
    PreparedStatement psdoLogin2=null;
    PreparedStatement psdoLogin3=null;
    
    //ανάθεση τιμών πεδίων της login φόρμας σε τοπικές μεταβλητές
    String user=request.getParameter("sUserName");
    String pass=request.getParameter("sPwd");
    String message="User login successfully";
    
    try{
        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία των χρηστών τύπου "διαχειριστής_δανείου" για αναγνώριση χρηστών τέτοιου τύπου
        String sqlOption="SELECT * FROM loan_admin where name=? and password=?";

        psdoLogin=conn.prepareStatement(sqlOption);
        psdoLogin.setString(1,user);
        psdoLogin.setString(2,pass);

        rsdoLogin=psdoLogin.executeQuery();

        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία των χρηστών τύπου "διευθυντής" για αναγνώριση χρηστών τέτοιου τύπου
        String sqlOption2="SELECT * FROM manager where name=? and password=?";

        psdoLogin2=conn.prepareStatement(sqlOption2);
        psdoLogin2.setString(1,user);
        psdoLogin2.setString(2,pass);

        rsdoLogin2=psdoLogin2.executeQuery();

        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία των χρηστών τύπου "διαχειριστής συστήματος" για αναγνώριση χρηστών τέτοιου τύπου
        String sqlOption3="SELECT * FROM super_admin where super_name=? and super_password=?";

        psdoLogin3=conn.prepareStatement(sqlOption3);
        psdoLogin3.setString(1,user);
        psdoLogin3.setString(2,pass);

        rsdoLogin3=psdoLogin3.executeQuery();

        //περίπτωση όπου το query που εκτελέστηκε στη ΒΔ επιστρέψει αποτέλεσμα (υπάρχει ο χρήστης τύπου "διαχειριστής_δανείου")
        if(rsdoLogin.next())
        {
          //String sUserName=rsdoLogin.getString("name")+" "+rsdoLogin.getString("password");

          //δημιουργία session μεταβλητών για τη διαχείριση πρόσβασης σε υπηρεσίες της εφαρμογής
          session.setAttribute("sUserID",rsdoLogin.getString("name"));
          session.setAttribute("sUserName",rsdoLogin.getString("password"));
          
          //ανακατεύθυνση στην αντίστοιχη σελίδα με τις παρεχόμενες υπηρέσιες για το συγκεκριμένο τύπο χρήστη
          response.sendRedirect("loanAdminMain.jsp?error="+message);
        }

        //περίπτωση όπου το query που εκτελέστηκε στη ΒΔ επιστρέψει αποτέλεσμα (υπάρχει ο χρήστης τύπου "διευθυντής")
        if(rsdoLogin2.next())
        {
          //String sUserName=rsdoLogin2.getString("name")+" "+rsdoLogin2.getString("password");

          //δημιουργία session μεταβλητών για τη διαχείριση πρόσβασης σε υπηρεσίες της εφαρμογής
          session.setAttribute("sUserID",rsdoLogin2.getString("name"));
          session.setAttribute("sUserName",rsdoLogin2.getString("password"));
          
          //ανακατεύθυνση στην αντίστοιχη σελίδα με τις παρεχόμενες υπηρέσιες για το συγκεκριμένο τύπο χρήστη
          response.sendRedirect("managerMain.jsp?error="+message);
        }
        //περίπτωση όπου το query που εκτελέστηκε στη ΒΔ επιστρέψει αποτέλεσμα (υπάρχει ο χρήστης τύπου "διαχειριστής συστήματος")
        if(rsdoLogin3.next())
        {
          //String sUserName=rsdoLogin3.getString("super_name")+" "+rsdoLogin3.getString("super_password");

          //δημιουργία session μεταβλητών για τη διαχείριση πρόσβασης σε υπηρεσίες της εφαρμογής
          session.setAttribute("sUserID",rsdoLogin3.getString("super_name"));
          session.setAttribute("sUserName",rsdoLogin3.getString("super_password"));
          
          //ανακατεύθυνση στην αντίστοιχη σελίδα με τις παρεχόμενες υπηρέσιες για το συγκεκριμένο τύπο χρήστη
          response.sendRedirect("superManagerMain.jsp?error="+message);
        }

        //περίπτωση κατά την οποία κανένα από τα δύο queries (τόσο αυτό για τον έλεγχο στον πίνακα των "διαχειριστών_δανείου" όσο και αυτό στον πίνακα των "διευθυντών")
        else
        {
          //εκχώρηση αντίστοιχου μηνύματος στη μεταβλητή message
          message="Wrong username or password. Please try again!" ;
          //ανακατεύνση του χρήστη στην αρχική σελίδα login για νέα προσπάθεια αναγνώρισης του από την εφαρμογή
          response.sendRedirect("login.jsp?error="+message);
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{
         if(psdoLogin!=null){
             psdoLogin.close();
         }
         if(rsdoLogin!=null){
             rsdoLogin.close();
         }
         
         if(psdoLogin2!=null){
             psdoLogin2.close();
         }
         if(rsdoLogin2!=null){
             rsdoLogin2.close();
         }
         
         if(psdoLogin3!=null){
             psdoLogin3.close();
         }
         if(rsdoLogin3!=null){
             rsdoLogin3.close();
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