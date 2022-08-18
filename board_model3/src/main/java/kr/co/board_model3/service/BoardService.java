package kr.co.board_model3.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.board_model3.vo.BoardVO;

public interface BoardService {
	
	public String list(Model model);
	public String write(BoardVO vo);
	public String readnum(HttpServletRequest req);
	public String content(HttpServletRequest req, Model model);
	public String delete(BoardVO vo);
	public String update(BoardVO vo, Model model);
	public String update_ok(BoardVO vo);
}
