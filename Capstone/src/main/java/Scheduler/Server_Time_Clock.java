package Scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import DataBase.JDBC_Repository_Server;

@EnableScheduling
@Component
public class Server_Time_Clock {

	@Autowired
	private JDBC_Repository_Server db_rep;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void autoUpdate() {
		//매일 00:00:00에 호출 , 고정 시각 스케줄러
		db_rep.update_server_clock();
		System.out.println("서버 시간이 업데이트 되었습니다.\n");
	}
	
	
	
	
}
