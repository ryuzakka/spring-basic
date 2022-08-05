package kr.co.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/write")
	public String write() {

		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(/*HttpServletRequest req*/ BoardDto dto) throws Exception {
		
		BoardDao dao = new BoardDao();

//		dao.write_req(req);		
		return dao.write_dto(dto);
	}

	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		
		BoardDao dao = new BoardDao();
		return dao.list(model);
	}
	
	
	@RequestMapping("/readnum")
	public String readnum(HttpServletRequest req) throws Exception {
		BoardDao dao = new BoardDao();
		
		return dao.readnum(req);
		
		// return은 해당 문서를 요청하라는 의미가 아니라 응답하라는 의미.
		// RequestMapping에 /content 가 있더라도 호출되지 않음!
		// ** 매핑의 문서와 리턴의 문서가 다른 경우 무조건 redirect를 붙여준다.
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest req, Model model) throws Exception {
		
		BoardDao dao = new BoardDao();
		return dao.content(req, model, 1);
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) throws Exception {
		
		BoardDao dao = new BoardDao();
		return dao.delete(req);
	}

	@RequestMapping("/update")
	public String update(HttpServletRequest req, Model model) throws Exception {
		
		BoardDao dao = new BoardDao();
		return dao.content(req, model, 2);
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(HttpServletRequest req) throws Exception {
		
		BoardDao dao = new BoardDao();
		return dao.update(req);
	}
	
	

}
