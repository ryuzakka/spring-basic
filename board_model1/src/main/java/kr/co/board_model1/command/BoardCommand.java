package kr.co.board_model1.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.board_model1.dao.BoardDao;
import kr.co.board_model1.dto.BoardDto;

@Service
public class BoardCommand {

	@Autowired
	private SqlSession sqlSession;
	
	public String list(Model model) {
		// DB처리 및 각종 처리 => DB서버와 통신
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list = dao.list();
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	public String readnum(HttpServletRequest req) {
		String id = req.getParameter("id");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.readnum(id);
		
		return "redirect:/content?id=" + id;
	}
	
	public String content(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.content(id);
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("view", dto);
		
		return "/content";
	}
	
	public String write_ok(BoardDto dto) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.write_ok(dto);
		
		return "redirect:/list";
	}
	
	public String delete(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		if(dao.pwdCheck(id, pwd) == 1) {
			dao.delete(id);
			return "redirect:/list";
		} else {
			return "redirect:/content?id="+id;
		}
	}
	
	public String update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.update(id);
		model.addAttribute("view", dto);
		
		return "/update";
	}
	
	public String update_ok(HttpServletRequest req, BoardDto dto) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		if(dao.pwdCheck(id, pwd) == 1) {
			dao.update_ok(dto);
			return "redirect:/content?id="+id;
		} else {
			return "redirect:/update?id="+id;
		}
	}
	
	
	
	
}
