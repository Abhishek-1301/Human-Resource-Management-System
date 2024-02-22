<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/registerEmployeeStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body background="/images/bg.jpeg">
    <section class="sidebar">
        <div class="card1">
            <img src="/images/hrmlogo.png">
        </div>
        <div class="card2">
            <jsp:include page="/WEB-INF/views/sidebar.jsp" />
        </div>
    </section>
    <main class="main">
        <div class="register">
            <div class="reg container">
                <h2>Register Employee</h2>
                <form>
                        <div class="entire_form">
                            <label>First Name<span>*</span>:</label>
                            <input type="text" name="fname" required><br>
                            <label>Middle Name:</label>
                            <input type="text" name="mname"><br>
                            <label>Last Name<span>*</span>:</label>
                            <input type="text" name="lname" required><br><br>
                            <label>Gender<span>*</span>:</label>
                            <input type="radio" name="gender" value="female" required> Male
                            <input type="radio" name="gender" value="female" required> Female<br>
                            <label>DOB<span>*</span>:</label>
                            <input type="date" name="dob" required><br>
                            <label>Mobile Number<span>*</span>:</label>
                            <input type="text" required><br>
                            <label>Employee id<span>*</span>:</label>
                            <input type="text" required><br>
                            <label>Employee email<span>*</span>:</label>
                            <input type="email" required><br><br>
                            <input type="submit">
                        </div>
                </form>
            </div>
        </div>
    </main>
</body>
</html>