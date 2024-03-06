<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/registerstyle.css">
</head>
<body background="/images/bg.jpeg">
  <div class="box">
    <div class="section">
        <div class="container">
          <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
              <div class="section pb-5 pt-5 pt-sm-2 text-center">
                <div class="card-3d-wrap mx-auto">
                  <div class="card-3d-wrapper">
                    <div class="card-front">
                      <div class="center-wrap">
                        <div class="section text-center">
                          <h4 class="mb-4 pb-3"> HR Register</h4>
                          <form action="/" method="post">
                            <div class="form-group">
                              <input type="Username" class="form-style" name="username" placeholder="Username" required>
                              <i class="input-icon uil uil-user"></i>
                            </div>
                            <div class="form-group mt-2">
                              <input type="password" class="form-style" name="password" placeholder="Password" required>
                              <i class="input-icon uil uil-lock-alt"></i>
                            </div>
                            <div class="form-group mt-2">
                              <input type="password" class="form-style" name="cpassword" placeholder="Confirm Password" required>
                              <i class="input-icon uil uil-lock-alt"></i>
                            </div>
                            <button class="btn mt-4" >Register</button>
                          </form>
                          <p class="mb-0 mt-4 text-center">Already have an account! <a href="/" title="Click to Login">Login</a></p>
                          <% if (request.getAttribute("error1") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("error1") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                            </div>
                          <% } if (request.getAttribute("error2") != null) { %>
                              <div class="alert alert-danger" role="alert">
                                  <%= request.getAttribute("error2") %> <i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
                              </div>
                          <% } if (request.getAttribute("success") != null) { %>
                              <div class="alert alert-success" role="alert">
                                  <%= request.getAttribute("success") %> <i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
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