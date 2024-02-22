<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruitment</title>
    <link rel="stylesheet" type="text/css" href="/css/recruitmentstyle.css">
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
        <table>
            <thead>
              <tr>
                <th>Resume Mining</th>
                <th>Candidate Screening</th>
                <th>Interview Scheduling</th>
                <th>Communicate Candidate</th>
              </tr>
            </thead>
        </table>
          <div id="candidateScreeningSection" class="section" style="display:none;">
            <h2>Candidate Screening</h2>
            <form>
              <label for="job-title">Job Title<span>*</span>:</label>
              <input type="text" id="job-title" name="job-title" required>
              <label for="skills">Skills<span>*</span>:</label>
              <input type="text" id="skills" name="skills" required>
              <label for="education">Education<span>*</span>:</label>
              <input type="text" id="education" name="education" required>
              <label for="experience">Experience<span>*</span>:</label>
              <input type="number" id="experience" name="experience" required>
              <button type="submit">Search</button>
            </form>
          </div>

          <div id="parsedDataSection" class="section" style="display:none;">
            <h2>Parsed Data</h2>
            <p>This is where the parsed data will be displayed.</p>
          </div>
          <div id="interviewSchedulingSection" class="section" style="display:none;">
            <h2>Interview Scheduling</h2>
        <form>
          <label for="candidate">Candidate<span>*</span>:</label><br>

          <input  type="text"  id="candidatesize" name="candidate" placeholder="Enter text here" required><br>
          <label for="interviewer">Interviewer<span>*</span>:</label><br>

          <input type="text" id="interviewersize" name="interviewer" placeholder="Enter text here" required><br>

          <label for="date">Date<span>*</span>:</label>
          <input type="date" id="date" name="date" required>
          <label for="time">Time<span>*</span>:</label>
          <input type="time" id="time" name="time" required>
          <button type="submit">Schedule Interview</button>
        </form>
          </div>
          <div id="communicationToolsSection" class="section" style="display:none;">
            <h2>Communicate Candidate</h2>
                <form>
                <label for="candidate-email">Candidate Email<span>*</span>:</label>
                <input type="email" id="candidate-email" name="candidate-email" required>
                <label for="message">Message<span>*</span>:</label>
                <textarea id="message" name="message" required></textarea>
                <button type="submit">Send Message</button>
                </form>
          </div>
    </main>
    <script>
        function toggleSection(sectionId) {
            const candidateScreeningSection = document.getElementById('candidateScreeningSection');
            const parsedDataSection = document.getElementById('parsedDataSection');
            const interviewSchedulingSection = document.getElementById('interviewSchedulingSection');
            const communicationToolsSection = document.getElementById('communicationToolsSection');

            if (sectionId === 'candidate screening') {
              candidateScreeningSection.style.display = 'block';
              parsedDataSection.style.display = 'none';
              interviewSchedulingSection.style.display = 'none';
              communicationToolsSection.style.display = 'none';
            } else if (sectionId === 'parsed data') {
              candidateScreeningSection.style.display = 'none';
              parsedDataSection.style.display = 'block';
              interviewSchedulingSection.style.display = 'none';
              communicationToolsSection.style.display = 'none';
            } else if (sectionId === 'interview scheduling') {
              candidateScreeningSection.style.display = 'none';
              parsedDataSection.style.display = 'none';
              interviewSchedulingSection.style.display = 'block';
              communicationToolsSection.style.display = 'none';
            } else if (sectionId === 'communication tools') {
              candidateScreeningSection.style.display = 'none';
              parsedDataSection.style.display = 'none';
              interviewSchedulingSection.style.display = 'none';
              communicationToolsSection.style.display = 'block';
            }
          }

          const headers = document.querySelectorAll('table thead th');
          headers.forEach((header, index) => {
            header.addEventListener('click', () => {
              headers.forEach(h => h.classList.remove('active'));
              header.classList.add('active');

              if (index === 0) {
                toggleSection('parsed data');
              } else if (index === 1) {
                toggleSection('candidate screening');
              } else if (index === 2) {
                toggleSection('interview scheduling');
              } else if (index === 3) {
                toggleSection('communication tools');
              }
            });
          });
    </script>
</body>
</html>