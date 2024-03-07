<%@ page import="com.example.demo.model.Salary" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Rolls</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/payrollstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body background="/images/bg.jpeg">
    <section class="sidebar">
        <div class="card1">
            <img src="/images/hrmlogo.png">
        </div>
        <div class="card2">
            <% if ("hr".equals(session.getAttribute("role"))) { %>
                <jsp:include page="/WEB-INF/views/sidebar.jsp" />
            <% } else { %>
                <jsp:include page="/WEB-INF/views/employeeSidebar.jsp" />
            <% } %>
        </div>
    </section>
    <div class="headnbody">
        <main class="main">
            <div class="payroll container">
                <h2>Employee Payroll</h2>
                <form action="/payrolls" method="get">
                        <div class="entire_form">
                            <% if ("hr".equals(session.getAttribute("role"))) { %>
                                <label>Employee id<span>*</span>:</label>
                                <input type="Emp Id" name="empId"><br>
                            <% } %>
                            <div id="month">
                                <label>Month<span>*</span>:</label>
                                <select required name="month">
                                    <option value="" selected disabled>Select Month</option>
                                    <option value="January">January</option>
                                    <option value="February">February</option>
                                    <option value="March">March</option>
                                    <option value="April">April</option>
                                    <option value="May">May</option>
                                    <option value="June">June</option>
                                    <option value="July">July</option>
                                    <option value="August">August</option>
                                    <option value="September">September</option>
                                    <option value="October">October</option>
                                    <option value="November">November</option>
                                    <option value="December">December</option>
                                </select><br>
                            </div>
                            <div id="year">
                                <label>Year<span>*</span>:</label>
                                <input type="number" name="year" required>
                            </div>
                            <input type="submit">
                        </div>
                <%  Object obj = request.getAttribute("salary");
                        boolean formSubmitted;
                        if ("hr".equals(session.getAttribute("role"))){
                            formSubmitted=request.getParameter("empId")!=null && request.getParameter("month")!=null && request.getParameter("year")!=null;
                        }
                        else {
                            formSubmitted=request.getParameter("month")!=null && request.getParameter("year")!=null;
                        }
                        if (formSubmitted && obj instanceof Salary) {
                            Salary s = (Salary) obj;  %>
                       <br>
                      <div class="details">
                          <p>
                              <span class="detail">Employee id: </span><%= request.getAttribute("empId") %>&nbsp;&nbsp;
                              <span class="detail">Month: </span><%= request.getAttribute("month") %>&nbsp;&nbsp;
                              <span class="detail">Year: </span><%= request.getAttribute("year") %>
                          </p>
                      </div>
                     <div class="result">
                         <div class="first">
                             <table cellspacing="10" cellpadding="10" border="1">
                                 <tr>
                                   <th>Basic Salary</th>
                                   <td><%= s.getBasicSalary() %></td>
                                 </tr>
                                 <tr>
                                     <th>HRA</th>
                                     <td><%= s.getHra() %></td>
                                 </tr>
                                 <tr>
                                     <th>Bonus</th>
                                     <td><%= s.getBonus() %></td>
                         </table>
                         </div>
                         <div class="second">
                             <table cellspacing="10" cellpadding="10" border="1">
                                 <tr>
                                     <th>Allowances</th>
                                     <td><%= s.getAllowances() %></td>
                                 </tr>
                                 <tr>
                                     <th>Deductions</th>
                                     <td><%= s.getDeductions() %></td>
                                 </tr>
                                 <tr>
                                     <th>Total Gross Salary</th>
                                     <td><%= s.getBasicSalary()+s.getHra()+s.getBonus()+s.getAllowances()-s.getDeductions() %></td>
                                 </tr>
                         </table>
                         </div>
                      </div>
                      <% } else if(formSubmitted) { %>
                          <div class="alert alert-danger" role="alert">
                              <%= request.getAttribute("msg") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                          </div>
                      <% } %>
                  </form>
            </div>
        </main>
    </div>
</body>
</html>