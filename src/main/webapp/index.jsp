<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoteTaker</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-image: url('img/notetaker.jpg');
            background-size: cover; /* Ensures the image covers the entire page */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-attachment: fixed; /* Keeps the background image fixed in place when scrolling */
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <br>
    <marquee style = "color:white; font-size:1.5rem;"><b>WELCOME TO NOTE TAKER WEBSITE</b></marquee>
    <div class = "indexcontainer">
    	We are Creative for You....<br>
    </div>
    <div class = "contentindex">
    	!!!!Start making your note now with our website!!!!<br>
    </div>
    <%@include file = "footer.jsp" %>
</body>
</html>
