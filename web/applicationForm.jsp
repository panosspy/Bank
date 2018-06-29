<!--Σελίδα για τη δημιουργία νέας αίτησης δανείου-->
<%-- 
    Document   : applicationForm
    Created on : Dec 12, 2012, 11:19:48 AM
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
        <title>$uperBank - Loan Admin - Make New Application</title>
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
                //υπολογισμός της ελάχιστης τιμής του income
                var minIncome = (document.formApplication.salary.value*12);
           
                if(trim(document.formApplication.salary.value)==""||trim(document.formApplication.salary.value)==null)
                {
                  alert("Salary field is empty!");
                  document.formApplication.salary.focus();
                  return false;
                }
                else if((document.formApplication.salary.value.length)>11)
                {
                  alert("Salary value is invalid!\nThe maximum size of this field is 10 characters");
                  document.formApplication.salary.focus();
                  return false;
                }
                else if(isNumeric(document.formApplication.salary.value)==false)
                {
                  alert("Salary value is invalid!\nSalary value contains only numbers (not characters)");
                  document.formApplication.salary.focus();
                  return false;
                }
                else if(trim(document.formApplication.income.value)==""||trim(document.formApplication.income.value)==null)
                {
                  alert("Income field is empty!");
                  document.formApplication.income.focus();
                  return false;
                }
                else if((document.formApplication.income.value.length)>11)
                {
                  alert("Income value is invalid!\nThe maximum size of this field is 10 characters");
                  document.formApplication.income.focus();
                  return false;
                }
                else if(isNumeric(document.formApplication.income.value)==false)
                {
                  alert("Income value is invalid!\nIncome value contains only numbers (not characters)");
                  document.formApplication.income.focus();
                  return false;
                }
                else if((document.formApplication.income.value)<(12*document.formApplication.salary.value))
                {
                  alert("Income value is invalid!\nThe minimum value for this field, is at least: "+minIncome+"\u20AC for this salary which you insert above");
                  document.formApplication.income.focus();
                  return false;
                }
                else if(trim(document.formApplication.employername.value)==""||trim(document.formApplication.employername.value)==null)
                {
                  alert("Employer name field is empty!");
                  document.formApplication.employername.focus();
                  return false;
                }
                else if((document.formApplication.employername.value.length)>20)
                {
                  alert("Employer name is invalid!\nThe maximum size of this field is 20 characters");
                  document.formApplication.employername.focus();
                  return false;
                }
                else if(trim(document.formApplication.employeraddress.value)==""||trim(document.formApplication.employeraddress.value)==null)
                {
                  alert("Customers employer address field is empty!");
                  document.formApplication.employeraddress.focus();
                  return false;
                }
                else if((document.formApplication.employeraddress.value.length)>40)
                {
                  alert("Employer address is invalid!\nThe maximum size of this field is 40 characters");
                  document.formApplication.employeraddress.focus();
                  return false;
                }
                else if(trim(document.formApplication.loanamount.value)==""||trim(document.formApplication.loanamount.value)==null)
                {
                  alert("Loan amount field is empty!");
                  document.formApplication.loanamount.focus();
                  return false;
                }
                else if((document.formApplication.loanamount.value.length)>11)
                {
                  alert("Loan amount value is invalid!\nThe maximum size of this field is 10 characters");
                  document.formApplication.loanamount.focus();
                  return false;
                }
                else if(isNumeric(document.formApplication.loanamount.value)==false)
                {
                  alert("Loan amount value is invalid!\nLoan amount value contains only numbers (not characters)");
                  document.formApplication.loanamount.focus();
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

                    <a class="active" href="loanAdminMain.jsp">Loan Admin</a>
                    <a href="myAccountLoanAdmin.jsp">My Account</a>

            </div>

            <div id="mainarea">

            <div id="contentarea">
                    <!--Φόρμα για τη δημιουργία νέας αίτησης -->
                    <h2>MAKE NEW LOAN APPLICATION (step 2)</h2>
                    <strong style="color:yellowgreen;">Loan information</strong>
                    <p>Please fill in the form below with necessary informations and press "Submit" button to add the loan application in database</p>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr>
                            <form name="formApplication" method="post" onSubmit="return validate();" action="doApplication.jsp">
                            <td>
                            <td colspan="3"><strong> </strong></td>
                            </tr>
                            <tr>
                            <td width="78">Application's id</td>
                            <td width="6">:</td>
                            <td width="294"><input name="applicationid" type="text" value="<%out.print(session.getAttribute("appnum"));%>" readonly></td>
                            </tr>
                            <td width="150"> <i><b style="color:palegreen">Customer informations</b></i> </td>
                            <tr>
                            <td  width="150">Id</td>
                            <td>:</td>
                            <td  width="150"><input name="customerid" type="text" value="<%out.print(session.getAttribute("customerid"));%>" readonly></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Salary</td>
                            <td>:</td>
                            <td><input name="salary" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Income</td>
                            <td>:</td>
                            <td><input name="income" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Employer name</td>
                            <td>:</td>
                            <td><input name="employername" type="tetx" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Employer address</td>
                            <td>:</td>
                            <td><input name="employeraddress" type="text" ></td>
                            <td></td>
                            </tr>
                            <td width="90"> <i><b style="color:palegreen">Loan informations</b></i> </td>
                            <tr>
                            <td>Type</td>
                            <td>:</td>
                            <td><input name="loantype" type="radio" value="purchasing" checked="checked"/>Purchasing
                            <input name="loantype" type="radio" value="construction" />Construction</td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Amount</td>
                            <td>:</td>
                            <td><input name="loanamount" type="text" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>Time</td>
                            <td>:</td>
                            <td><select name="loantime">
                            <option selected value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="25">25</option>
                            <option value="30">30</option>
                            <option value="35">35</option>
                            <option value="40">40</option>
                            <option value="45">45</option>
                            <option value="50">50</option>
                            <option value="55">55</option>
                            <option value="60">60</option>
                            </select>
                            </td> 
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
