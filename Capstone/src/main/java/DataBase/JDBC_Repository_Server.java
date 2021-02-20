package DataBase;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBC_Repository_Server {

	// 서버관련 쿼리 Repository
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void update_server_clock() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String time_pr = format1.format(time);
		String sql = "insert into server_time_clock values('" + time_pr + "' , 'A') "
				+ "ON DUPLICATE KEY UPDATE Today = '"+ time_pr + "'"; 
		jdbcTemplate.execute(sql);
		
	}
}
