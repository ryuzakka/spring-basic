package kr.co.buck1.member;

public interface MemberMapper {

	public int signin_ok(MemberVO vo);
	public void signup_ok(MemberVO vo);
	public MemberVO getInfo(String userid);
	
}
