package kr.co.board_model3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_model3.service.BoardService;
import kr.co.board_model3.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		return service.list(model);
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardVO vo) {
		
		return service.write(vo);
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest req) {
		return service.readnum(req);
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) {
		return service.content(req, model);
	}
	
	@RequestMapping("/delete")
	public String delete(BoardVO vo) {
		return service.delete(vo);
	}
	
	@RequestMapping("/update")
	public String update(BoardVO vo, Model model) {
		return service.update(vo, model);
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(BoardVO vo) {
		return service.update_ok(vo);
	}
	
}
