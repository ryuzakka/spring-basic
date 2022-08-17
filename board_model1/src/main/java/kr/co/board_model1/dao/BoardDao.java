package kr.co.board_model1.dao;

import java.util.ArrayList;

import kr.co.board_model1.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void readnum(String id);
	public BoardDto content(String id);
	public void write_ok(BoardDto dto);
	public void delete(String id);
	public int pwdCheck(String id, String pwd);
	public BoardDto update(String id);
	public void update_ok(BoardDto dto);
	
}
