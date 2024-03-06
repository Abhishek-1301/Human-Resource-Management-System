<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboardstyle.css">
    <link rel="stylesheet" type="text/css" href="/css/feedbackstyle.css">
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
            <div class="feedback container">
                <h2>Feedback</h2>
                <form>
                        <div class="entire_form">
                            <label>Employee id<span>*</span>:</label>
                            <input type="Emp Id" required><br>
                            <div>
                                <label id="msg">Message<span>*</span>:</label>
                                <textarea></textarea>
                            </div>
                            <input type="submit" value="Send Feedback">
                        </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>