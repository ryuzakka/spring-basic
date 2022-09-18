package kr.co.buck1.admin.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StoreController {

	@Autowired
	@Qualifier("ss")
	private StoreService service;
	
	@RequestMapping("/admin_store/store_write")
	public String store_write() {
		return "/admin_store/store_write";
	}
	
	@RequestMapping("/admin_store/store_write_ok")
	public String store_write_ok(HttpServletRequest req) {
		return service.store_write_ok(req);
	}
	
	@RequestMapping("/admin_store/store_list")
	public String store_list(Model model, HttpServletRequest req) {
		return service.store_list(model, req);
	}
	
	@RequestMapping("/admin_store/store_state")
	public void store_state(HttpServletRequest req) {
		service.store_state(req);
	}
	
	@RequestMapping("/admin_store/store_update")
	public String store_update(HttpServletRequest req, Model model) {
		return service.store_update(req, model);
	}
	
	@RequestMapping("/admin_store/store_imgdel")
	public void store_imgdel(HttpServletRequest req) {
		service.store_imgdel(req);
	}
	
	@RequestMapping("/admin_store/store_update_ok")
	public String store_update_ok(HttpServletRequest req) {
		return service.store_update_ok(req);
	}
	
	
}
