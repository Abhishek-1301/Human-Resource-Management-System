<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selection</title>
    <link rel="stylesheet" type="text/css" href="/css/selectionstyle.css">
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
            <table id="main_table">
                <thead>
                  <tr>
                    <th id="m">Visited Colleges</th>
                    <th id="m">Unvisited Colleges</th>
                    <th id="m">Schedule Colleges</th>
                    <th id="m">Selection Statistics</th>
                  </tr>
                </thead>
            </table>
            <div id="visited" class="section" style="display:none;">
                <table id="total_table">
                    <thead>
                      <tr>
                        <th id="t">College Name</th>
                        <th id="t">Eligible Students</th>
                        <th id="t">Selected Students</th>
                        <th id="t">Date of Visit</th>
                      </tr>
                    </thead>
                    <tr>
                        <th id="t">AEC</th>
                        <th id="t">900</th>
                        <th id="t">200</th>
                        <th id="t">01-01-2024</th>
                      </tr>
                      <tr>
                        <th id="t">ACET</th>
                        <th id="t">800</th>
                        <th id="t">150</th>
                        <th id="t">15-08-2020</th>
                      </tr>
                </table>
            </div>
            <div id="unvisited" class="section" style="display:none;">
                <table id="total_table">
                    <thead>
                      <tr>
                        <th id="t">College Name</th>
                        <th id="t">Eligible Students</th>
                        <th id="t">Selected Students</th>
                        <th id="t">Expected Visit</th>
                      </tr>
                    </thead>
                    <tr>
                        <th id="t"><input type="checkbox">AEC</th>
                        <th id="t">900</th>
                        <th id="t"><input type="number"></th>
                        <th id="t">18-02-2024</th>
                      </tr>
                      <tr>
                        <th id="t"><input type="checkbox">ACET</th>
                        <th id="t">800</th>
                        <th id="t">-</th>
                        <th id="t">-</th>
                      </tr>
                </table>
            </div>
            <div id="scheduled" class="section" style="display:none;">
                <table id="total_table">
                    <thead>
                      <tr>
                        <th id="t">College Name</th>
                        <th id="t">Eligible Students</th>
                        <th id="t">Selected Students</th>
                        <th id="t">Schedule visit</th>
                      </tr>
                    </thead>
                    <tr>
                        <th id="t">AEC</th>
                        <th id="t">900</th>
                        <th id="t">-</th>
                        <th id="t"><input type="date"></th>
                      </tr>
                      <tr>
                        <th id="t">ACET</th>
                        <th id="t">800</th>
                        <th id="t">-</th>
                        <th id="t"><input type="date"></th>
                      </tr>
                </table>
            </div>
            <div id="statistics" class="section" style="display:none;">
                <table id="total_table">
                    <thead>
                      <tr>
                        <th id="t">College Name</th>
                        <th id="t">Eligible Students</th>
                        <th id="t">Selected Students<button</th>
                      </tr>
                    </thead>
                    <tr>
                        <th id="t">AEC</th>
                        <th id="t">900</th>
                        <th id="t">150</th>
                      </tr>
                </table>
            </div>
        </main>
    </div>
    <script>

        function toggleSection(sectionId) {
            const visited = document.getElementById('visited');
            const unvisited = document.getElementById('unvisited');
            const scheduled = document.getElementById('scheduled');
            const statistics = document.getElementById('statistics');

            if (sectionId === 'visited colleges') {
                visited.style.display = 'block';
                unvisited.style.display = 'none';
                scheduled.style.display = 'none';
                statistics.style.display = 'none';
            } else if (sectionId === 'unvisited colleges') {
                visited.style.display = 'none';
                unvisited.style.display = 'block';
                scheduled.style.display = 'none';
                statistics.style.display = 'none';
            } else if (sectionId === 'schedule colleges') {
                visited.style.display = 'none';
                unvisited.style.display = 'none';
                scheduled.style.display = 'block';
                statistics.style.display = 'none';
            } else if (sectionId === 'selection statistics') {
                visited.style.display = 'none';
                unvisited.style.display = 'none';
                scheduled.style.display = 'none';
                statistics.style.display = 'block';
            }
          }

          const headers = document.querySelectorAll('table thead th');
          headers.forEach((header, index) => {
            header.addEventListener('click', () => {
              headers.forEach(h => h.classList.remove('active'));
              header.classList.add('active');

              if (index === 0) {
                toggleSection('visited colleges');
              } else if (index === 1) {
                toggleSection('unvisited colleges');
              } else if (index === 2) {
                toggleSection('schedule colleges');
              } else if (index === 3) {
                toggleSection('selection statistics');
              }
            });
          });


      </script>
</body>
</html>