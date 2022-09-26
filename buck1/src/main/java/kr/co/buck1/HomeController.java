package kr.co.buck1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	@Qualifier("hs")
	private HomeService service;
	
	@RequestMapping("/")
	public String home() {
		logger.info("Welcome home! The client locale is.");
		
		return "redirect:/main/index";
	}
	
	@RequestMapping({"/main", "/main/", "/main/index"})
	public String main(Model model) {
//		return "/main/index";
		return service.main(model);
	}
	
}
