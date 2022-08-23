package kr.co.buck1.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/signin")
	public String signin() {
		return "member/signin";
	}
	
	@RequestMapping("/member/signin_ok")
	public String signin_ok(MemberVO vo, HttpSession session) {
		return service.signin_ok(vo, session);
	}
	
	@RequestMapping("/member/signup")
	public String signup() {
		return "/member/signup";
	}
	
	@RequestMapping("/member/signup_ok")
	public String signup_ok(MemberVO vo) {
		return service.signup_ok(vo);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	
}
