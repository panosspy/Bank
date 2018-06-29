<!--Βασικό μενού επιλογών για χρήστη τύπου "διαχειριστής δανείου"-->
<%-- 
    Document   : loanAdminMain
    Created on : Dec 11, 2012, 8:59:24 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>$uperBank - Loan Admin menu</title> 
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

                    <a class="active" href="loanAdminMain.jsp">Loan Admin</a>
                    <a href="myAccountLoanAdmin.jsp">My Account</a>

            </div>

            <div id="mainarea">

            <div id="contentarea">
                    <!--Αναφορά των διαθέσιμων επιλογών του χρήστη-->
                    <h2>MAIN MENU</h2>
                    <strong style="color:yellowgreen;">Make new loan application</strong>    
                    </br>
                    <p>To make a new loan application press "New Application" button and follow the steps on next page  </p>
                    <p align="center"><button onclick="location.href='loanAdminCheckCustomer.jsp'" style="height: 30px; width: 200px"><img src="css/images/application_form_add.png" alt="" /> New Application</button> </p>
                    </br>
                    <strong style="color:yellowgreen;">Show applications for suggestion to the manager </strong>
                    </br>
                    <p>To see all applications and make your suggestion press "Applications Processing" button and follow the steps on next page </p>
                    <p align="center"> <button onclick="location.href='showApplicationsForSuggestions.jsp'" style="height: 30px; width: 250px"><img src="css/images/application_form_edit.png" alt="" /> Applications Processing </button> </p>
                    </br>
                    <strong style="color:yellowgreen;">Inform customers </strong>
                    </br>
                    <p>To inform customers about their loan applications press "Inform Customers" button and follow the steps on next page </p>
                    <p align="center"> <button onclick="location.href='info.jsp'" style="height: 30px; width: 180px"><img src="css/images/email.png" alt="" /> Inform Customers </button> </p>
                    
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

