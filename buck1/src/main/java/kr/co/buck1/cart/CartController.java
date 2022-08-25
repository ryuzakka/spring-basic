package kr.co.buck1.cart;

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
	public String list(HttpSession session, Model model) {
		return service.list(session, model);
	}
	
	
}
