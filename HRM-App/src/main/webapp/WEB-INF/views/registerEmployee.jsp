<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>
    <link rel="stylesheet" type="text/css" href="/css/registerEmployeeStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <% if (request.getAttribute("msg") != null) { %>
            <div class="alert alert-success" role="alert">
                <%= request.getAttribute("msg") %><i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
            </div>
        <% } %>
        <div class="reg container">
            <div class="left-column">
                <h3>Personal Details</h3>
                <form action="/registerEmp" method="post">
                    <div class="first">
                        <label>First Name<span>*</span>:</label><br>
                        <input type="text" name="firstName" required><br><br>
                        <label>Middle Name:</label><br>
                        <input type="text" name="middleName"><br><br>
                        <label>Last Name<span>*</span>:</label><br>
                        <input type="text" name="lastName" required><br><br>
                        <table cellspacing="10" cellpadding="10">
                            <tr>
                                <td><label>Date of Birth<span>*</span>:</label></td>
                                <td><input type="date" name="dob" required></td></tr>
                                <tr><td><label>Gender<span>*</span>:</label></td>
                                <td><input type="radio" name="gender" value="Male"> Male
                                <input type="radio" name="gender" value="Female"> Female</td>
                            </tr>
                        </table><br>
                        <label>Mobile number<span>*</span>:</label>
                        <input type="text" id="mobileNumber" name="mobileNumber" required><br>
                    </div>
            </div>
            <div class="right-column">
                <h3>Employee Details</h3>
                <div class="second">
                    <table cellspacing="15" cellpadding="15">
                        <tr>
                            <td><label>Email Id<span>*</span>:</label></td>
                            <td><input type="email" name="email"required></td>
                        </tr>
                        <tr>
                            <td><label>Date of Joining<span>*</span>:</label></td>
                            <td><input type="date" name="doj" required>
                        </td>
                        </tr>
                        <tr>
                            <td><label>Select Qualification<span>*</span>:</label></td>
                            <td><select name="qualification" required>
                                <option value="" selected disabled>Select Qualification</option>
                                <option value="B.Tech">B.Tech</option>
                                <option value="B.Sc.">B.Sc.</option>
                                <option value="B.A">BA</option>
                                <option value="BBA">BBA</option>
                                <option value="BCA">BCA</option>
                                <option value="B.Com">B.Com</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Select Specialization<span>*</span>:</label></td>
                            <td><select name="branch" required>
                                <option value="" selected disabled>Select Specialization</option>
                                <option value="CSE">CSE</option>
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="EEE">EEE</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Select Designation<span>*</span>:</label></td>
                            <td><select name="designation" required>
                                <option value="" selected disabled>Select Designation</option>
                                <option value="Software Engineer">Software Engineer</option>
                                <option value="Data Analyst">Data Analyst</option>
                                <option value="Cloud Engineer">Cloud Engineer</option>
                                <option value="Graphic Designer">Graphic Designer</option>
                                <option value="Human Resources Manager">Human Resources Manager</option>
                                <option value="Sales Representative">Sales Representative</option>
                                <option value="Project Manager">Project Manager</option>
                                <option value="Web Developer">Web Developer</option>
                                <option value="Operations Manager">Operations Manager</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Salary<span>*</span>:</label></td>
                            <td><input type="number" name="salary" required></td>
                        </tr>
                    </table><br><br>
                </div>
                    <input type="submit" value="Register">
                </form>
            </div>
            </div>
    </main>
</body>
</html>