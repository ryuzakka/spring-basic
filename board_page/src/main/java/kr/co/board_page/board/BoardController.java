package kr.co.board_page.board;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping({"/board/", "/board/list"})
	public String list(Model model, HttpServletRequest req) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		/* 한 페이지의 글 갯수  */
		int pcnt;
		if( req.getParameter("pcnt") == null ) {
			pcnt = 10;
		} else {
			pcnt = Integer.parseInt(req.getParameter("pcnt"));
		}
		
		/* 각 페이지에서 불러올 게시글 인덱싱 */
		int page, index;
		if(req.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}
		index = (page-1) * pcnt;	// 인덱스의 값을 글 개수에 맞춰 변경
		
		/* 페이지를 10 단위로 잘라서 노출하기 */
		int pstart, pend;
		pstart = page / 10;
		if((page%10) == 0)
			pstart--;
		pstart = (pstart*10) + 1;
		pend = pstart + 9;
		
		/* 총 페이지수 구하기 */
		int total = dao.totalCount(pcnt);
		
		ArrayList<BoardDto> list = dao.list(index, pcnt);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("pcnt", pcnt);
		
		return "/board/list";
	}
}
