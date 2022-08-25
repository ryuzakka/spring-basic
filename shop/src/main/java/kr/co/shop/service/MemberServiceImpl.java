package kr.co.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.shop.mapper.MemberMapper;
import kr.co.shop.vo.MemberVO;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String memberinput_ok(MemberVO vo) {
		mapper.memberinput(vo);
		return "/login/login";
	}
	
	
	
	
	
}
