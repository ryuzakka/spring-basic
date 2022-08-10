package kr.co.board_page.board;

import java.util.ArrayList;

public interface BoardDao {

	public ArrayList<BoardDto> list(int index, int pcnt);
	public int totalCount(int pcnt);
	
}
