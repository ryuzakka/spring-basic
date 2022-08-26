package kr.co.buck1.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartService {

	public String list(HttpSession session, Model model);
	public void delete(HttpServletRequest req);
	
	
}
