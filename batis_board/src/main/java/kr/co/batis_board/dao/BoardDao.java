package kr.co.batis_board.dao;

import java.util.ArrayList;

import kr.co.batis_board.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public void write_ok(BoardDto dto);
}
