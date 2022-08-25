package kr.co.buck1.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {

	@Autowired
	@Qualifier("ms")
	private MenuService service;
//	private SqlSession sqlSession;
	
	@RequestMapping("/menu/")
	public String list() {
		return "redirect:/menu/drink_list";
	}
	
	@RequestMapping("/menu/drink_list")
	public String drink_list(Model model) {
//		MenuDao dao = sqlSession.getMapper(MenuDao.class);
//		ArrayList<MenuDto> list = dao.list();
//		model.addAttribute("list", list);
		
		return service.drink_list(model);
	}
	
	@RequestMapping("/menu/drink_content")
	public String drink_content(HttpServletRequest req, Model model) {
		return service.drink_content(req, model);
	}
	
	@RequestMapping("/menu/drink_order")
	public String drink_order(HttpServletRequest req) {
		return service.drink_order(req);
	}
	
	
}
