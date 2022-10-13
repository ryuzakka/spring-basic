package kr.co.oracle_board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.oracle_board.mapper.BoardMapper;
import kr.co.oracle_board.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("write")
	public String write() {
		return "write";
	}
	
	@RequestMapping("write_ok")
	public String write_ok(BoardVO vo) {
		mapper.write_ok(vo);
		return "redirect:list";
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "list";
	}
	
	@RequestMapping("view")
	public String view(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		model.addAttribute("board", mapper.view(id));
		return "view";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest req) {
		String id, pwd;
		id = req.getParameter("id");
		pwd = req.getParameter("pwd");
		
		if(mapper.pwdCheck(id).equals(pwd)) {
			mapper.delete(id);
		}
		return "list";
//		else {
//			return "redirect:view?id="+id;
//		}
	}
	
	@RequestMapping("update")
	public String update(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		model.addAttribute("board", mapper.view(id));
		return "update";
	}
	
	@RequestMapping("update_ok")
	public String update_ok(BoardVO vo) {
		mapper.update_ok(vo);
		return "redirect:view?id=" + vo.getId();
	}
	
}
