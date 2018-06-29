<!--Βασικό μενού επιλογών για χρήστη τύπου "διαχειριστής δανείου"-->
<%-- 
    Document   : managerMain
    Created on : Dec 5, 2012, 1:14:26 PM
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
        <title>$uperBank - Manager menu </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        
        <!--Σύνδεση με το χρησιμοποιούμενο css-->
        <LINK REL=StyleSheet HREF="css/style.css" TYPE="text/css" MEDIA=screen>
        
        
        
        <!--Κλήση javascript για τη λειτουργία της εμφανιζόμενης ημερομηνίας και ώρας-->
        <script type="text/javascript" src="javascripts/date_time.js"></script>
        <link rel="stylesheet" href="stylesheets/calendarview.css">
        
        <!--Κλήση javascript για τις λειτουργίες χρήστη-->
        <script type="text/javascript" src="javascripts/manager.js"></script>
        
        <%  //Scriptlet για την μεταβλητή εμφάνισης μηνυμάτων
            String msg = request.getParameter("msg");
            String msg1 = "";
            if (msg == null || msg == "null") {
                msg = "";
            }

        %>
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
            Event.observe(window, 'load', function() { resetall(); });
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
               if (session.getAttribute("sUserID") == null || session.getAttribute("sUserID") == "") {
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

                <a class="active" href="managerMain.jsp">Manager</a>
                <a href="myAccountManager.jsp">My Account</a>

            </div>

            <div id="mainarea">

                <div id="contentarea">
                    <h2>MAIN MENU</h2>
                    <strong style="color:yellowgreen;">Loan applications processing</strong>    
                    </br>
                    <p>To make an approval, a rejection or an update of one loan application, first check one of them in the list below and then choose an option of the table  </p>
                    <div align="center" id="center"  >
                        <%

                            String connectionURL =
                                    "jdbc:mysql://83.212.240.15:3306/it20919?user=it20919&password=boubou91";
                            try {


                                Connection connection = null;
                                Statement statement = null;
                                ResultSet rs = null;
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL);
                                statement = connection.createStatement();

                                rs = statement.executeQuery("SELECT a.application_id,c.name,c.vat,a.salary,a.loan_amount,a.loan_type,a.loan_time,a.documentation  FROM application a JOIN customer c ON a.customer_id=c.customer_id WHERE a.status <> '" + 0 + "' and a.status <>'" + 2 + "';");

                                int i = 0;
                        %>


                        <TABLE id="table" class="table1" style=" font-size: 10px">
                            <TR style=" color: #000000"  >

                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">S/N</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Customer Name</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Vat</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Salary</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Loan Amount</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Loan Type</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Loan Time</TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;">Documentation</TD>



                            </TR>


                            <%
                                while (rs.next()) {
                                    //  String docum = rs.getString(8);

                            %>
                            <TR  id="id_tablerow_<%=i%>" style=" border-color: #000000;"     onmouseover="TableRow.onmouseover(this,<%=i%> );"      onmouseout="TableRow.onmouseout(this,<%=i%>);"  onclick=" document.getElementById('hi').style.display='none';TableRow.onclick(this, <%=i%>); 
                                var content=document.getElementById('id_tablerow_'+<%=i%>).getElementsByTagName('TD'); take(content[0].innerHTML); take2(content[4].innerHTML);
                                changeText(content[4].innerHTML,'amount');
                                changeText(content[7].innerHTML,'amount1');
                                 " >


                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(1)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getString(2)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(3)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(4)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(5)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getString(6)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getInt(7)%></TD>
                                <TD style="color: #F0F8FF;cursor: pointer;padding: 10px; position: relative;"><%=rs.getString(8)%></TD>

                            </TR>


                            <% i++;
                                }
                                rs = statement.executeQuery("select COUNT(*) from application where status <>'" + 2 + "' and status <>'" + 0 + "'");
                                rs.next();
                                // out.println(rs.getInt(1));

                                int j = rs.getInt(1);
                                if (j == 0) {

                                    msg1 = "0";
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
                        <form id="form" name="form" method="post" onSubmit="return onsubmitform();">
                            <div id="selections">
                                <p>Select an application and then select one of the below selections.</p>
                                <div> <button id="submit" type="submit" value="Submit" onClick="document.pressed=this.value;" onMouseOver=" this.style.backgroundColor='#F0F8FF'; this.style.cursor='hand' " onMouseOut="this.style.cursor='pointer'; this.style.backgroundColor='#6F6F6F';" >approval</button></div>
                                <div> <button id="rejection" type="submit"  value="rejection" onClick="document.pressed=this.value" onMouseOver="this.style.cursor='hand'; this.style.backgroundColor='#F0F8FF'; " onMouseOut="this.style.cursor='pointer'; this.style.backgroundColor='#6F6F6F';" >rejection</button></div>
                                <div> <button id="Update" type="submit" value="update" onClick="document.pressed=this.value" onMouseOver="this.style.cursor='hand'; this.style.backgroundColor='#F0F8FF'; " onMouseOut="this.style.cursor='pointer'; this.style.backgroundColor='#6F6F6F';" >update</button></div>
                            </div>
                            <div id="update">


                                The amount of the loan: <br>
                                <input type="text" id="amount" class="amount" name="amount"  ><br>
                                <br>
                                <br><br>
                                The documentation of your update: <br>
                                <textarea name="amount2" rows="15" cols="50" id="amount1"></textarea><br><br>

                                <div><button type="submit" value="ok" onClick="document.pressed=this.value " onMouseOver="this.style.cursor='hand'; this.style.backgroundColor='#F0F8FF'; " onMouseOut="this.style.cursor='pointer';this.style.backgroundColor='#6F6F6F';">ok</button></div>
                                <div><button value="back" onClick="document.pressed=this.value;" onMouseOver="this.style.cursor='hand'; this.style.backgroundColor='#F0F8FF'; " onMouseOut="this.style.cursor='pointer';this.style.backgroundColor='#6F6F6F';">back</button></div>
                            </div>


                            <div id="hi" class="myerror">Before approve a request you must select an application! </div>
                            <div id="doc" class="myerror">Please note that fields  can't be blank!</div>
                            <div id="hi3" class="myerror">Please note that loan amount field must be only a number! </div>

                        </form>
                        <%
                            if (msg != "" || msg != null) {


                                if (msg.compareTo("1") == 0) {

                                    out.println("<div id='hi2' class='myinfo'>" + "The request approved successfully!" + "</div>");

                        %>
                        <script>startTimer(); </script>

                        <%


                        } else if (msg.compareTo("3") == 0) {
                            out.println("<div id='hi2' class='myerror'>" + "You don't have permission to reject this request. The requested amount is under loan limit for this customer!" + "</div>");
                        %>
                        <script>startTimer();</script>

                        <%
                        } else if (msg.compareTo("2") == 0) {
                            out.println("<div id='hi2' class='myinfo'>" + "The request rejected succesfully!" + "</div>");
                        %>
                        <script>startTimer();</script>

                        <%
                            }
                            if (msg1.compareTo("0") == 0) {%>
                        <script> document.getElementById("form").style.display="none";document.getElementById("center").style.display="none";</script>
                        <%


                            out.println("<div id='hi2' class='myinfo'>" + "There aren't any requests for processing!" + "</div>");
                        %> 

                        <%


                                }

                            }
                        %>

                    </div> 

                </div>

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



        <!--Ορισμός μέγιστου χρονικού διαστήματος ισχύος του session κατά το οποίο έχει γίνει αναγνώριση του χρήστη -->
        <%session.setMaxInactiveInterval(300);%>
        
    </body>
</html>
