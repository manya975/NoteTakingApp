<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page import="com.dao.NoteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoteTaker:All Notes</title>
<link rel = "Stylesheet" href = "css/style.css">
</head>
<body>

<div class="container">
    <%@ include file="navbar.jsp" %>
    <br>
    <h1 class="text-uppercase" style = "margin-left : 11rem;">All Notes:</h1>
    <div class="row">
        <div class="col-12">
        <%
        try {
            NoteDAO n = new NoteDAO();
            List<Note> l = n.getAllNotes();
            for (Note note : l) {
        %>
                <div class="card" style="width: 70rem; margin-top : 3px; margin-left : 11rem; margin-bottom : 1rem;background-color:rgb(240, 222, 194);">
	  <img class="card-img-top m-4" style = "max-width : 100px;margin-left : 30rem; margin-top : 1rem"src="img/note.png" alt="Card image cap">
	  <div class="card-body" style = "width:40rem;">
	    <h3 class="card-title"><%= note.getTitle() %></h3>
	    <p class="card-text"><h4><%= note.getContent() %></h4></p>
	    <p><b><%=note.getAddedDate() %></b></p>
	    <a href="DeleteServlet?note_id=<%= note.getId() %>" style = "color:orange; text-decoration:none; margin-left : 28rem; margin-bottom:1rem;">DELETE</a>
	    <a href="edit.jsp?note_id=<%= note.getId() %>" style = "color:orange; text-decoration:none; margin-left:3rem;margin-bottom:1rem;">UPDATE</a>
  </div>
</div>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
        </div>
    </div>
</div>
</body>
</html>
