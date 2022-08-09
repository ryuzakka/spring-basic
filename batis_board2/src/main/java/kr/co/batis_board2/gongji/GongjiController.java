package kr.co.batis_board2.gongji;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GongjiController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gongji/list")
	public String list(Model model) {
		GongjiDao dao = sqlSession.getMapper(GongjiDao.class);
		ArrayList<GongjiDto> list = dao.list();
		model.addAttribute("list", list);
		
		return "/gongji/list";
	}
	
}
