<!--Αρχική σελίδα της εφαρμογής όπου ζητούνται τα απαραίτητα στοιχεία για τη διαπίστεση των χρηστών, προκειμένου να εισέλθουν στις λειτουργίες τις εφαρμογής-->
<%-- 
    Document   : login
    Created on : Dec 1, 2012, 4:17:35 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <%
    //Scriptlet για την μεταβλητή εμφάνισης σφαλμάτων "error"
    String error=request.getParameter("error");
    if(error==null || error=="null"){
    error="";
    }
    %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>$uperBank - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--Σύνδεση με το χρησιμοποιούμενο css-->
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        
        <script>
            //συνάρτηση για την αντικατάσταση-αποκοπή ειδικών χαρακτήρων
            function trim(s) 
            {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }
            
            //συνάρτηση για τον έλεγχο συμπλήρωσης όλων των πεδίων της φόρμας και με "σωστές" τιμές ως προς τον τύπο και το μήκος
            function validate()
            {   
                if(trim(document.frmLogin.sUserName.value)==""||trim(document.frmLogin.sUserName.value)==null)
                {
                  alert("Username field is empty!");
                  document.frmLogin.sUserName.focus();
                  return false;
                }
                else if((document.frmLogin.sUserName.value.length)>20)
                {
                  alert("Username is invalid!\nThe maximum size is 20 characters");
                  document.frmLogin.sUserName.focus();
                  return false;
                }
                else if(trim(document.frmLogin.sPwd.value)==""||trim(document.frmLogin.sPwd.value)==null)
                {
                  alert("Password field is empty!");
                  document.frmLogin.sPwd.focus();
                  return false;
                }
                else if((document.frmLogin.sPwd.value.length)>10)
                {
                  alert("Password is invalid!\nThe maximum size is 10 characters");
                  document.frmLogin.sPwd.focus();
                  return false;
                }
            }
        </script>
        
        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
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

                <div id="header" >

                </div>

                <div id="menulinks">

                        <a class="active" href="#">Home</a>
                        <a href="services.jsp">Services</a>
                        <a href="help.jsp">Help</a>

                </div>


                <div id="mainarea">


                    <div id="contentarea">
                            <h2>ΗΟΜΕ</h2>
                            
                            <strong style="color:yellowgreen;">User Login</strong>
                            <!--Φόρμα για τη συμπλήρωση username & password προκειμένου να γίνει η απαιτούμενη αναγνώριση χρηστών για την είσοδο στις αντίστοιχες λειτουργίες κάθε χρήστη της εφαρμογής  -->
                            <p>Fill username and password fields and press "Login" button to log in </p>
                            <table width="100%" border="0" cellpadding="3" cellspacing="1">
                                <tr>
                                <form name="frmLogin" method="post" onSubmit="return validate();" action="doLogin.jsp" TARGET="my">
                                <td>
                                <td colspan="3"><strong> </strong></td>
                                </tr>
                                <tr>
                                <td width="78">Username</td>
                                <td width="6">:</td>
                                <td width="294"><input name="sUserName" type="text" ></td>
                                </tr>
                                <tr>
                                <td>Password</td>
                                <td>:</td>
                                <td><input name="sPwd" type="password" ></td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td><input type="submit" name="sSubmit" value="Login">
                                    <input type="reset" name="Reset" value="Clear">
                                </td>
                                </tr>
                            </table>
                            </td>
                            </form>
                            </tr>
                            </table>
                            <!--Εμφάνιση της μεταβλητής ύπαρξης σφαλμάτων "error"-->
                            <div><h4 style="color:red;"><%=error%></h4></div>

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
