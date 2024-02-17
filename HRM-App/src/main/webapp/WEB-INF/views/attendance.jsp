<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="/css/attendancestyle.css">
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
            <ul>
                <br><br><br>
                <a href="/dashboard"><li>Home</li><br></a>
                <a href="/dashboard/attendance"><li>Attendance</li><br></a>
                <a href="/dashboard/payrolls"><li>Pay Rolls</li><br></a>
                <a href="/dashboard/recruitment"><li>Recruitment</li><br></a>
                <a href="/dashboard/selection"><li>Selection</li><br></a>
                <a href="/dashboard/trainingndevelopment"><li>Training & Development</li><br></a>
                <a href="/dashboard/performance"><li>Performance</li><br></a>
                <a href="/dashboard/feedback"><li>Feedback</li><br></a>
                <a href="/"><li>Log out</li><br></a>
            </ul>
        </div>
    </section>
    <header class="header">
    </header>
    <main class="main">
        <div class="attform container">
            <h2>Employee Attendance</h2>
            <form>
                    <div class="entire_form">
                        <label>Employee id<span>*</span>:</label>
                        <input type="text" required><br>
                        <div id="att_type">
                            <label>Attendance type<span>*</span>:</label>
                            <select id='attendance_type' onchange="getattendance()" required>
                                <option>Overall Attendance</option>
                                <option value="specific">Specific Date</option>
                                <option value="range">Date Range</option>
                            </select><br>
                        </div>
                        <div id="date_range" style="display: none;">
                            <label>From<span>*</span>:</label>
                            <input type="date" required>
                            <label>To<span>*</span>:</label>
                            <input type="date" required><br>
                        </div>
                        <div id="specific_date" style="display: none;">
                            <label>Date<span>*</span>:</label>
                            <input type="date" required><br>
                        </div>
                        <input type="submit">
                    </div>
            </form>
        </div>
    </main>
</body>
</html>