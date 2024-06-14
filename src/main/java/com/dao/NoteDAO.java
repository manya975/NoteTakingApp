package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Note;
import com.helper.FactoryProvider;

public class NoteDAO {
	public List<Note> getAllNotes(){
		Session s = null;
		List<Note> l = null;
		try {
			
			s = FactoryProvider.getFactory().openSession();
			Query<Note> q = s.createQuery("from Note",Note.class);
			l = q.list();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(s != null)
				s.close();
		}
		return l;
	}
}
