package Scheduler;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import DataBase.JDBC_Repository_QR;

@EnableScheduling
@Component
public class QR_Create {

	@Autowired
	private JDBC_Repository_QR db_rep;
	
	
	// cron => 초 분 시 일 월 요일 연도
	// * 을 입력할경우 모두(항상)으로 설정함.
	/*.test
	 * CRON 표현식 초/분 = 0~59
	 * 			 시 = 0~23
	 * 			 일 = 1~31
	 * 			 월 = 1~12
	 * 			요일 = 0~6
	 *          연도 = 생략가능
	@Scheduled(cron = "0 14 14 * * *")
	public void autoUpdate() {
		//매일 오후 02:14:00에 호출
	}
	*/
	
	/* 5초마다 실행
	 *  @Scheduled(fixedDelay=5000)
	 *  // Component로 설정해놨기에 , 배포와 동시에 fixedDelay 시작됨.
	 */
	
	@Scheduled(fixedDelay = 15000)
	public void Randomize_QR() throws WriterException , IOException{
		
		try {
			Random rnd = new Random();
			String param = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
			// QR코드 랜덤 String 변수 (a~z)
			
			db_rep.Insert_Randomize_QR(param);
	      
			System.out.println("랜덤 QR코드 갱신됨\n");
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
	}
}
