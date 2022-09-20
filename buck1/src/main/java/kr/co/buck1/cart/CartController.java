package kr.co.buck1.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("cs")
	private CartService service;
	
	@RequestMapping("/cart/list")
	public String list(HttpSession session, Model model, HttpServletRequest req) {
		return service.list(session, model, req);
	}
	
	@RequestMapping("/cart/delete")
	public void delete(HttpServletRequest req) {
		service.delete(req);
	}
	
	@RequestMapping("/cart/unit_minus")
	public void unit_minus(HttpServletRequest req) {
		service.unit_minus(req);
	}
	
	@RequestMapping("/cart/unit_plus")
	public void unit_plus(HttpServletRequest req) {
		service.unit_plus(req);
	}
	
	@RequestMapping("/cart/cart_order")
	public String cart_order(HttpServletRequest req, HttpSession session, Model model) {
		return service.order(req, session, model);
	}
	@RequestMapping("/cart/popup_store")
	public String popup_store(Model model, HttpServletRequest req) {
		return service.popup_store(model, req);
	}
	
}
