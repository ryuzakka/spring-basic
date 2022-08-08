package kr.co.batis_board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.SQLStateSQLExceptionTranslator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.batis_board.dao.BoardDao;
import kr.co.batis_board.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/list")
	public String list(Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
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
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.write_ok(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest req) {
		// 조회수 증가 동작
		String id = req.getParameter("id");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.readnum(id);
		
		return "redirect:/content?id="+id;
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) {
		if(req.getParameter("err") != null)
			model.addAttribute("err", req.getParameter("err"));
		
		String id = req.getParameter("id");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto view = dao.content(id);
		view.setContent(view.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("view", view);
		
		return "content";
	}
	
	@RequestMapping("/delete")
	public String delete(BoardDto dto) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		if(dao.pwdCheck(dto.getId(), dto.getPwd()) == 1) {
			dao.delete(dto);
			return "redirect:/list";
		}
		else {
			return "redirect:/content?err=1&id="+dto.getId();
		}
		
	}
	
	
	@RequestMapping("/update")
	public String update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto view = dao.content(id);
		
		model.addAttribute("view", view);
		
		return "update";
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(BoardDto dto) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		if(dao.pwdCheck(dto.getId(), dto.getPwd()) == 1) {			
			dao.update_ok(dto);
			return "redirect:/content?id="+dto.getId();
		} else {
			return "redirect:/update?err=1&id="+dto.getId();
		}
	}
	
}
