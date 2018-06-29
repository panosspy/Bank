<%@page import="com.sun.corba.se.impl.protocol.giopmsgheaders.Message"%>
<!--Έλενχος για την εισαγωγή νέου loan admin στη βάση για το νέο του id -->
<%-- 
    Document   : preNewLoanAdmin
    Created on : 14 Δεκ 2012, 10:52:01 πμ
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
    
    ResultSet rscheckcustomerid = null;
    
    try{
           
    String sqlOption2="SELECT admin_id FROM loan_admin";
    
    
    
    rscheckcustomerid=conn.createStatement().executeQuery(sqlOption2);
    
    //Έλενχος για την τιμή που θα πάρει ο νέος loan admin στη βάση σαν id
    int i=1;
    while(rscheckcustomerid.next()){
        char s = rscheckcustomerid.getString("admin_id").charAt(7);
        int a = Character.getNumericValue(s);
        if(i!=a){
            String j=("admin00"+(i-1));
            session.setAttribute("adminid",j);
            response.sendRedirect("newLoanAdmin.jsp");
        }
        i++;
        if(i>5){
            String message="You can't make new Loan Admin account! You have already five members!";
            response.sendRedirect("superManagerMain.jsp?error="+message);
            
        }
    }
    String j ="admin00"+i;
    session.setAttribute("adminid",j);
    response.sendRedirect("newLoanAdmin.jsp");

    
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    //κλείσιμο των αντικειμένων επιστροφής αποτελεσμάτων καθώς και των συνδέσεων με τη ΒΔ
    try{
         if(rscheckcustomerid!=null){
             rscheckcustomerid.close();
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
