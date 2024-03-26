<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Fresher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruitment</title>
    <link rel="stylesheet" type="text/css" href="/css/recruitmentstyle.css">
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
        <table>
            <thead>
              <tr>
                <th id="cand">Candidate Screening</th>
                <th id="int">Interview Scheduling</th>
              </tr>
            </thead>
        </table>
          <div id="candidateScreeningSection" class="section">
              <form action="/recruitment" method="get">
                <label for="job-title">Job Title<span>*</span>:</label>
                <input type="text" id="job-title" name="job_title" required>
                <label for="skills">Skills<span>*</span>:</label>
                <input type="text" id="skills" name="skills" required>
                <label for="education">Education<span>*</span>:</label>
                <input type="text" id="education" name="education" required>
                <label for="experience">Experience<span>*</span>:</label>
                <input type="number" id="experience" name="experience" required>
                <input type="submit" value="Search"><br><br>
              <%  List<Fresher> dataList = (List<Fresher>)request.getAttribute("dataList");
                  String job_title = request.getParameter("job_title");
                  String skills = request.getParameter("skills");
                  String education = request.getParameter("education");
                  String experience = request.getParameter("experience");
              boolean formSubmitted = job_title != null && skills != null && education != null && experience != null;
               if (formSubmitted && dataList != null && !dataList.isEmpty()) { %>
                 <div class="filter">
                    <table>
                        <thead>
                            <tr>
                              <th id="cs">Candidate Email</th>
                              <th id="cs">Job Title</th>
                              <th id="cs">Skills</th>
                              <th id="cs">Education</th>
                              <th id="cs">Experience</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  for (Fresher f : dataList) { %>
                            <tr>
                                <td><%= f.getEmail() %></td>
                                <td><%= f.getJobTitle() %></td>
                                <td><%= f.getSkills() %></td>
                                <td><%= f.getEducation() %></td>
                                <td><%= f.getExperience() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                 </div>
               <% } else if (formSubmitted) { %>
                 <div class="alert alert-danger" role="alert">
                     <p>No candidates matched <i class="fa fa-times-circle" style="font-size:20px;color:red"></i></p>
                 </div>
               <% } %>
            </form>
          </div>
          <div id="interviewSchedulingSection" class="section" style="display:none;">
              <form action="/recruitment" method="post">
                <label for="candidate">Candidate<span>*</span>:</label><br>
                <input  type="text"  id="candidatesize" name="candidate" required><br>
                <label for="candidate">Candidate Email<span>*</span>:</label><br>
                <input  type="text"  id="candidatesize" name="candidateEmail" required><br>
                <label for="interviewer">Interviewer<span>*</span>:</label><br>
                <input type="text" id="interviewersize" name="interviewer" required><br>
                <label for="date">Date<span>*</span>:</label>
                <input type="date" id="date" name="scheduleDate" required>
                <label for="time">Time<span>*</span>:</label>
                <input type="time" id="time" name="scheduleTime" required><br><br>
                <input type="submit" id="si" value="Schedule Interview">
                <% if (request.getAttribute("msg") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <p><%= request.getAttribute("msg") %> <i class="fa fa-check-circle" style="font-size:20px;color:green"></i></p>
                    </div>
                <% } %>
              </form>
            </div>
    </main>
    <script>
        function toggleSection(sectionId) {
            const candidateScreeningSection = document.getElementById('candidateScreeningSection');
            const interviewSchedulingSection = document.getElementById('interviewSchedulingSection');
            const cand=document.getElementById('cand');
            const int=document.getElementById('int');
            if (sectionId === 'interview scheduling') {
              candidateScreeningSection.style.display = 'none';
              interviewSchedulingSection.style.display = 'block';
              cand.style.backgroundColor='rgb(94, 173, 204)';
              int.style.backgroundColor='skyblue';
            }else if (sectionId === 'candidate screening') {
               candidateScreeningSection.style.display = 'block';
               interviewSchedulingSection.style.display = 'none';
               cand.style.backgroundColor='skyblue';
               int.style.backgroundColor='rgb(94, 173, 204)';
             }
          }

          const headers = document.querySelectorAll('table thead th');
          headers.forEach((header, index) => {
            header.addEventListener('click', () => {
              headers.forEach(h => h.classList.remove('active'));
              header.classList.add('active');
              if (index === 0) {
                  toggleSection('candidate screening');
              } else if (index === 1) {
                toggleSection('interview scheduling');
              }
            });
          });
    </script>
</body>
</html>