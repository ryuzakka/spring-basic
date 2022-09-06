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
			res2 += URLEncoder.encode(list.get(i).getStorename()) + "-";
			res2 += URLEncoder.encode(list.get(i).getAddr1()) + "-";
			res2 += "" + list.get(i).getLat() + "-";
			res2 += "" + list.get(i).getLng() + ",";
		}
		
		out.print(res2);
	}
	
	
	@Override
	public String storeList(Model model) {
		ArrayList<FStoreVO> list = mapper.storeList();
		model.addAttribute("store", list);
		return "/store/store_info";
	}
	
	
}
