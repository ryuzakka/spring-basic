package kr.co.buck1.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

	@Autowired
	@Qualifier("ms")
	private MenuService service;
//	private SqlSession sqlSession;
	
	@RequestMapping("/menu/")
	public String list() {
		return "redirect:/menu/drink_list";
	}
	
	@RequestMapping("/menu/drink_list")
	public String drink_list(Model model) {
//		MenuDao dao = sqlSession.getMapper(MenuDao.class);
//		ArrayList<MenuDto> list = dao.list();
//		model.addAttribute("list", list);
		return service.drink_list(model);
	}
	
	@RequestMapping("/menu/drink_content")
	public String drink_content(HttpServletRequest req, Model model) {
		return service.drink_content(req, model);
	}
	
	@RequestMapping("/menu/drink_order")
	public String drink_order(HttpServletRequest req, Model model) {
		return service.drink_order(req, model);
	}
	@RequestMapping("/menu/popup_login")
	public String popup_login() {
		return "/menu/popup_login";
	}
	@RequestMapping("/menu/popup_login_ok")
	public void popup_login_ok(HttpServletRequest req, HttpSession session, PrintWriter out) {
		service.popup_login_ok(req, session, out);
	}
	
	@RequestMapping("/menu/get_price")
	public void get_price(HttpServletRequest req, PrintWriter out) {
		service.getPrice(req, out);
	}
	
	@RequestMapping("/menu/drink_order_ok")
	public String drink_order_ok(HttpServletRequest req, HttpSession session) {
		return service.drink_order_ok(req, session);
	}
	
}
