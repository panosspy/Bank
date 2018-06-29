<!--Σελίδα διαδικαστικού χαρακτήρα όπου γίνονται αλλαγές στη ΒΔ  ανάλογα με τα στοιχεία που επιλέγει ο χρήστης-->
<%-- 
    Document   : update
    Created on : Dec 12, 2012, 8:55:00 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<%
    int appl_id = Integer.parseInt(request.getParameter("id"));
    int loan_amount = Integer.parseInt(request.getParameter("ln"));
    String docum = request.getParameter("docum");

    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    String connectionURL =
            "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";

    try {

        PreparedStatement ps = null;
        Connection connection = null;
        Statement statement = null;

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL);
        statement = connection.createStatement();

        //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
        ps = connection.prepareStatement("update application set status =  ?,loan_amount  = ?,documentation = ? where  application_id =  ?");
        ps.setInt(1, 2);
        ps.setInt(2, loan_amount);
        ps.setString(3, docum);
        ps.setInt(4, appl_id);

        ps.executeUpdate();
        
        //ανακατεύθυνση του χρήστη και εκτύπωση ανάλογου μηνύματος
        String msg = "1";
        response.sendRedirect("managerMain.jsp?msg=" + msg);



    } catch (Exception ex) {
        out.println("Unable to connect to database.");
    }


%>


