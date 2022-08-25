package kr.co.buck1.menu;

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
	
	
}
