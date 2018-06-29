<!--Σελίδα διαδικαστικού χαρακτήρα όπου τερματίζεται το session και ο χρήστης ανακατευθύνεται στην αρχική σελίδα της εφαρμογής-->
<%-- 
    Document   : logout
    Created on : Dec 5, 2012, 8:43:37 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("login.jsp");
        %>
    </body>
</html>
