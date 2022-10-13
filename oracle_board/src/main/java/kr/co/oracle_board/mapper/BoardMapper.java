package kr.co.oracle_board.mapper;

import java.util.ArrayList;

import kr.co.oracle_board.vo.BoardVO;

public interface BoardMapper {

	public void write_ok(BoardVO vo);
	public ArrayList<BoardVO> list();
	public BoardVO view(String id);
	public String pwdCheck(String id);
	public void delete(String id);
	public void update_ok(BoardVO vo);
	
}
