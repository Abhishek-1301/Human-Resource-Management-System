<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training & Development</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/trainndevelopstyle.css">
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
    <div class="headnbody">
        <main class="main">
            <div class="train container">
                <h2>Training and Development</h2>
                <form action="/trainndevelop" method="post">
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="Emp Id" name="empId" required><br>
                            <div id="month">
                                <label>Select Course<span>*</span>:</label>
                                <select name="course" required>
                                <option value="" selected disabled>Select Course</option>
                                    <option value="Object Oriented Programming">Object Oriented Programming</option>
                                    <option value="Data Structures & Algorithms">Data Structures & Algorithms</option>
                                    <option value="Software Development Life Cycle">Software Development Life Cycle</option>
                                    <option value="Operating System">Operating System</option>
                                    <option value="Computer Networks">Computer Networks</option>
                                    <option value="Artificial Intelligence">Artificial Intelligence</option>
                                    <option value="Machine Learning">Machine Learning</option>
                                    <option value="Database Management System">Database Management System</option>
                                    <option value="Data Science">Data Science</option>
                                    <option value="Cyber Security">Cyber Security</option>
                                    <option value="Cloud Computing">Cloud Computing</option>
                                    <option value="Software Testing">Software Testing</option>
                                </select><br>
                            </div>
                            <input type="submit" value="Assign course">
                        </div><br>
                        <% if (request.getAttribute("msg") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("msg") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                            </div>
                        <% } if (request.getAttribute("success") != null) { %>
                            <div class="alert alert-success" id="a" role="alert">
                                <%= request.getAttribute("success") %> <i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
                            </div>
                        <% } %>
                </form>
            </div>
        </main>
    </div>
</body>
</html>