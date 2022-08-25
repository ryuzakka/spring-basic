package kr.co.buck1.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("cs")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Override
	public String list(HttpSession session, Model model) {
		model.addAttribute("list", mapper.list(session.getAttribute("userid").toString()));
		return "/cart/list";
	}
	
}
