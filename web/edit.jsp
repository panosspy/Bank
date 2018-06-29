<!--Σελίδα διαδικαστικού χαρακτήρα όπου γίνονται αλλαγές στη ΒΔ  ανάλογα με τα στοιχεία που επιλέγει ο χρήστης-->
<%-- 
    Document   : edit
    Created on : 12 Δεκ 2012, 9:54:42 μμ
    Author     : bill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<%
    int appl_id = Integer.parseInt(request.getParameter("id"));
    int loan_amount = Integer.parseInt(request.getParameter("ln"));
    //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
    String connectionURL =
            "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";
    String docum = request.getParameter("docum");

%>
    <!--βοηθητική συνάρτηση ελέγχου εκυρότητας αλλαγών χρήστη-->
<%!  public int check(int appl_id) {
        String connectionURL =
                "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";
        int loan_limit = 0;
        int salary;

            try {

            Connection connection1 = null;
            Statement statement1 = null;
            ResultSet rs1 = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection1 = DriverManager.getConnection(connectionURL);
            statement1 = connection1.createStatement();

            //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκε
            rs1 = statement1.executeQuery("select salary from application where application_id ='" + appl_id + "'");
            rs1.next();
            salary = rs1.getInt(1);
            //διενέργεια ελέγχων
            if (salary >= 600 && salary < 1500) {
                loan_limit = 30000;

            } else if (salary >= 1500 && salary < 3000) {
                loan_limit = 60000;

            } else if (salary >= 3000 && salary < 10000) {
                loan_limit = 200000;

            } else if (salary >= 10000) {
                loan_limit = 1000000;

            }


        } catch (Exception ex) {
            return 0;
        }
        return loan_limit;
    }
%>


<%
    int loan_limit = check(appl_id);
    if (loan_amount > loan_limit) {
        
        //ανακατεύθυνση του χρήστη και εκτύπωση ανάλογου μηνύματος
        String msg = "3";
        response.sendRedirect("showApplicationsForSuggestions.jsp?msg=" + msg);
    } else {
        //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
        try {

            PreparedStatement ps = null;
            Connection connection = null;
            Statement statement = null;

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            //εκτέλεση query
            ps = connection.prepareStatement("update application set status =  ?,loan_amount  = ?,documentation = ? where  application_id =  ?");
            ps.setInt(1, 1);
            ps.setInt(2, loan_amount);
            ps.setString(3, docum);
            ps.setInt(4, appl_id);

            ps.executeUpdate();
            
            //ανακατεύθυνση του χρήστη και εκτύπωση ανάλογου μηνύματος
            String msg = "1";
            response.sendRedirect("showApplicationsForSuggestions.jsp?msg=" + msg);



        } catch (Exception ex) {
            out.println("Unable to connect to database.");
        }
    }

%>

