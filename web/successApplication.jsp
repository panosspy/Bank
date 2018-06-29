<%-- 
    Document   : successApplication
    Created on : Dec 12, 2012, 11:48:49 AM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String error=request.getParameter("error");
    if(error==null || error=="null"){
    error="";
    }
    %>
<html>
    <head>
        
        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>$uperBank - Loan Admin - Application saved successfully</title>
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        <meta charset="UTF-8">
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
            // Embedded Calendar
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
        
        <!--Ορισμός μέγιστου χρονικού διαστήματος ισχύος του session κατά το οποίο έχει γίνει αναγνώριση του χρήστη -->
        
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
                    <a href="contact.jsp">Services</a>
                    <a href="myAccountLoanAdmin.jsp">My Account</a>

            </div>

            <div id="mainarea">

            <div id="contentarea">
                    <h2>New Application</h2>
                        
                    
                        
           
                        <div><h4 style="color:red;"><%//=error%></h4></div>






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
        
        <%session.setMaxInactiveInterval(300);%>
        <%
        
        //remove objects from session. Used on check for redirect 
        //session.removeAttribute("sUserID");
        //session.removeAttribute("sUserName");
        
        //session.invalidate();
        %>
        </body>
</html>
