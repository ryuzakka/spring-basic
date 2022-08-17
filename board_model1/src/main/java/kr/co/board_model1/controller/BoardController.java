package kr.co.board_model1.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_model1.command.BoardCommand;
import kr.co.board_model1.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private BoardCommand bCommand;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		return bCommand.list(model);
	}
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest req) {
		
		return bCommand.readnum(req);
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) {
		
		return bCommand.content(req, model);
	}
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(BoardDto dto) {
		
		return bCommand.write_ok(dto);
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		
		return bCommand.delete(req);
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest req, Model model) {
		
		return bCommand.update(req, model);
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(HttpServletRequest req, BoardDto dto) {
		
		return bCommand.update_ok(req, dto);
	}
	
	
	
	
}
