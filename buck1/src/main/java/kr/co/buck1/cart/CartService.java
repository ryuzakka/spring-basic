package kr.co.buck1.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartService {

	public String list(HttpSession session, Model model, HttpServletRequest req);
	public void delete(HttpServletRequest req);
	public void unit_minus(HttpServletRequest req);
	public void unit_plus(HttpServletRequest req);
	public String cart_order(HttpServletRequest req, HttpSession session, Model model);
	public String popup_store(Model model, HttpServletRequest req);
	public String popup_recharge(HttpSession session, Model model);
	public void popup_recharge_ok(HttpServletRequest req);
	public String cart_order_ok(HttpServletRequest req, HttpSession session, PrintWriter out);
	
	
}
