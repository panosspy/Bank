<!--Σελίδα εμφάνισης παρεχόμενων υπηρεσίων ανά είδος χρήστη-->
<%-- 
    Document   : services
    Created on : Dec 6, 2012, 7:11:23 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>$uperBank - Services</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        
        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
        
        <!--κλήσεις javascripts για τη λειτουργία του Calendar-->
        <script src="javascripts/prototype.js"></script>
        <script src="javascripts/calendarview.js"></script>
        
        <link rel="stylesheet" href="stylesheets/calendarview.css">
        
            <style>
              /*calendar css για την εμφάνιση στην html σελίδα*/  
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
        <div id="page">
            <div id="header">

            </div>

            <div id="menulinks">

                    <a href="login.jsp">Home</a>
                    <a class="active" href="services.jsp">Services</a>
                    <a href="help.jsp">Help</a>


            </div>

            <div id="mainarea">

                <div id="contentarea">
                        <h2>SERVISES</h2>

                        <!--Αναφορά των υποστηριζόμενων υπηρεσιών ανά κατηγορία χρήστη-->
                        <strong style="color:yellowgreen;">Manager Services</strong>

                        <p>Available services for a manager account in our bank:</p>
                        <ul>
                        <li><i>Composition of new loan application  </i></li> 
                        <li><i>Calculation of maximum amount of money</i></li>
                        <li><i>Suggestion of a loan application to the manager</i></li>
                        <li><i>Customer informing</i></li>
                        </ul>



                        <strong style="color:yellowgreen;">Loan administrator Services</strong>
                        <p>Available services for a loan administrator account in our bank:</p>
                        <ul>
                        <li><i>Approval of loan application  </i></li> 
                        <li><i>Rejection of loan application</i></li>
                        <li><i>Change of the amount of a loan application</i></li>
                        </ul>


                        <strong style="color:yellowgreen;">System administrator Services</strong>
                        <p>Available services for a system administrator account in our bank:</p>
                        <ul>
                        <li><i>Add, Delete and Update customer's database  </i></li> 
                        <li><i>Add, Delete and Update manager's database</i></li>
                        <li><i>Add, Delete and Update loan administrator database</i></li>
                        </ul>


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
                            <script type="text/javascript">window.onload = date_time('date_time');</script>
                            </b></i></div>
                </div>
            </div>

                <div id="footer">
                    <a>Copyright ©$uperBank 2012 | Design: Boumpoukiotis & Spyropoulos & Marantos co.  </a>
                </div>

        </div>
    </body>
</html>
