package kr.co.hihi;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	@RequestMapping("/")
	public String home() {
		
		return "/home";
	}
	
	@RequestMapping("/input")
	public String input() {
		
		return "/input";
	}
	
	@RequestMapping("/sungview")
	public String sungview(MyDto dto, Model model) {
		
		model.addAttribute("sung", dto);
		
		return "/sungview";
		
	}
	
}
