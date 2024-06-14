package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//title,content fetch
			String title = request.getParameter("addtitle");
			String content = request.getParameter("addcontent");
			Note note = new Note(title,content,new Date());
			
			//hibernate : save()
			Session s = FactoryProvider.getFactory().openSession();
			//for permanently saving data in db use transaction of hibernate
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			
			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print("<body style = 'background-color : blanchedalmond;'>");
			out.print("<h1 style = 'text-align : center;'>Note is added successfully....</h1>");
			out.print("<h2 style = 'text-align : center;'><a href = 'all_notes.jsp'>View all notes..</a></h2>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
