<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/style.css">
</head>
<body background="/images/bg.jpeg">
  <div class="box">
    <div class="section">
      <div class="container">
        <div class="row full-height justify-content-center">
          <div class="col-12 text-center align-self-center py-5">
            <div class="section pb-5 pt-5 pt-sm-2 text-center">
              <div class="mb-0 pb-3">
                <h6 style="position: relative;right: 70px;top: 78px;"><span>HR</span></h6>
                <h6 style="position: relative;left: 90px;top: 50px;"><span>EMPLOYEE</span></h6>
              </div>
              <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
              <label for="reg-log"></label>
              <div class="card-3d-wrap mx-auto">
                <div class="card-3d-wrapper">
                  <div class="card-front">
                    <div class="center-wrap">
                      <div class="section text-center">
                        <h4 class="mb-4 pb-3"> HR Login</h4>
                        <form action="/hr/dashboard" method="post">
                          <div class="form-group">
                            <input type="Username" class="form-style" name="username" placeholder="Username" required>
                            <i class="input-icon uil uil-user"></i>
                          </div>
                          <div class="form-group mt-2">
                            <input type="password" class="form-style" name="password" placeholder="Password" required>
                            <i class="input-icon uil uil-lock-alt"></i>
                          </div>
                          <button class="btn mt-4">Login</button>
                        </form>
                        <p class="mb-0 mt-4 text-center">Don't have an account? <a href="/register" title="Click to Register">Register</a></p>
                        <% if (request.getAttribute("msg1") != null) { %>
                          <div class="alert alert-danger" role="alert">
                              <%= request.getAttribute("msg1") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                          </div>
                        <% } %>
                      </div>
                    </div>
                  </div>
                  <div class="card-back">
                    <div class="center-wrap">
                      <div class="section text-center">
                        <h4 class="mb-3 pb-3"> Employee Login</h4>
                        <form action="/employee/dashboard" method="post">
                          <div class="form-group">
                            <input type="Emp Id" class="form-style" name="empId" placeholder="Emp Id" required>
                            <i class="input-icon uil uil-user"></i>
                          </div>
                          <div class="form-group mt-2">
                            <input type="password" class="form-style" name="password" placeholder="Password" required>
                            <i class="input-icon uil uil-lock-alt"></i>
                          </div>
                          <div class="form-group mt-2">
                            <button class="btn mt-4">Login</button>
                          </div>
                        </form>
                          <p class="mb-0 mt-4 text-center">Don't have an account? Contact HR</p>
                          <% if (request.getAttribute("msg2") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("msg2") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                            </div>
                          <% } %>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>