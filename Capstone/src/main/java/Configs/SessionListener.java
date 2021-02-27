package Configs;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import DataBase.JDBC_Repository_Main;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class SessionListener implements HttpSessionListener{

	@Autowired
	private JDBC_Repository_Main jdbc;
	
	public static SessionListener sessionListener = null;
    
	private String id = null;
	
	public static synchronized SessionListener getInstance() {
        if(sessionListener == null) {
            sessionListener = new SessionListener();
        }
        return sessionListener;
    }
	
	  /**
     * session.setAttribute 실행 되는 순간 같은 sessionId 일경우 1회만 실행
     * @param httpSessionEvent
     */
	@Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
		id = (String) httpSessionEvent.getSession().getAttribute("ID");
		System.out.println("[SYSTEM] Session Created : " + id);
    }

	/**
     * session 이 소멸되는 시점에 실행, 기본 단위는 초(1분 미만은 설정할 수 없음)
     * @param httpSessionEvent
     */
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
    	
    	id = (String) httpSessionEvent.getSession().getAttribute("ID");
    	
    	System.out.println("[SYSTEM] Session Destroyed : " + id);
    	
    	jdbc.Delete_Online_User(id);
    }
    

}
