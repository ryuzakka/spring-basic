package kr.co.buck1.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String signup_ok(HttpServletRequest req) {
		return service.signup_ok(req);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	@RequestMapping("/member/signup_idcheck")
	public void signup_idcheck(HttpServletRequest req, PrintWriter out) {
		service.idcheck(req, out);
	}
	
	@RequestMapping("/member/signup_phonecheck")
	public void signup_phonecheck(HttpServletRequest req, PrintWriter out) {
		service.phonecheck(req, out);
	}
	
	@RequestMapping("/member/signup_success")
	public String signup_success() {
		return "/member/signup_success";
	}
	
	@RequestMapping("/member/search_id")
	public String search_id() {
		return "/member/search_id";
	}
	
	@RequestMapping("/member/search_id_ok")
	public String search_id_ok(MemberVO vo) {
		return service.search_id(vo);
	}
	
	@RequestMapping("/member/search_pwd")
	public String search_pwd() {
		return "/member/search_pwd";
	}
	
	@RequestMapping("/member/search_pwd_ok")
	public String search_pwd_ok(HttpServletRequest req) {
		return service.search_pwd(req);
	}
	
	@RequestMapping("/member/info")
	public String info(HttpSession session, Model model) {
		return service.info(session, model);
	}
	
	@RequestMapping("/member/info_update")
	public String info_update(HttpServletRequest req, Model model) {
		return service.info_update(req, model);
	}
	
	
	
}
