package kr.co.autowired;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired	// xml을 통한 클래스의 객체생성과 값을 할당
	private Student student1, student2;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
	
		Student stu = new Student();
		stu.setName("스파이더맨");
		stu.setHakbun("20220105");
		stu.setAge(24);
		
		model.addAttribute("student1", student1);
		model.addAttribute("student", stu);
		model.addAttribute("student2", student2);
		
		return "home";
	}
	
}
