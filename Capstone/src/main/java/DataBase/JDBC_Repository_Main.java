package DataBase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBC_Repository_Main {

	// Spring -> JDBC -> MySql 쿼리 처리 클래스
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
}
