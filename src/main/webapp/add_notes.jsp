<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class = "formhelp">
	<h1>Please fill your note details....</h1>
	<div class = "add_note">
	<form action = "saveNote" method = "post">
		<br>
		<h4>Note Title</h4>
		<input type = "text" placeholder = "Enter here" class = "addtitle" name = "addtitle" required/>
		<br/>
		<br>
		<h4>Note Content</h4>
		<textarea placeholder = "Enter Your Content Here" class = "content" name = "addcontent" required></textarea><br>
	<input type = "submit" class = "addbtn" value = "Add" />
	</form>
	</div>
	</div>
</body>
</html>