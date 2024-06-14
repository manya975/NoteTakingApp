package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	//this is made static so that can be called inside static method
	public static SessionFactory factory;
	
	//made static so that object of this need not to be made
	public static SessionFactory getFactory() {
		
		if(factory == null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}		
		return factory;		
	}
	public static void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
}
