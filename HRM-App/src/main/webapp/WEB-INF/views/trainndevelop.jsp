<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training & Development</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/trainndevelopstyle.css">
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
                <form>
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="text" required><br>
                            <div id="month">
                                <label>Select Course<span>*</span>:</label>
                                <select required>
                                    <option>Object Oriented Programming</option>
                                    <option>Data Structures & Algorithms</option>
                                    <option>Software Development Life Cycle</option>
                                    <option>Operating System</option>
                                    <option>Computer Networks</option>
                                    <option>Artificial Intelligence</option>
                                    <option>Machine Learning</option>
                                    <option>Database Management System</option>
                                    <option>Data Science</option>
                                    <option>Cyber Security</option>
                                    <option>Cloud Computing</option>
                                    <option>Software Testing</option>
                                </select><br>
                            </div>
                            <input type="submit" value="Assign course">
                        </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>