package kr.co.buck1.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/admin/store_write")
	public String store_write() {
		return "/admin/store_write";
	}
	
	@RequestMapping("/admin/store_write_ok")
	public String store_write_ok(HttpServletRequest req) {
		return service.store_write_ok(req);
	}
	
	@RequestMapping("/admin/store_list")
	public String store_list(Model model) {
		return service.store_list(model);
	}
	
	
}
