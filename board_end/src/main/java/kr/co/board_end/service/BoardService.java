package kr.co.board_end.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BoardService {

	public String list(Model model, HttpServletRequest req);
}
