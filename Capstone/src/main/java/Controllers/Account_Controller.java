package Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DataBase.JDBC_Repository_Main;

@Controller
public class Account_Controller {

	@Autowired
	private JDBC_Repository_Main jdbc;
	
	@RequestMapping(value = "/Create_Account.do")
	public ModelAndView Create_Account(HttpServletRequest req) throws AddressException, MessagingException {
		
		ModelAndView mav = new ModelAndView("Create_Account.jsp");
	
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time_pr = format1.format(time);
		
		String ID = req.getParameter("ID");
		String Password = req.getParameter("Password");
		String Email_Sender = req.getParameter("Email");
		String context = "계정생성 요청 접수됨\n" +
						"요청 ID : " + ID + " \n" +
						"요청 Password : " + Password + " \n" +
						"요청자 이메일 : " + Email_Sender + " \n" +
						"요청 시각 : " + time_pr + " \n";
		
		
		return mav;
	}
}
