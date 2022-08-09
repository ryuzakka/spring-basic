package kr.co.batis_board2.boarddao;

import java.util.ArrayList;

import kr.co.batis_board2.boarddto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	
}
