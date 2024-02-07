<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>
            Register
        </title>
        <link rel="stylesheet" type="text/css" href="css/register.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body style="background-color:skyblue">
        <div class="logindiv container">
            <div class="login-form">
            <h2>Register</h2>
            <div class="row">
                <div class="col-md-4">
                    <form>
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
        </div>
        </div>
    </body>
</html>