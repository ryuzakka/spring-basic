package kr.co.map.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.map.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("list")
	public String list(Model model) {
		return service.list(model);
	}
	
	@RequestMapping("readnum")
	public String readnum(HttpServletRequest req) {
		return service.readnum(req);
	}
	
	@RequestMapping("content")
	public String content(Model model, HttpServletRequest req) {
		return service.content(model, req);
	}
	
	@RequestMapping("write")
	public String write() {
		return "write";
	}
	
	@RequestMapping("write_ok")
	public String write_ok(HttpServletRequest req) {
		return service.write_ok(req);
	}
	
	
}
