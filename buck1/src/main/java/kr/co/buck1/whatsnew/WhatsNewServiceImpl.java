package kr.co.buck1.whatsnew;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("wns")
public class WhatsNewServiceImpl implements WhatsNewService {

	@Autowired
	private WhatsNewMapper mapper;
	
	
	/*
	 * notice
	 */
	@Override
	public String notice_write_ok(WhatsNewVO vo) {
		mapper.notice_write_ok(vo);
		return "redirect:/whatsnew/notice_list";
	}
	
	@Override
	public String notice_list(Model model, HttpServletRequest req) {
		
		/* 검색 처리 */
		String keyword;
		if(req.getParameter("keyword") == null)
			keyword = "";
		else
			keyword = req.getParameter("keyword");
		
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
		total = mapper.getTotal(keyword);
		if(pend > total)
			pend = total;
		
		model.addAttribute("list", mapper.notice_list(keyword, index));
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		
		return "/whatsnew/notice_list";
	}
	
	@Override
	public String notice_view(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		WhatsNewVO vo = mapper.notice_view(id);
		vo.setContent(vo.getContent().replace("\r\n", "<br>")); 
		model.addAttribute("notice", vo);
		return "/whatsnew/notice_view";
	}
	
	@Override
	public String notice_viewcnt(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.notice_viewcnt(id);
		return "redirect:/whatsnew/notice_view?id="+id;
	}
	
	@Override
	public String notice_delete(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.notice_delete(id);
		return "redirect:/whatsnew/notice_list";
	}
	
	@Override
	public String notice_update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		model.addAttribute("notice", mapper.notice_view(id));
		return "/whatsnew/notice_update";
	}
	
	@Override
	public String notice_update_ok(WhatsNewVO vo) {
		int id = vo.getId();
		mapper.notice_update_ok(vo);
		return "redirect:/whatsnew/notice_view?id="+id;
	}
	
	
	/*
	 * news
	 */
	
	
	
	/*
	 * campaign
	 */
}
