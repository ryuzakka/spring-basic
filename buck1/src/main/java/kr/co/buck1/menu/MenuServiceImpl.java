package kr.co.buck1.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buck1.cart.CartVO;

@Service
@Qualifier("ms")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper mapper;
	
	@Override
	public String drink_list(Model model) {
		model.addAttribute("list", mapper.drink_list());
		
		return "/menu/drink_list";
	}
	
	@Override
	public String drink_content(HttpServletRequest req, Model model) {
		String name, category;
		name = req.getParameter("name");
		
		model.addAttribute("info", mapper.getOption(name));
		MenuVO vo = mapper.getCate(name);
		category = mapper.getCatename(vo.getCate1(), vo.getCate2(), name);
		model.addAttribute("category", category);
		return "/menu/drink_content";
	}
	
	@Override
	public void getPrice(HttpServletRequest req, PrintWriter out) {
		String name, size;
		name = req.getParameter("name");
		size = req.getParameter("size");
		
		out.print(mapper.getPrice(name, size));
	}
	
	@Override
	public String drink_order(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		model.addAttribute("info", mapper.getOption(name));
		
		return "/menu/drink_order";
	}
	
	@Override
	public String drink_order_ok(HttpServletRequest req, HttpSession session) {
		String name, size, code;
//		int unit, price, totalCost;
		
		name = req.getParameter("name");
		size = req.getParameter("size");
		code = mapper.getCode(name, size);

		CartVO cvo = new CartVO();
		cvo.setUserid(session.getAttribute("userid").toString());
		cvo.setCode(code);
		cvo.setUnit(Integer.parseInt(req.getParameter("unit")));
		cvo.setProd_cost(Integer.parseInt(req.getParameter("pricePerUnit")));
		cvo.setTotal_cost(Integer.parseInt(req.getParameter("cost")));
		
		mapper.insertCart(cvo);
		
		return "redirect:/cart/list";
	}
	
	
	
}
