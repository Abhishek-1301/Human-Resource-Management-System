<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/dashboardstyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <header class="header">
        <h2>Welcome to HRMS Dashboard</h2>
    </header>
    <section class="sidebar">
        <div class="card1">
            <img src="images/hrmlogo.png">
        </div>
        <div class="card2">
            <ul>
                <br><br>
                <a href="/attendance"><li>Attendance</li><br></a>
                <a href="/payrolls"><li>Pay Rolls</li><br></a>
                <a href="/performance"><li>Performance</li><br></a>
                <a href="employeeengagements"><li>Employee Engagements</li><br></a>
                <a href="/recruitment"><li>Recruitment</li><br></a>
                <a href="/selection"><li>Selection</li><br></a>
                <a href="/trainingndevelopment"><li>Training & Development</li><br></a>
                <a href="/feedback"><li>Feedback</li><br></a>
                <a href="/"><li>Log out</li><br></a>
            </ul>
        </div>
    </section>
    <main class="main"></main>
</body>
</html>