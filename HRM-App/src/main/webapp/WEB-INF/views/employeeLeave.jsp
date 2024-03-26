<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Leave" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/employeeLeaveStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body background="/images/bg.jpeg">
    <section class="sidebar">
        <div class="card1">
            <img src="/images/hrmlogo.png">
        </div>
        <div class="card2">
            <jsp:include page="/WEB-INF/views/employeeSidebar.jsp" />
        </div>
    </section>
    <div class="headnbody">
        <main class="main">
            <table>
                <thead>
                  <tr>
                    <th id="req">Leave Request</th>
                    <th id="app">Approval Status</th>
                    <th id="hist">Leave History</th>
                  </tr>
                </thead>
            </table>
            <div id="leave-request">
                <form id="leaveForm" action="/employeeLeave" method="post">
                    <label>Leave Date<span>*</span>:</label>
                    <input type="date" id="date" name="date" required><br>
                    <label id="reason" for="reason">Reason<span>*</span>:</label>
                    <textarea name="reason" rows="4" required></textarea><br>
                    <input type="submit">
                </form>
            </div>
            <div id="leave-approval" style="display: none;">
                <%  List<Leave> h = (List<Leave>)request.getAttribute("history");
                if (h != null && !h.isEmpty()) {
                    for (Leave l : h) {
                        if(l.getApproved()==1){ %>
                            <p>Your request on <%= l.getDate() %> is accepted.</p>
                            <hr>
                        <% } else if(l.getApproved()==2) { %>
                            <p>Your request on <%= l.getDate() %> is declined.</p>
                            <hr>
                        <% } else { %>
                            <p>Your request on <%= l.getDate() %> is in progress.</p>
                            <hr>
                        <% } %>
                    <% } %>
                <% } else { %>
                    <p> No Records found. </p>
                <% } %>
            </div>
            <div id="leave-history" style="display: none;">
                <%  if (h != null && !h.isEmpty()) {
                        for (Leave l : h) { %>
                            <p>Date: <%= l.getDate() %> &emsp; Reason: <%= l.getReason() %></p>
                            <hr>
                <%  }} else { %>
                    <p> No Records found. </p>
                <% } %>
            </div>
        </main>
    </div>
    <script>
        function toggleSection(sectionId) {
            const req=document.getElementById("leave-request");
            const app=document.getElementById("leave-approval");
            const hist=document.getElementById("leave-history");
            const r=document.getElementById("req");
            const a=document.getElementById("app");
            const h=document.getElementById("hist");
            if(sectionId === 'Leave Request'){
                req.style.display='block';
                app.style.display='none';
                hist.style.display='none';
                r.style.backgroundColor='skyblue';
                a.style.backgroundColor='rgb(94, 173, 204)';
                h.style.backgroundColor='rgb(94, 173, 204)';
            }
            else if(sectionId === 'Approval Status'){
                req.style.display='none';
                app.style.display='block';
                hist.style.display='none';
                r.style.backgroundColor='rgb(94, 173, 204)';
                a.style.backgroundColor='skyblue';
                h.style.backgroundColor='rgb(94, 173, 204)';
            }
            else if(sectionId === 'Leave History'){
                req.style.display='none';
                app.style.display='none';
                hist.style.display='block';
                r.style.backgroundColor='rgb(94, 173, 204)';
                h.style.backgroundColor='skyblue';
                a.style.backgroundColor='rgb(94, 173, 204)';
            }
        }
        const headers = document.querySelectorAll('table thead th');
          headers.forEach((header, index) => {
            header.addEventListener('click', () => {
              headers.forEach(h => h.classList.remove('active'));
              header.classList.add('active');
              if (index === 0) {
                  toggleSection('Leave Request');
              } else if (index === 1) {
                toggleSection('Approval Status');
              }
              else if (index === 2) {
                toggleSection('Leave History');
              }
            });
          });
    </script>
</body>
</html>