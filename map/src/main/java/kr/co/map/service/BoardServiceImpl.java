package kr.co.map.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.map.mapper.BoardMapper;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "list";
	}
	
	@Override
	public String readnum(HttpServletRequest req) {
		Map<String,String[]> map = req.getParameterMap();
//		String id = map.get("id")[0];
//		mapper.readnum(id);
//		System.out.println(id);
		
		HashMap<String,String> map2 = new HashMap<String,String>();
		map2.put("id", map.get("id")[0]);	// id=19
		mapper.readnum2(map2);
		
		return "redirect:content?id="+map.get("id")[0];
	}
	
	@Override
	public String content(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		HashMap<String,String> map = mapper.content(id);
		
		map.put("content", map.get("content").replace("\r\n", "<br>"));
		
		// view에서 ${content.title}
		//model.addAttribute("content", map);
		
		// view에서 ${title} 
		model.addAllAttributes(map);
		
		return "content";
	}
	
	@Override
	public String write_ok(HttpServletRequest req) {
		// HashMap으로 mapper에 전달
		Map<String,String[]> map = req.getParameterMap();
		// req로 받은 파라메터는 아래의 형태와 같다
		// map : name=[홍길동],title=[즐거운 금요일],content=[ㅎㅎ],pwd=[123]
		
		HashMap<String,String> map2 = new HashMap<String,String>();
		map2.put("name", map.get("map")[0]);
		// ... 이런 식으로 새로 생성한 HashMap 객체에 값을 나눠 담을 수 있다.
		// 하지만 이렇게 되면 파라메터를 유동적으로 변경할 수 없음 (자동화 불가)
		
		/* 자동화 방법 */
		// 반복문을 활용하여 필드가 있는 만큼 자동으로 처리
		Map<String,String[]> requestMap = req.getParameterMap();
		Enumeration<String> enm = req.getParameterNames();	// 이전 문서에서 오는 모든 name을 가져온다.
		
		HashMap<String,String> sortedMap = new HashMap<String,String>();
		while(enm.hasMoreElements()) {
			String str = enm.nextElement();
			sortedMap.put(str, requestMap.get(str)[0]);
		}
		mapper.write_ok(sortedMap);
		
		return "list";
	}
	
	
}
