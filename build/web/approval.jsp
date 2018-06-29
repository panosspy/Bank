<!--Σελίδα διαδικαστικού χαρακτήρα όπου γίνονται αλλαγές στη ΒΔ  ανάλογα με τα στοιχεία που επιλέγει ο χρήστης-->
<%-- 
    Document   : approval
    Created on : Dec 12, 2012, 8:38:59 PM
    Author     : boumpoukiotis
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <%
        int appl_id = Integer.parseInt(request.getParameter("id"));
   
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
            ps = connection.prepareStatement("update application set status =  ? where  application_id =  ?");

            ps.setInt(2, appl_id);
            ps.setInt(1, 2);
            ps.executeUpdate();
            String msg= "1";
            //ανακατεύθυνση του χρήστη και εκτύπωση ανάλογου μηνύματος
            response.sendRedirect("managerMain.jsp?msg="+msg);
          


        } catch (Exception ex) {
            out.println("Unable to connect to database.");
        }


    %>
    <body>

        <h1><%=appl_id%></h1>
    </body>
</html>
