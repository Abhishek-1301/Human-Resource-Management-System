<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Leave" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/hrLeaveStyle.css">
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
            <table>
                <thead>
                    <tr>
                        <th id="app">Leave Approval</th>
                        <th id="hist">Leave History</th>
                    </tr>
                </thead>
            </table>
            <div id="leave-approval">
                <%  List<Leave> d = (List<Leave>)request.getAttribute("d");
                    if (d != null && !d.isEmpty()) {
                        for (Leave l : d) { %>
                            <p>Employee Name: <%= l.getEmployee().getFirstName() %></p>
                            <p> Date: <%= l.getDate() %>
                                <a id="accept" href="/hrLeave?action=accept&id=<%= l.getId() %>" style="color: white;">Accept</a>
                                <a id="decline" href="/hrLeave?action=decline&id=<%= l.getId() %>" style="color: white;">Decline</a>
                            </p>
                            <p>Reason: <%= l.getReason() %></p>
                            <hr>
                    <%  }} else { %>
                        <p> No Leave Request. </p>
                    <% } %>
            </div>
            <div id="leave-history" style="display: none;">
                <form id="historyForm" action="/hrLeave" method="post">
                    <label>Employee id<span>*</span>:</label>
                    <input type="Emp id" name="empId" required><br>
                    <input type="submit" />
                    <%  List<Leave> h = (List<Leave>)request.getAttribute("history");
                        Integer empId=(Integer)request.getAttribute("empId");
                        boolean form = empId!=null;
                        if (form && h != null && !h.isEmpty()) {
                            for (Leave l : h) { %>
                                <p>Employee Name: <%= l.getEmployee().getFirstName() %> &emsp; Date: <%= l.getDate() %></p>
                                <p>Reason: <%= l.getReason() %></p>
                                <hr>
                        <%  }} else if(form) { %>
                            <p> No Records found. </p>
                        <% } %>
                </form>
            </div>
        </main>
    </div>
    <script>
        function toggleSection(sectionId) {
            const app=document.getElementById("leave-approval");
            const hist=document.getElementById("leave-history");
            const a=document.getElementById("app");
            const h=document.getElementById("hist");
            if(sectionId === 'Leave Approval'){
                app.style.display='block';
                hist.style.display='none';
                a.style.backgroundColor='skyblue';
                h.style.backgroundColor='rgb(94, 173, 204)';
            }
            else if(sectionId === 'Leave History'){
                app.style.display='none';
                hist.style.display='block';
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
                toggleSection('Leave Approval');
              }
              else if (index === 1) {
                toggleSection('Leave History');
              }
            });
          });
    </script>
</body>
</html>