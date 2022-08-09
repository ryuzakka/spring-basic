package kr.co.buck1.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/member/signin")
	public String signin() {
		return "/member/signin";
	}
	
	@RequestMapping("/member/signin_ok")
	public String signin_ok(MemberDto dto, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		if(dao.signup(dto) == 1) {
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("username", dto.getUsername());
			
			return "redirect:/menu/";
		} else {
			
			return "redirect:/member/signin?err=1";
		}
	}
	
	@RequestMapping("/member/signup")
	public String signup() {
		return "redirect:/member/signup_ok";
	}
}
