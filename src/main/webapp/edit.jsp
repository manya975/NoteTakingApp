<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <%
    // Initialize noteId
    Integer noteId = null;
    try {
        // Get the note ID from the request parameter
        String noteIdParam = request.getParameter("note_id");
        if (noteIdParam != null && !noteIdParam.isEmpty()) {
            noteId = Integer.parseInt(noteIdParam.trim());
        }
    } catch (NumberFormatException e) {
        // Handle invalid or missing note_id parameter
        e.printStackTrace();
    }
    
    Note note = null;
    if (noteId != null) {
        // Open a Hibernate session and fetch the note
        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();
        note = (Note) s.get(Note.class, noteId);
        tx.commit();
        s.close();
    }
    %>
    <div class="formhelp">
        <h1>Please update your note details....</h1>
        <div class="add_note">
            <% if (note != null) { %>
            <form action="UpdateServlet" method="post">
                <input type="hidden" name="noteId" value="<%= note.getId() %>">
                <br>
                <h4>Note Title</h4>
                <input type="text" placeholder="Enter here" value="<%= note.getTitle() %>" class="addtitle" name="addtitle" required/>
                <br/>
                <br>
                <h4>Note Content</h4>
                <textarea placeholder="Enter Your Content Here" class="content" name="addcontent" required><%= note.getContent() %></textarea><br>
                <input type="submit" class="addbtn" style="width: 12rem;" value="Save Your Note" />
            </form>
            <% } else { %>
            <p>Note not found or invalid note ID.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
