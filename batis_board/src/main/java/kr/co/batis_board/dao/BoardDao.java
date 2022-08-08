package kr.co.batis_board.dao;

import java.util.ArrayList;

import kr.co.batis_board.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto dto);
	
	public void readnum(String id);
	// 가끔 String매개변수가 하나일 때 오류가 나는 경우가 있다.
	// xml에서 param1이 아닌 value로 받으면 해결된다. (자료형을 변경하거나 DTO로 전달하는 방법도 있다.)
	
	public BoardDto content(String id);
	public int pwdCheck(int id, String pwd);
	public void delete(BoardDto dto);
	public BoardDto update(String id);
	public void update_ok(BoardDto dto);
	
}
