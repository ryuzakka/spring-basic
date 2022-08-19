package kr.co.board_end.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.board_end.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest req) {
		return service.list(model, req);
	}
	
}
