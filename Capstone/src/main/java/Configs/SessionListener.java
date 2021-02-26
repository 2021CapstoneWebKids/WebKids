package Configs;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import DataBase.JDBC_Repository_Main;

public class SessionListener implements HttpSessionListener{

	@Autowired
	private JDBC_Repository_Main jdbc;
	
	private String id = null;
	
	public void sessionCreated(HttpServletRequest req) {
		HttpSession session = req.getSession();
		id = (String) session.getAttribute("ID");
		System.out.println("[SYSTEM] Session Created : " + id + "\n");
		session.setMaxInactiveInterval(1*60);
		
	}

    public void sessionDestroyed(HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	System.out.println("[SYSTEM] Session Destroyed : " + id + "\n");
    	jdbc.Delete_Online_User(id);
    }
}
