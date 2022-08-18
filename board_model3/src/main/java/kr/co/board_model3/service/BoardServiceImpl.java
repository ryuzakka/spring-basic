package kr.co.board_model3.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.board_model3.mapper.BoardMapper;
import kr.co.board_model3.vo.BoardVO;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		
		return "/list";
	}
	
	@Override
	public String write(BoardVO vo) {
		mapper.write(vo);
		return "redirect:/list";
	}
	
	@Override
	public String readnum(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.readnum(id);
		return "redirect:/content?id="+id;
	}
	
	@Override
	public String content(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		BoardVO view = mapper.content(id);
		view.setContent(view.getContent().replace("\r\n", "<br>"));
		model.addAttribute("view", view);
		return "/content";
	}
	
	@Override
	public String delete(BoardVO vo) {
		int id = vo.getId();
		String pwd = vo.getPwd();
		if(mapper.pwdCheck(id, pwd) == 1) {
			mapper.delete(id);
			return "redirect:/list";
		} else {
			return "redirect:/content?id="+id;
		}
	}
	
	@Override
	public String update(BoardVO vo, Model model) {
		int id = vo.getId();
		model.addAttribute("view", mapper.update(id));
		
		return "/update";
	}
	
	@Override
	public String update_ok(BoardVO vo) {
		int id = vo.getId();
		String pwd = vo.getPwd();
		if(mapper.pwdCheck(id, pwd) == 1) {
			mapper.update_ok(vo);
			return "redirect:/content?id="+id;
		} else {
			return "redirect:/update?id="+id;
		}
	}
	
}
