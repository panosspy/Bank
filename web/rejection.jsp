<%-- 
    Document   : rejection
    Created on : Dec 12, 2012, 8:54:45 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@page import="java.sql.*"%>
<%
    int appl_id = Integer.parseInt(request.getParameter("id"));
    int loan_amount = Integer.parseInt(request.getParameter("ln"));
    String connectionURL =
            "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";


%>
    
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

            //εκτέλεση query στη βάση δεδομένων με τα στοιχεία της φόρμας που συμπληρώθηκ
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
        
    try {
        //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        int loan_limit = check(appl_id);
        if (loan_amount < loan_limit) {

            String msg = "3";
            response.sendRedirect("managerMain.jsp?msg=" + msg);
        } else {
            //κλήσεις και αναθέσεις βοηθητικών μεταβλητών για τη σύνδεση με τη ΒΔ
            try {

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection(connectionURL);
                Statement st = conn.createStatement();
                
                //εκτέλεση query
                st.executeUpdate("DELETE FROM application WHERE application_id = '" + appl_id + "'");

                //ανακατεύθυνση του χρήστη και εκτύπωση ανάλογου μηνύματος
                String msg = "2";
                response.sendRedirect("managerMain.jsp?msg=" + msg);
            } catch (Exception e) {
                out.println("Unable to connect to database.");
            }
        }

    } catch (Exception ex) {
        out.println("Unable to connect to database.");
    }

%>
