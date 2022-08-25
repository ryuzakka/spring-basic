package kr.co.buck1.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String drink_order(HttpServletRequest req) {
		return "";
	}
	
	
}
