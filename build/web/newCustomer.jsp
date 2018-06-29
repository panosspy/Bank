<!--Σελίδα για την δημιουργία νέου πελάτη -->
<%-- 
    Document   : newCustomer
    Created on : 14 Δεκ 2012, 11:01:53 πμ
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    //Scriptlet για την μεταβλητή εμφάνισης σφαλμάτων "error3"
    String error3=request.getParameter("error3");
    if(error3==null || error3=="null"){
    error3="";
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>$uperBank - Administrator - Add New Customer</title>
        <meta charset="UTF-8">
        
        <!--Σύνδεση με το χρησιμοποιούμενο css-->
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        
         <script>
            //συνάρτηση για την αντικατάσταση-αποκοπή ειδικών χαρακτήρων
            function trim(s) 
            {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }

            //βοηθητική συνάρτηση ελέγχου τύπου ορίσματος (αριθμός ή μη)
            function isNumeric(val) {
                var valstr = val + "";
                for(var i = 0; i < valstr.length; i++) {
                    if(valstr.charAt(i) < "0" || valstr.charAt(i) > "9")
                        return false;
                }
                return true;
            }
            
            //συνάρτηση για τον έλεγχο συμπλήρωσης όλων των πεδίων της φόρμας και με "σωστές" τιμές ως προς τον τύπο και το μήκος
            function validate()
            {   
                if(trim(document.formNewCustomer.customername.value)==""||trim(document.formNewCustomer.customername.value)==null)
                {
                  alert("Name field is empty!");
                  document.formNewCustomer.customername.focus();
                  return false;
                }
                else if((document.formNewCustomer.customername.value.length)>20)
                {
                  alert("Name value is invalid!\nThe maximum size of this field is 20 characters");
                  document.formNewCustomer.customername.focus();
                  return false;
                }
                else if(trim(document.formNewCustomer.customervat.value)==""||trim(document.formNewCustomer.customervat.value)==null)
                {
                  alert("Vat field is empty!");
                  document.formNewCustomer.customervat.focus();
                  return false;
                }
                else if((document.formNewCustomer.customervat.value.length)>9)
                {
                  alert("Vat value is invalid!\nThe maximum size of this field is 9 numbers");
                  document.formNewCustomer.customervat.focus();
                  return false;
                }
                else if(isNumeric(document.formNewCustomer.customervat.value)==false)
                {
                  alert("Vat value is invalid!\nVat value contains only numbers (not characters)");
                  document.formNewCustomer.customervat.focus();
                  return false;
                }
                else if(trim(document.formNewCustomer.customeridentitycard.value)==""||trim(document.formNewCustomer.customeridentitycard.value)==null)
                {
                  alert("Identity card field is empty!");
                  document.formNewCustomer.customeridentitycard.focus();
                  return false;
                }
                else if((document.formNewCustomer.customeridentitycard.value.length)>10)
                {
                  alert("Identity card is invalid!\nThe maximum size of this field is 10 characters");
                  document.formNewCustomer.customeridentitycard.focus();
                  return false;
                }
                else if(trim(document.formNewCustomer.customerphone.value)==""||trim(document.formNewCustomer.customerphone.value)==null)
                {
                  alert("Phone field is empty!");
                  document.formNewCustomer.customerphone.focus();
                  return false;
                }
                else if((document.formNewCustomer.customerphone.value.length)>10)
                {
                  alert("Phone is invalid!\nThe maximum size of this field is 10 characters");
                  document.formNewCustomer.customerphone.focus();
                  return false;
                }
                else if(isNumeric(document.formNewCustomer.customerphone.value)==false)
                {
                  alert("Phone value is invalid!\nPhone value contains only numbers (not characters)");
                  document.formNewCustomer.customerphone.focus();
                  return false;
                }
                
            }
        </script>
        
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
                    <!--Φόρμα για τη δημιουργία νέoυ πελάτη -->
                    <h2>ADD NEW CUSTOMER</h2>
                    <strong style="color:yellowgreen;">Customer information</strong>
                    <p>Please fill in the form below with necessary informations and press "Submit" button to add the customer in database</p>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr>
                            <form name="formNewCustomer" method="post" onSubmit="return validate();" action="doNewCustomer.jsp">
                            <td>
                            <td colspan="3"><strong> </strong></td>
                            </tr>
                            <tr>
                            <td width="78">Customer's id</td>
                            <td width="6">:</td>
                            <td width="294"><input name="customerid" type="text" value="<%out.print(session.getAttribute("customerid"));%>" readonly></td>
                            </tr>
                            <tr>
                            <td  width="150">Name</td>
                            <td>:</td>
                            <td  width="150"><input name="customername" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Vat</td>
                            <td>:</td>
                            <td><input name="customervat" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Identity card</td>
                            <td>:</td>
                            <td><input name="customeridentitycard" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Phone</td>
                            <td>:</td>
                            <td><input name="customerphone" type="tetx" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><input type="submit" name="sSubmit" value="Submit">
                                <input type="reset" name="Reset" value="Clear">
                            </td>
                            </tr>
                        </table>
                        </td>
                        </form>
                        </tr>
                        </table>
                        
           
                        <div><h4 style="color:red;"><%=error3%></h4></div>






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
