<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>
            Register
        </title>
        <link rel="stylesheet" type="text/css" href="/css/registerstyle.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body background="/images/bg.jpeg">
        <div class="ld">
            <div class="login-form">
            <h2>Register</h2>
            <div class="row">
                <div class="col-md-4">
                    <form action="/" method="post">
                        <label for="username"><b>Username<span>*</span>:</b></label>
                        <input class="form-control" type="text" id="username" name="username" required>
                        <label for="password"><b>Password<span>*</span>:</b></label>
                        <input class="form-control" type="password" id="password" name="password" required>
                        <label for="cpassword" id="cpassword"><b>Confirm Password<span>*</span>:</b></label>
                        <input class="form-control" type="password" id="cpassword" name="cpassword" required>
                        <input class="form-control" type="submit" value="Submit">
                    </form>
                </div>
                <p>Already have an account! <a href="/" title="Click to Login">Login</a></p>
            </div>
            <% if (request.getAttribute("error1") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error1") %>
                </div>
            <% } %>
            <% if (request.getAttribute("error2") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error2") %>
                </div>
            <% } %>
            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success" role="alert">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>
        </div>
        </div>
    </body>
</html>