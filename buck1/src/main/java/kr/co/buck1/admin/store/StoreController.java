package kr.co.buck1.admin.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StoreController {

	@Autowired
	@Qualifier("ss")
	private StoreService service;
	
	@RequestMapping("/admin/store/store_write")
	public String store_write() {
		return "/admin/store/store_write";
	}
	
	@RequestMapping("/admin/store/store_write_ok")
	public String store_write_ok(HttpServletRequest req) {
		return service.store_write_ok(req);
	}
	
	@RequestMapping("/admin/store/store_list")
	public String store_list() {
		return "/admin/store/store_list";
	}
	
	
}
