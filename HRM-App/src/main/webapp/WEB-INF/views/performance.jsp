<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Score" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Performance</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/performancestyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <div id="ent" class="perf container">
                <h2>Performance</h2>
                <form action="/performance" method="get">
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="Emp Id" name="empId" required><br>
                            <input id="submitBtn" type="submit" value="Get Report">
   			                <canvas id="examScoresChart" width="10%" height="10%"></canvas>
                        </div><br>
                        <% if (request.getAttribute("msg") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("msg") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                            </div>
                        <% } %>
                </form>
            </div>
        </main>
    </div>
    <script>
            let marks = [];
            <% List<Score> dataList = (List<Score>)request.getAttribute("dataList");
               String empId = request.getParameter("empId");
               boolean formSubmitted = empId != null;
               if (formSubmitted && dataList != null && !dataList.isEmpty()) {
                   for (Score s : dataList) { %>
                       marks.push(<%= s.getScore() %>);
                   <% } %>
                var examScores = {
                    labels: ['Exam 1', 'Exam 2', 'Exam 3', 'Exam 4', 'Exam 5'],
                    datasets: [{
                        label: 'Scores',
                        data: marks
                    }]
                };
                var canvas = document.getElementById('examScoresChart').getContext('2d');
                var examScoresChart = new Chart(canvas, {
                    type: 'bar',
                    data: examScores,
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
                const container = document.getElementById('ent');
                 container.style.transform = 'translateY(-18%)';
            <% } %>
        </script>
</body>
</html>