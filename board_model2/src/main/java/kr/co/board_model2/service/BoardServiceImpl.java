package kr.co.board_model2.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.board_model2.dao.BoardDao;
import kr.co.board_model2.dto.BoardDto;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String list(Model model) {
		// model과 return값을 처리
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list = dao.list();
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	
}
