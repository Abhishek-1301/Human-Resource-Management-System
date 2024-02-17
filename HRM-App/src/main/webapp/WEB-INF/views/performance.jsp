<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Performance</title>
    <link rel="stylesheet" type="text/css" href="/css/performancestyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <div id="ent" class="perf container">
                <h2>Performance</h2>
                <form>
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="text" required><br>
                            <input id="submitBtn" type="submit" value="Get Report" onclick="getReport()">
   			                <canvas id="examScoresChart" width="10%" height="10%"></canvas>
                        </div>
                </form>
            </div>
        </main>
    </div>
<script>
        var getReport=()=>{
        var examScores = {
            labels: ['Exam 1', 'Exam 2', 'Exam 3', 'Exam 4', 'Exam 5'],
            datasets: [{
                label: 'Exam Scores',
                data: [44, 50, 64, 83, 95]
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
    }
    const container = document.getElementById('ent');
    const submitBtn = document.getElementById('submitBtn');
    submitBtn.addEventListener('click', () => {
      container.style.transform = 'translateY(-18%)';
    });
    </script>
</body>
</html>