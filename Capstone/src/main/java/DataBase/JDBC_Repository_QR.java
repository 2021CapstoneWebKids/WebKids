package DataBase;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBC_Repository_QR {

	// Spring -> JDBC -> MySql 쿼리 처리 클래스 (QR코드 관련)
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void Insert_Randomize_QR(File qrimg , String RND_String) {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time_pr = format1.format(time);
		time_pr += " || " + RND_String;
		String sql = "insert into rnd_qr values('" + time_pr + "' ,'" + qrimg + "')";
		jdbcTemplate.execute(sql);
		// DB에 갱신된 Randomize QRCODE 이미지 Insert
	}
}
