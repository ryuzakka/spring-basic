package kr.co.buck1.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.buck1.cart.CartVO;
import kr.co.buck1.member.MemberVO;

@Service
@Qualifier("ms")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper mapper;
	//private MemberMapper memberMapper;
	
	@Override
	public String drink_list(Model model, HttpServletRequest req) {
		String cate2;
		if(req.getParameter("cate2") == null){
			cate2 = "";
		} else {
			cate2 = req.getParameter("cate2");
		}
		
		model.addAttribute("list", mapper.drink_list(cate2));
		
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
	
	@Override
	public void popup_login_ok(HttpServletRequest req, HttpSession session, PrintWriter out) {
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		
		int result = mapper.login_ok(userid, pwd);
		if(result == 1) {
			// 로그인 진행
			MemberVO mvo = mapper.getInfo(userid);
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("nick", mvo.getNickname());
			out.print(result);
		} else {
			// ID/PW 불일치member/signin
			out.print(result);			
		}
	}
	
	
}
