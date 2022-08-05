package kr.co.folder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {

	
	@RequestMapping("/reserve")
	public String reserve_main() {
		return "/reserve/reserve";
	}
	
	@RequestMapping("/reserve/reserve")
	public String reserve() {
		return "/reserve/reserve";
	}
	
	@RequestMapping("/reserve/reserve_next")
	public String reserve_next() {
		return "/reserve/reserve_next";
	}
	
	@RequestMapping("/reserve/reserve_view")
	public String reserve_view() {
		return "/reserve/reserve_view";
	}
	
	
	
}
