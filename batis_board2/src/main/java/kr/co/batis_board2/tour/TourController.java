package kr.co.batis_board2.tour;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/tour/list")
	public String list(Model model) {
		TourDao dao = sqlSession.getMapper(TourDao.class);
		ArrayList<TourDto> list = dao.list();
		model.addAttribute("list", list);
		
		return "/tour/list";
	}
	
}
