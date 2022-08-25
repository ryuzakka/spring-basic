package kr.co.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.MemberService;
import kr.co.shop.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/memberinput")
	public String memberinput() {
		return "/member/memberinput";
	}
	
	@RequestMapping("/member/memberinput_ok")
	public String memberinput_ok(MemberVO vo) {
		return service.memberinput_ok(vo);
	}
	
	
}
