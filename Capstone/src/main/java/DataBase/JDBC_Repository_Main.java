package DataBase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBC_Repository_Main {

	// Spring -> JDBC -> MySql 쿼리 처리 클래스 (범용적 기능들 관련)
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public String select(String Table_Name , 	String Target_Field , String condition) {
		
		String sql = "Select " + Target_Field + " from "
					+ Table_Name + " where " + condition;
	
		String res = jdbcTemplate.queryForObject(sql, String.class);
		return res;
	}
	
	public void Insert_Login_Track(String ID , String Time) {
		
		String sql = "Insert into Login_Track values ('"
				+ ID + "' , '" + Time + "')";
		jdbcTemplate.execute(sql);
		
	}
	
	public void Insert_Online_User(String ID) {
		
		String sql = "Insert into online_user values ('"
				+ ID + "')";
		jdbcTemplate.execute(sql);
		
	}
	
	public void Delete_Online_User(String ID) {
		
		String sql = "Delete from online_user where User = '" + ID +"'";
		jdbcTemplate.execute(sql);
		
	}
	
}
