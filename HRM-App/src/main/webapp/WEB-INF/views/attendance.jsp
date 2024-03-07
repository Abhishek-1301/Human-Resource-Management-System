<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/attendancestyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script>
        function getattendance(){
            const type=document.getElementById('attendance_type').value;
            const range=document.getElementById('date_range');
            const specific=document.getElementById('specific_date');
            if(type=='range'){
                range.style.display='block';
                specific.style.display='none';
            }
            else if(type=='specific'){
                specific.style.display='block';
                range.style.display='none';
            }
            else{
                specific.style.display='none';
                range.style.display='none';
            }
        }
    </script>
</head>
<body background="/images/bg.jpeg">
    <section class="sidebar">
        <div class="card1">
            <img src="/images/hrmlogo.png">
        </div>
        <div class="card2">
            <% if ("hr".equals(session.getAttribute("role"))) { %>
                <jsp:include page="/WEB-INF/views/sidebar.jsp" />
            <% } else { %>
                <jsp:include page="/WEB-INF/views/employeeSidebar.jsp" />
            <% } %>
        </div>
    </section>
    <header class="header">
    </header>
    <main class="main">
        <div class="attform container">
            <h2>Employee Attendance</h2>
            <form id="myForm" action="/attendance" method="get">
                    <div class="entire_form">
                        <% if ("hr".equals(session.getAttribute("role"))) { %>
                            <label>Employee id<span>*</span>:</label>
                            <input type="Emp Id" name="empId"><br>
                        <% } %>
                        <div id="att_type">
                            <label>Attendance type<span>*</span>:</label>
                            <select id='attendance_type' name="type" onchange="getattendance()" required>
                                <option value="" selected disabled>Select type</option>
                                <option value="overall">Overall Attendance</option>
                                <option value="specific">Specific Date</option>
                                <option value="range">Date Range</option>
                            </select><br>
                        </div>
                        <div id="date_range" style="display: none;">
                            <label>From:</label>
                            <input type="date" name="date1">
                            <label>To:</label>
                            <input type="date" name="date2"><br>
                        </div>
                        <div id="specific_date" style="display: none;">
                            <label>Date:</label>
                            <input type="date" name="date"><br>
                        </div>
                        <input type="submit" value="Get Attendance">
                    </div><br>
                    <% if (request.getAttribute("percentage") != null) { %>
                        <div class="alert alert-success" role="alert">
                            <p>Percentage: <%= request.getAttribute("percentage") %>%</p>
                        </div>
                    <% } if (request.getAttribute("msg") != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= request.getAttribute("msg") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                        </div>
                    <% }  if (request.getAttribute("att") != null) { %>
                        <div class="alert alert-success" role="alert">
                            <%= request.getAttribute("att") %> <i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
                        </div>
                    <% } %>
            </form>
        </div>
    </main>
</body>
</html>