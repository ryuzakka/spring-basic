package kr.co.batis_board.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.batis_board.dao.BoardDao;
import kr.co.batis_board.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/list")
	public String list(Model model) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list = dao.list();
		
		model.addAttribute("list", list);
		return "/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto dto) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		dao.write_ok(dto);
		
		return "redirect:/list";
	}
	
	
}
