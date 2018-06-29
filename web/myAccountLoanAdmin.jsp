<!--Σελίδα για την αλλαγή του κωδικού πρόσβασης από το χρήστη-->
<%-- 
    Document   : myAccountLoanAdmin
    Created on : Dec 11, 2012, 9:20:37 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Scriptlet για την μεταβλητή εμφάνισης σφαλμάτων "error4"
    String error4=request.getParameter("error4");
    if(error4==null || error4=="null"){
    error4="";
    }
    %>
<html>
    <head>
        <title>$uperBank - Loan Admin - My Account</title>
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
                if(trim(document.changePasswordForm.oldPassword.value)==""||trim(document.changePasswordForm.oldPassword.value)==null)
                {
                  alert("Current password field is empty!");
                  document.changePasswordForm.oldPassword.focus();
                  return false;
                }
                else if(trim(document.changePasswordForm.newPassword.value)==""||trim(document.changePasswordForm.newPassword.value)==null)
                {
                  alert("New password field is empty!");
                  document.changePasswordForm.newPassword.focus();
                  return false;
                }
                else if((document.changePasswordForm.newPassword.value.length)>10)
                {
                  alert("Please give a valid password\nThe length of new Password must be up to 10 characters!");
                  document.changePasswordForm.newPassword.focus();
                  document.changePasswordForm.confirmPassword.focus();
                  return false;
                }
                else if(trim(document.changePasswordForm.confirmPassword.value)==""||trim(document.changePasswordForm.confirmPassword.value)==null)
                {
                  alert("Confirm password field is empty!");
                  document.changePasswordForm.confirmPassword.focus();
                  return false;
                }
                else if(trim(document.changePasswordForm.confirmPassword.value)!=(trim(document.changePasswordForm.newPassword.value)))
                {
                  alert("Please confirm your password correctly!");
                  document.changePasswordForm.confirmPassword.focus();
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
        //check if connection established in login
        if(session.getAttribute("sUserID")==null || session.getAttribute("sUserID")=="")
        {
        response.sendRedirect("index.jsp");
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
            
		<a href="loanAdminMain.jsp">Loan Admin</a>
		<a class="active" href="myAccountLoanAdmin.jsp">My Account</a>
                
	</div>
	
	
	<div id="mainarea">
            
            
	<div id="contentarea">
		<h2>MY ACCOUNT</h2>
                <!--Φόρμα για την αλλαγή του κωδικού πρόσβασης του χρήστη-->
                <strong style="color:yellowgreen;">Change Password</strong>
                
                <p>Please type your old Password, then the new one you wish to have, re-type the new Password to confirm it, and finally press "Update" to change your password</p>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr>
                            <form name="changePasswordForm" method="post" onSubmit="return validate();" action="doChangeLoanAdmin.jsp">
                            <td>
                            <td colspan="3"><strong> </strong></td>
                            </tr>
                            <tr>
                            <td width="78">Username</td>
                            <td width="6">:</td>
                            <td width="294"><input name="User" type="text" value="<%out.print(session.getAttribute("sUserID"));%>" readonly ></td>
                            </tr>
                            <tr>
                            <td style="color:red;">Current Password</td>
                            <td>:</td>
                            <td><input name="oldPassword" type="password" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td style="color:green;">New Password</td>
                            <td>:</td>
                            <td><input name="newPassword" type="password" ></td>
                            <td></td>
                            </tr>
                            <tr>
                            <td style="color:green;">Confirm New Password</td>
                            <td>:</td>
                            <td><input name="confirmPassword" type="password" ></td>
                            <td></td>
                            </tr>
                            
                            <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><input type="submit" name="sSubmit" value="Update">
                                <input type="reset" name="Reset" value="Clear">
                            </td>
                            </tr>
                        </table>
                        </td>
                        </form>
                        </tr>
                        </table>
                        <div><h4 style="color:red;"><%=error4%></h4></div>
        	
	</div>
	
	<div id="sidebar">
		<h2>Calendar</h2>
                
                <!--Εμφάνιση του στοιχείου Calendar -->
                <div id="embeddedExample" style="">
                    <div id="embeddedCalendar" style="margin-left: auto; margin-right: auto"></div>
                    <br />  
                </div>

                <!--Εμφάνιση της ημερομηνίας και της ώρας (σε real-time μορφή) με κλήση αντίστοιχου javascript-->
                <div style="color:tomato;" align="center"><i><b>
                    <span id="date_time"></span>
                    <script type="text/javascript">window.onload = date_time('date_time');</script></b></i>
                </div>

	</div>
        </div>
	
	<div id="footer">
            <a>Copyright ©$uperBank 2012 | Design: Boumpoukiotis & Spyropoulos & Marantos co.  </a>
	</div>


    </div>
        
        <!--Ορισμός μέγιστου χρονικού διαστήματος ισχύος του session κατά το οποίο έχει γίνει αναγνώριση του χρήστη -->
        <%session.setMaxInactiveInterval(300);%>
        </body>
</html>

