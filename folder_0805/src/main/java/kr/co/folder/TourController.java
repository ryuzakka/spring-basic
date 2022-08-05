package kr.co.folder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {

	
	@RequestMapping("/tour/")
	public String tour_main() {
		return "/tour/list";
	}
	
	@RequestMapping("/tour/list")
	public String list() {
		return "/tour/list";
	}
	
	@RequestMapping("/tour/write")
	public String write() {
		return "/tour/write";
	}
	
	@RequestMapping("/tour/content")
	public String content() {
		return "/tour/content";
	}
	
	@RequestMapping("/tour/update")
	public String update() {
		return "/tour/update";
	}
	
	
	
}
