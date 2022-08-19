package kr.co.board_end.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.board_end.vo.BoardVO;

public interface BoardMapper {

	public ArrayList<BoardVO> list(String field, String sword, int index);
	public int getTotal(String field, String sword);
	
}
