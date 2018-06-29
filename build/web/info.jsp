<!--Σελίδα (του "διαχειριστή_δανείου") εμφάνισης εγκεκριμένων αιτήσεων προς ενημέρωση των πελατών-->
<%-- 
    Document   : showApplicationsForSuggestions
    Created on : Dec 12, 2012, 8:58:13 PM
    Author     : boumpoukiotis
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <title>$uperBank - Loan admin - Inform customers</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">

        <!--Σύνδεση με το χρησιμοποιούμενο css-->
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>

        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
        <link rel="stylesheet" href="stylesheets/calendarview.css">

        <!--Κλήση javascript για τις λειτουργίες χρήστη-->
        <script type="text/javascript" src="javascripts/manager.js"></script>

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
            //if (session.getAttribute("sUserID") == null || session.getAttribute("sUserID") == "") {
            //       response.sendRedirect("login.jsp");
            //  }
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
                    <h2>INFORM CUSTOMERS</h2>
                    <strong style="color:yellowgreen;">Accepted requests</strong>    
                    </br>
                    <p>To inform a customer  first check one of them in the list below and then choose an option of the table</p>

                    <div align="center" id="center"  >
                        <%
                            String msg = "";
                            String connectionURL =
                                    "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";
                            try {


                                Connection connection = null;
                                Statement statement = null;
                                ResultSet rs = null;
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL);
                                statement = connection.createStatement();

                                rs = statement.executeQuery("SELECT a.application_id,c.name,c.vat,c.phone FROM application a JOIN customer c ON a.customer_id=c.customer_id WHERE a.status <> '" + 1 + "' and a.status <>'" + 0 + "';");

                                int i = 0;


                        %>


                        <TABLE id="table" class="table1" style=" font-size: 10px">
                            <TR style=" color: #000000"  >

                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">S/N</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Customer Name</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Vat</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Phone</TD>




                            </TR>


                            <%
                                while (rs.next()) {
                                    //  String docum = rs.getString(8);

                            %>
                            <TR  id="id_tablerow_<%=i%>" style=" border-color: #000000;"     onmouseover="TableRow.onmouseover(this,<%=i%> );"      onmouseout="TableRow.onmouseout(this,<%=i%>);"  onclick=" document.getElementById('hi').style.display='none';TableRow.onclick(this, <%=i%>); 
                                var content=document.getElementById('id_tablerow_'+<%=i%>).getElementsByTagName('TD');
                                document.getElementById('cust').innerHTML=content[1].innerHTML;document.getElementById('phone').innerHTML=content[3].innerHTML;document.getElementById('appl').innerHTML=content[0].innerHTML;" >


                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(1)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getString(2)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(3)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getString(4)%></TD>
                            </TR>


                            <% i++;
                                }
                                rs = statement.executeQuery("select COUNT(*) from application where status <>'" + 0 + "' and status <>'" + 1 + "'");
                                rs.next();
                                // out.println(rs.getInt(1));

                                int j = rs.getInt(1);
                                if (j == 0) {

                                    msg = "0";
                                }

                                rs.close();
                                statement.close();
                                connection.close();

                            %>

                            <%   } catch (Exception ex) {
                                    out.println("Unable to connect to database.");
                                }

                            %>






                        </TABLE>

                    </div>
                    <div class="myform" id="stylized"  >
                        <p>Customers' personal information</p>
                        <label>Application id: </label><label id="appl"></label>
                        <br><br>
                        <label>Customer's name: </label><label id="cust"></label>
                        <br><br>
                        <label>Phone: </label><label id="phone"></label>
                        <br><br>
                        
                    </div>


                    <div id="hi" class="myerror">Before call a customer you must select one of them! </div>



                    <%if (msg.compareTo("0") == 0) {%>
                    <script> document.getElementById("form").style.display="none";document.getElementById("center").style.display="none";</script>
                    <%


                        out.println("<div id='hi2' class='myinfo'>" + "There aren't any accepted requests !" + "</div>");
                    %> 

                    <%


                        }%>
                 








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
</body>
</html>

