package kr.co.board_model3.mapper;

import java.util.ArrayList;

import kr.co.board_model3.vo.BoardVO;

public interface BoardMapper {
	
	public ArrayList<BoardVO> list();
	public void write(BoardVO vo);
	public void readnum(String id);
	public BoardVO content(String id);
	public int pwdCheck(int id, String pwd);
	public void delete(int id);
	public BoardVO update(int id);
	public void update_ok(BoardVO vo);
}
