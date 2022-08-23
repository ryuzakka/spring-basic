package kr.co.buck1.member;

import javax.servlet.http.HttpSession;

public interface MemberService {

	public String signin_ok(MemberVO vo, HttpSession session);
	public String signup_ok(MemberVO vo);
	public String logout(HttpSession session);
	
}
