package kr.co.buck1.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartService {

	public String list(HttpSession session, Model model, HttpServletRequest req);
	public void delete(HttpServletRequest req);
	public void unit_minus(HttpServletRequest req);
	public void unit_plus(HttpServletRequest req);
	public String order(HttpServletRequest req, HttpSession session, Model model);
	public String popup_store(Model model, HttpServletRequest req);
	
	
}
