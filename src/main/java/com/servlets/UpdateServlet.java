package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noteId = Integer.parseInt(request.getParameter("noteId").trim());
            String title = request.getParameter("addtitle");
            String content = request.getParameter("addcontent");

            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            
            Note note = (Note) s.get(Note.class, noteId);
            note.setTitle(title);
            note.setContent(content);

            tx.commit();
            s.close();
            response.sendRedirect("all_notes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
