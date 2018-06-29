<!--Σελίδα διαδικαστικού χαρακτήρα όπου εισάγεται στη ΒΔ ο νέος κωδικός χρήστη-->
<%-- 
    Document   : doChangeLoanAdmin
    Created on : Dec 11, 2012, 9:23:48 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*" %>
<%
    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    String oldPswd=request.getParameter("oldPassword");
    String newPswd=request.getParameter("newPassword");
    String message="Password changed successfully";

    String connectionURL = "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";
    Connection connection = null;
    Statement statement = null;

    ResultSet rsdoChange = null;
    PreparedStatement psdoChange=null;      
    
    //εκτέλεση της διαδικασίας σύνδεσης με τη ΒΔ και εκτέλεσης του quiry μόνο αν ισχύουν οι προϋποθέσεις
    if(oldPswd.equals(session.getAttribute("sUserName")))
    {
        try {
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            
            //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
            psdoChange = connection.prepareStatement("UPDATE loan_admin SET password=? WHERE password=?");
            psdoChange.setString(1, newPswd);
            psdoChange.setString(2, oldPswd);
            psdoChange.executeUpdate();

            //ανάθεση του νέου κωδικού στο session για να ισχύει αμέσως μετά την αλλαγή του
            session.setAttribute("sUserName",newPswd);
            message="Password changed succesfully!" ;
            response.sendRedirect("myAccountLoanAdmin.jsp?error4="+message);
            
        } catch(Exception e)
            {
                e.printStackTrace();
            }
            //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
            try {
                if(statement != null)
                {
                    statement.close();
                    statement = null;
                }
                if(psdoChange != null) 
                {
                    psdoChange.close();
                    psdoChange = null;
                }
                if(connection != null) 
                {
                    connection.close();
                    connection = null;
                }
          } catch (SQLException e) {}

        }
        else
            {
              //εκχώρηση αντίστοιχου μηνύματος στη μεταβλητή message
              message="Your password is incorrect. Please try again!" ;
              //ανακατεύνση του χρήστη στην αρχική σελίδα για νέα προσπάθεια και εμφάνιση αντίστοιχου μηνύματος λάθους
              response.sendRedirect("myAccountLoanAdmin.jsp?error4="+message);
            }
    
%>
