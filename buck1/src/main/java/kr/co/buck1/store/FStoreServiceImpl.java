package kr.co.buck1.store;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("ss")
public class FStoreServiceImpl implements FStoreService {
	
	@Autowired
	private FStoreMapper mapper;
	
	@Override
	public void keywordSearch(HttpServletRequest req, PrintWriter out) {
		String key = req.getParameter("keyword");
		ArrayList<FStoreVO> list = mapper.keywordSearch(key);
		
		String res = "";
		res = "[";
		for(int i=0; i<list.size(); i++) {
			res += "{content:"+list.get(i).getStorename()+"},";
			res += "{lat:"+list.get(i).getLat()+"},";
			res += "{lat:"+list.get(i).getLng()+"}";
		}
		res += "]";
		
		String res2 = "";
		for(int i=0; i<list.size(); i++) {
			res2 += "" + list.get(i).getStorename() + "-";
			res2 += "" + list.get(i).getLat() + "-";
			res2 += "" + list.get(i).getLng() + ",";
		}
		
		out.print(res2);
	}
	
}
