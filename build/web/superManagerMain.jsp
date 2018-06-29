<!--Βασικό μενού επιλογών για χρήστη τύπου "διαχειριστής συστήματος"-->
<%-- 
    Document   : superManagerMain
    Created on : Dec 13, 2012, 1:34:41 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    //Scriptlet για την μεταβλητή εμφάνισης σφαλμάτων "error3"
    String error=request.getParameter("error");
    if(error==null || error=="null"){
    error="";
    }
    %>
    <%
    //Scriptlet για την μεταβλητή εμφάνισης σφαλμάτων "error3"
    String error1=request.getParameter("error1");
    if(error1==null || error=="null"){
    error1="";
    }
    %>
<html>
    <head>
        <title>$uperBank - System administrator menu</title> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        
        <!--Σύνδεση με το χρησιμοποιούμενο css-->
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        
        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
        <link rel="stylesheet" href="stylesheets/calendarview.css">
        
        <style>
          /*calendar css για την εμφάνιση του στην html σελίδα*/
          body {
            font-family: Trebuchet MS;
          }
          div.calendar {
            max-width: 240px;
            margin-left: auto;
            margin-right: auto;
          }
          div.calendar table {
            width: 100%;
          }
          div.dateField {
            width: 140px;
            padding: 6px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            color: #555;
            background-color: white;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
          }
          div#popupDateField:hover {
            background-color: #cde;
            cursor: pointer;
          }
        </style>
        
        <!--κλήσεις javascripts για τη λειτουργία του Calendar-->
        <script src="javascripts/prototype.js"></script>
        <script src="javascripts/calendarview.js"></script>
        
        <script>
          function setupCalendars() {
            //συνάρτηση για τη λειτουργία του calendar 
            Calendar.setup(
              {
                dateField: 'embeddedDateField',
                parentElement: 'embeddedCalendar'
              }
            )
          }

          Event.observe(window, 'load', function() { setupCalendars() })
        </script>
        
    </head>
    <body>
        <%
        //έλεγχος αν η αναγνώριση χρηστών έγινε με επιτυχία και ανακατεύθυνση στην αρχική σελίδα σε περίπτωση λάθους
        if(session.getAttribute("sUserID")==null || session.getAttribute("sUserID")=="")
        {
        response.sendRedirect("login.jsp");
        }
        %>
        
        
        <div id="page">
            <div id="header">
                <br/> <br/> <br/> <br/> <br/>
                <div class="description">
                    <div align=right style="margin-right: 57px;">
                             <small> <%out.print("User: ");%> <a href="logout.jsp"> <u style="color:orange;"> <%out.print(session.getAttribute("sUserID"));%> </u> </a> </small> 
                    </div>
                </div>
            </div>

            <div id="menulinks">

                    <a class="active" href="superManagerMain.jsp">Administrator</a>
                    

            </div>

            <div id="mainarea">

            <div id="contentarea">
                    <!--Αναφορά των διαθέσιμων επιλογών του χρήστη-->
                    <h2>MAIN MENU</h2>
                    <strong style="color:yellowgreen;">Add, Delete or Update Customer</strong>    
                    </br>
                    <p>To make changes for customers  press one of the buttons below and follow the steps on next page  </p>
                    <p align="center"><button onclick="location.href='preNewCustomer.jsp'" style="height: 30px; width: 90px"><img src="css/images/add.png" alt="" />Add</button>  <button onclick="location.href='removeCustomer.jsp'" style="height: 30px; width: 90px"><img src="css/images/delete.png" alt="" />Delete</button> <button onclick="location.href='preChangeCustomer.jsp'" style="height: 30px; width: 90px"><img src="css/images/wrench.png" alt="" />Update</button></p>
                    </br>
                    <strong style="color:yellowgreen;">Add, Delete or Update Loan Administrator</strong>
                    </br>
                    <p>To make changes for loan administrators  press one of the buttons below and follow the steps on next page</p>
                    <p align="center"><button onclick="location.href='preNewLoanAdmin.jsp'" style="height: 30px; width: 90px"><img src="css/images/add.png" alt="" />Add</button>  <button onclick="location.href='removeLoanAdmin.jsp'" style="height: 30px; width: 90px"><img src="css/images/delete.png" alt="" />Delete</button> <button onclick="location.href='preChangeLoanAdmin.jsp'" style="height: 30px; width: 90px"><img src="css/images/wrench.png" alt="" />Update</button></p>
                    </br>
                    <strong style="color:yellowgreen;">Add, Delete or Update Manager</strong>
                    </br>
                    <p>To make changes for managers  press one of the buttons below and follow the steps on next page </p>
                    <p align="center"></button> <button onclick="location.href='managerChange.jsp'" style="height: 30px; width: 90px"><img src="css/images/wrench.png" alt="" />Update</button></p>
                    
                    <div><h4 style="color:red;"><%=error1%></h4></div>
            </div>

            <div id="sidebar">
                    <h2>Calendar</h2>

                <!--Εμφάνιση του στοιχείου Calendar -->
                <div id="embeddedExample" style="">
                  <div id="embeddedCalendar" style="margin-left: auto; margin-right: auto">
                  </div>
                  <br />
                </div>
                    
                <!--Εμφάνιση της ημερομηνίας και της ώρας (σε real-time μορφή) με κλήση αντίστοιχου javascript-->
                <div style="color:tomato;" align="center"><i><b>
                    <span id="date_time"></span>
                    <script type="text/javascript">window.onload = date_time('date_time');</script> </b></i>
                </div>

            </div></div>

            <div id="footer">
                <a>Copyright ©$uperBank 2012 | Design: Boumpoukiotis & Spyropoulos & Marantos co.  </a>
            </div>


        </div>
                    
        <!--Ορισμός μέγιστου χρονικού διαστήματος ισχύος του session κατά το οποίο έχει γίνει αναγνώριση του χρήστη -->
        <%session.setMaxInactiveInterval(300);%>
        
        </body>
</html>
