<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Roll</title>
    <link rel="stylesheet" type="text/css" href="/css/payrollstyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
    <div class="headnbody">
        <main class="main">
            <div class="payroll container">
                <h2>Employee Payroll</h2>
                <form>
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="text" required><br>
                            <div id="month">
                                <label>Month<span>*</span>:</label>
                                <select required>
                                    <option>January</option>
                                    <option>February</option>
                                    <option>March</option>
                                    <option>April</option>
                                    <option>May</option>
                                    <option>June</option>
                                    <option>July</option>
                                    <option>August</option>
                                    <option>September</option>
                                    <option>October</option>
                                    <option>November</option>
                                    <option>December</option>
                                </select><br>
                            </div>
                            <div id="year">
                                <label>Year<span>*</span>:</label>
                                <input type="number">
                            </div>
                            <input type="submit">
                        </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>