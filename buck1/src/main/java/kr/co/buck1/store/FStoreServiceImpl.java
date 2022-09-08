package kr.co.buck1.store;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("fs")
public class FStoreServiceImpl implements FStoreService {
	
//	@Autowired
//	private FStoreMapper mapper;
	@Autowired
	private FStoreMapper mapper;
	
	@Override
	public void keywordSearch(HttpServletRequest req, PrintWriter out) {
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String key = req.getParameter("keyword");
		ArrayList<FStoreVO> list = mapper.keywordSearch(key);
		
		String res2 = "";
		for(int i=0; i<list.size(); i++) {
			res2 += URLEncoder.encode(list.get(i).getStorename()) + "_";
			res2 += URLEncoder.encode(list.get(i).getAddr1()) + "_";
			res2 += "" + list.get(i).getLat() + "_";
			res2 += "" + list.get(i).getLng() + ",";
		}
		
		out.print(res2);
	}
	
	
	@Override
	public String storeList(Model model, HttpServletRequest req) {
		
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
		
		ArrayList<FStoreVO> list = mapper.storeList(keyword, index);
		model.addAttribute("store", list);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		
		return "/store/store_info";
	}
	
	
}
