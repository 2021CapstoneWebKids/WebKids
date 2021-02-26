package Scheduler;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.stereotype.Component;

@Component
public class Online_Users {

	private ThreadPoolTaskScheduler scheduler;
	private String user_name;
	
	public void stopScheduler() {
		scheduler.shutdown();
	}
	
	public void startScheduler(String user_name) {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		this.user_name = user_name;
		// 동적 스케줄러 시작 부분
		scheduler.schedule(getRunnable() , getTrigger());
	}
	
	private Runnable getRunnable() {
		return () -> {
			// 동적스케줄러 기능
			System.out.println(new Date() + ",  " + user_name + "님 접속중 확인 완료");
		};
	}
	
	private Trigger getTrigger() {
		// 동적스케줄러 작업 주기 설정 트리거
		return new PeriodicTrigger(10, TimeUnit.SECONDS);
	}
}
