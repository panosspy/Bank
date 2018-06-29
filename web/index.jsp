<!--Αρχική σελίδα τυπικού χαρακτήρα αφού η λειτουργία της εφαρμογής μεταφέρεται σε νέο παράθυρο του browser-->
<%-- 
    Document   : index
    Created on : Dec 6, 2012, 5:18:42 PM
    Author     : boumpoukiotis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> $uperBank </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language='Javascript'>
              //άνοιγμα νέου παραθύρου όπου λειτουργεί η εφαρμογή
              window.open("login.jsp","my", config='height=availHeight,width=availWidth,left=200,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, directories=no, status=no');
        </script>
    </head>
    <body>
        <h1> Your application is running in a new window in your browser !</h1>
    </body>
</html>
