package Controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import DTO.ChatMessageDTO;

@Controller
public class Chat_Controller {

	private List<ChatMessageDTO> messages;
	//채팅 기록을 DTO배열에 저장하고
	//DTO를 유지할 수 있도록 컨트롤러에서 인스턴스 변수로 배열을 선언
	
	Chat_Controller(){
		messages = new ArrayList<>();
	}
	
	@RequestMapping(value="chat")
	public ModelAndView chatMain(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("chat.jsp");
		
		HttpSession session = req.getSession();
		String Session_User = (String) session.getAttribute("ID");
		mav.addObject("Session_User", Session_User);
		
		return mav;
	}
	
	@RequestMapping(value="/chat/doAddMessage")
	@ResponseBody
	public Map doAddMessage(HttpServletRequest req , String body) {
		
		int id = messages.size()+1;
		// 저장된 마지막 메시지의 마지막 번호
		
		HttpSession session = req.getSession();
		String Session_User = (String) session.getAttribute("ID");
		
		ChatMessageDTO chatMessage = new ChatMessageDTO(id , Session_User , body);
		
		messages.add(chatMessage);
		
		Map<String , Object> rs = new HashMap<>();
		rs.put("msg", "메시지가 전송되었습니다.");
		
		return rs;
	}
	
	@RequestMapping(value="/chat/getAllMessages")
	@ResponseBody
	public List getAllMessages(int from) {
		return messages.subList(from , messages.size());
	}
	
}
