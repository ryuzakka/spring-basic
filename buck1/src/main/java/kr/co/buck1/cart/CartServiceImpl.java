package kr.co.buck1.cart;

import javax.servlet.http.HttpServletRequest;
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
	
	@Override
	public void delete(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
//		userid = session.getAttribute("userid").toString();
		mapper.delete(id);
	}
	
	@Override
	public void unit_minus(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
		mapper.unit_minus(id);
	}
	
	@Override
	public void unit_plus(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
		mapper.unit_plus(id);
	}
	
	@Override
	public String order(HttpServletRequest req, HttpSession session, Model model) {
		model.addAttribute("cart", mapper.list(session.getAttribute("userid").toString()));
		model.addAttribute("cost", req.getParameter("cost"));
		return "/cart/cart_order";
	}
	
	
	
}
