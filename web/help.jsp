<!--Σελίδα εμφάνισης βοηθητικών υπηρεσίων για την εξυπηρέτηση του χρήστη της εφαρμογής -->
<%-- 
    Document   : help
    Created on : Dec 6, 2012, 3:13:00 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>$uperBank - Help</title>
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
                //συνάρτηση για τη λειτουργία του calendar
                function setupCalendars() {
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
                    <a href="services.jsp">Services</a>
                    <a class="active" href="help.jsp">Help</a>
              


            </div>

            <div id="mainarea">

                <div id="contentarea">
                        <h2>HELP</h2>

                        <!--Αναφορά των παρεχόμενων βοηθητικών υπηρεσιών-->
                        <strong style="color:yellowgreen;">User Help</strong>
                        <p>In order to have access to the <strong><b>Superbank&#0174</b> </strong> services, you just have to type the Username and Password, you were given by system administrator.</p>
                        
                        <strong style="color:yellowgreen;">If you have forgotten your Password</strong>
                        <br/>
                        <br/>
                        In case you have forgotten your Password, please contact with system administrator (by <i><a style="color:aqua;" href="mailto:it20919@hua.gr">e-mail</a></i> or by phone from Monday to Friday, 09:00 to 17:00, at (+30) 210-2134567), and you will be immediately given a new Password.
                        <br/>
                        <br/>
                        <strong style="color:yellowgreen;">If you want to change your Password</strong>
                        <br/>
                        <br/>
                        In case you wish to change your Password, you should login and then go to "My Account" on the up side of the screen. In the appearing form, please type your old Password, then the new one you wish to have, re-type the new Password to confirm it, and finally press "Update".
                </div>

                <div id="sidebar">
                        <h2>Calendar</h2>

                        <!--Εμφάνιση του στοιχείου Calendar -->
                        <div id="embeddedExample" style="">
                            <div id="embeddedCalendar" style="margin-left: auto; margin-right: auto"> </div>
                            <br />
                        </div>
                         
                        <!--Εμφάνιση της ημερομηνίας και της ώρας (σε real-time μορφή) με κλήση αντίστοιχου javascript-->                            
                        <div style="color:tomato;" align="center"><i><b>
                            <span id="date_time"></span>
                            <script type="text/javascript">window.onload = date_time('date_time');</script> </b></i>
                        </div>
                </div>
            </div>

                <div id="footer">
                    <a>Copyright ©$uperBank 2012 | Design: Boumpoukiotis & Spyropoulos & Marantos co.  </a>
                </div>

        </div>
    </body>
</html>
