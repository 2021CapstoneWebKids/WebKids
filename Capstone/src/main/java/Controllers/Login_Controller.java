package Controllers;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import DataBase.JDBC_Repository_Main;
import Security.Bcrypt;

@Controller
public class Login_Controller {

	@Autowired
	Bcrypt Bcry;
	
	@Autowired
	private JDBC_Repository_Main jdbc;
	
	@RequestMapping(value = "/login")
	public ModelAndView Main_Login(HttpServletRequest req , HttpServletResponse httpServletResponse) throws IOException {
		ModelAndView mav = new ModelAndView("Main_Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpServletRequest req , HttpServletResponse httpServletResponse) throws IOException {
		ModelAndView mav = new ModelAndView("Main_Login.jsp");
		ModelAndView mav2 = new ModelAndView("Main.jsp");
		String ID = req.getParameter("ID");
		String Password = req.getParameter("Password");
		
		String sql_hashed_pwd = jdbc.select("member", "Password", 
				"ID = '" + ID + "'");
		
		HttpSession session = req.getSession();
		session.setAttribute("ID" , ID);
		String Session_User = (String) session.getAttribute("ID");
		
		if(Bcry.isMatch(Password, sql_hashed_pwd)){
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			Date time = new Date();
			String time_pr = format1.format(time);
			System.out.println("\n" + "[SYSTEM] 아이디 : " + ID + "님이 " + time_pr + " 에 로그인 하였습니다.");
			
			jdbc.Insert_Login_Track(ID, time_pr);
			mav2.addObject("Session_User", Session_User);
			return mav2;
			
		}
		else {
			mav.addObject("fail_message", "ID/PW가 틀렸습니다");
			return mav;
		}
	}
	
}
