package kr.co.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/write")
	public String write() {

		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(/*HttpServletRequest req*/ BoardDto dto) throws Exception {
		
		BoardDao dao = new BoardDao();

//		dao.write_req(req);		
		dao.write_dto(dto);
		
		return "redirect:/list";
	}

	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		
		BoardDao dao = new BoardDao();
		
		ArrayList<BoardDto> list = dao.list();
		model.addAttribute("list", list);
		
		return "/list";
	}



}
