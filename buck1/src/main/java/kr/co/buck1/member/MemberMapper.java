package kr.co.buck1.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

public interface MemberMapper {

	public int signin_ok(MemberVO vo);
	public void signup_ok(MemberVO vo);
	public MemberVO getInfo(String userid);
	public int idcheck(String userid);
	public int phonecheck(String phone);
	public String search_id(String phone);
	public MemberVO search_pwd(String userid, String phone);
	public void info_update_ok(String nick, String email, String id);
	public void withdrawal(String userid);
	
}
