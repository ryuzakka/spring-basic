package kr.co.board_end.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.board_end.mapper.BoardMapper;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public String list(Model model, HttpServletRequest req) {
		// DB관련 , 처리를 여기서 한다.
		// view에 전달할 값은 model을 통해 전달
		
		/* 검색 처리 */
		String sel, sword;
		if(req.getParameter("sel") == null) {
			sel = "id";
			sword = "";
		} else {			
			sel = req.getParameter("sel");
			sword = req.getParameter("sword");
		}
		
		/* 페이지 처리 */
		// 1. 페이지에 해당하는 레코드를 가져오기
		//	=> limit에 사용될 index값을 구해서 전달 : limit 시작 인덱스, 레코드갯수 
		int page, index;
		if(req.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}
		index = (page-1) * 10;
		
		// 2. 사용자에게 보여줄 링크를 처리하기 위한 값 구하기
		//	=> pstart, pend, total
		int pstart, pend, total;
		
		pstart = page / 10;
		if(page%10 == 0)	pstart--;
		pstart = (pstart*10) + 1;
		
		pend = pstart + 9;		
		total = mapper.getTotal(sel, sword);
		if(pend > total)
			pend = total;
		
		model.addAttribute("list", mapper.list(sel, sword, index));
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("sel", sel);
		model.addAttribute("sword", sword);
		return "/list";
	}
}





