package kr.co.buck1.error;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping("/error/error404")
	public String error404() {
		return "/error/error404";
	}
	
}
