<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
      <title>
        Login
      </title>
      <link rel="stylesheet" type="text/css" href="css/style.css">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body background="images/bg.jpeg">
        <div class="ld">
            <div class="login-form">
                <h2>Login</h2>
                <div class="row">
                    <div class="col-md-4">
                        <form action="/dashboard" method="post">
                            <label for="username"><b>Username<span>*</span>:</b></label>
                            <input class="form-control" type="text" id="username" name="username" required>
                            <label for="password"><b>Password<span>*</span>:</b></label>
                            <input class="form-control" type="password" id="password" name="password" required>
                            <input class="form-control" type="submit" value="Submit">
                        </form>
                    </div>
                    <p>Don't have an account? <a href="/register" title="Click to Register">Register</a></p>
                </div>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
            </div>
        </div>
    </body>
</html>