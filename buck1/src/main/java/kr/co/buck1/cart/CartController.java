package kr.co.buck1.cart;

import java.io.PrintWriter;

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
		return service.cart_order(req, session, model);
	}
	@RequestMapping("/cart/popup_store")
	public String popup_store(Model model, HttpServletRequest req) {
		return service.popup_store(model, req);
	}
	@RequestMapping("/cart/popup_recharge")
	public String popup_recharge(HttpSession session, Model model) {
		return service.popup_recharge(session, model);
	}
	@RequestMapping("/cart/popup_recharge_ok")
	public void popup_recharge_ok(HttpServletRequest req) {
		service.popup_recharge_ok(req);
	}
	
	@RequestMapping("/cart/cart_order_ok")
	public String cart_order_ok(HttpServletRequest req, HttpSession session, PrintWriter out) {
		return service.cart_order_ok(req, session, out);
	}
	
}
