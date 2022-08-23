package kr.co.buck1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String signin_ok(MemberVO vo, HttpSession session) {
		
		if(mapper.signin_ok(vo) == 1) {
			// 로그인 진행
			MemberVO mvo = mapper.getInfo(vo.getUserid());
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("nick", mvo.getNickname());
			
			return "/main/index";
		} else {
			// ID/PW 불일치
			return "redirect:/member/signin?err=1";
		}
		
	}
	
	@Override
	public String signup_ok(MemberVO vo) {
		mapper.signup_ok(vo);
		return "/member/signin";
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
}
