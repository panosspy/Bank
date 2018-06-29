<!--Έλενχος για την εισαγωγή νέου πελάτη στη βάση για το νέο του id -->
<%-- 
    Document   : preNewCustomer
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
           
    String sqlOption2="SELECT customer_id FROM customer";
    
    
    
    rscheckcustomerid=conn.createStatement().executeQuery(sqlOption2);
    
    //Έλενχος για την τιμή που θα πάρει ο νέος πελάτης στη βάση σαν id
    int i=1;
    while(rscheckcustomerid.next()){
        if(i!=rscheckcustomerid.getInt("customer_id")){
            session.setAttribute("customerid",i-1);
            response.sendRedirect("newCustomer.jsp");
        }
        i++;
    }
    session.setAttribute("customerid",i);
    response.sendRedirect("newCustomer.jsp");

    
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
