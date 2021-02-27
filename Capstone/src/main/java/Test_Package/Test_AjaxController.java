package Test_Package;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Test_AjaxController {
	
	@RequestMapping(value="/ajax", method=RequestMethod.GET)
	public String home(){
		return "ajax_example.jsp";
	}

	// Test Case - 1
	@ResponseBody
	@RequestMapping(value="/list", method=RequestMethod.GET, consumes=MediaType.APPLICATION_JSON_VALUE)
	public List<String> list(@ModelAttribute("username") String username, @RequestParam("password") String password){
		List<String> response = new ArrayList<String>();
		response.add(username);
		response.add(password);
		System.out.println("\nUsername : " + username + " Password : " + password +"\n");
		return response;
	}

	
	// Test Case - 4
	@ResponseBody
	@RequestMapping(value="/map", method=RequestMethod.PUT, produces=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> map(@RequestBody DataSet_forAjaxExample dataSet){
		
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("username", dataSet.getUsername());
		response.put("password", dataSet.getPassword());
		System.out.println("\nUsername : " + dataSet.getUsername() + " Password : " + dataSet.getPassword() +"\n");
		return response;
	}
	
	// Test Case - 6
	@ResponseBody
	@RequestMapping(value="/entity", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> entity(@RequestBody DataSet_forAjaxExample dataSet){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", dataSet.getUsername());
		map.put("password", dataSet.getPassword());
		
		System.out.println("\nUsername : " + dataSet.getUsername() + " Password : " + dataSet.getPassword() +"\n");
		
		//응답과 함깨 HttpStatus를 지정할 수 있습니다.
		ResponseEntity<Object> response = new ResponseEntity<Object>(map, HttpStatus.OK);
		return response;
	}
	
	// Test Case - 7
	//@ResponseBody
	@RequestMapping(value="/entity_nobody", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> entity_nobody(@RequestBody DataSet_forAjaxExample dataSet){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", dataSet.getUsername());
		map.put("password", dataSet.getPassword());
		
		System.out.println("\nUsername : " + dataSet.getUsername() + " Password : " + dataSet.getPassword() +"\n");
		
		//응답과 함깨 HttpStatus를 지정할 수 있습니다.
		ResponseEntity<Object> response = new ResponseEntity<Object>(map, HttpStatus.OK);
		return response;
	}
	
	// Test Case - 8
	@RequestMapping(value="/entity_nobody_param", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> entity_nobody_param(@RequestBody DataSet_forAjaxExample dataSet, @RequestParam String param){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", dataSet.getUsername());
		map.put("password", dataSet.getPassword());
		
		System.out.println("\nUsername : " + dataSet.getUsername() + " Password : " + dataSet.getPassword() +"\n");
		
		//응답과 함깨 HttpStatus를 지정할 수 있습니다.
		ResponseEntity<Object> response = new ResponseEntity<Object>(map, HttpStatus.OK);
		return response;
	}
}
