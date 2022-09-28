package kr.co.buck1.admin;

import java.io.PrintWriter;

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
	
	
	@RequestMapping("/admin/member")
	public String member(Model model, HttpServletRequest req) {
		return service.member(model, req);
	}
	
	@RequestMapping("/admin/order")
	public String order(Model model) {
		return service.order(model);
	}
	
	@RequestMapping("/admin/orderProgress")
	public void orderProgress(HttpServletRequest req, PrintWriter out) {
		service.orderProgress(req, out);
	}
	
	@RequestMapping("/admin/menu")
	public String menu(Model model, HttpServletRequest req) {
		return service.menu(model, req);
	}
	
	@RequestMapping("/admin/menu_write")
	public String menu_write(Model model) {
		return service.menu_write(model);
	}
	
	@RequestMapping("/admin/menu_write_ok")
	public String menu_write_ok(HttpServletRequest req) {
		return service.menu_write_ok(req);
	}
	
}
