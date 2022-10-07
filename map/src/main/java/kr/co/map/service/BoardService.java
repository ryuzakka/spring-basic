package kr.co.map.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardService {

	public String list(Model model);
	public String readnum(HttpServletRequest req);
	public String content(Model model, HttpServletRequest req);
	public String write_ok(HttpServletRequest req);
	
}
