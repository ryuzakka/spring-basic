package kr.co.buck1.member;

import java.util.ArrayList;

import kr.co.buck1.vo.PurchaseVO;

public interface MemberMapper {

	public int signin_ok(String userid, String pwd);
	public void signup_ok(MemberVO vo);
	public String stateCheck(String userid);
	public MemberVO getInfo(String userid);
	public int idcheck(String userid);
	public int phonecheck(String phone);
	public String search_id(String phone);
	public MemberVO search_pwd(String userid, String phone);
	public void info_update_ok(String nick, String email, String id);
	public void withdrawal(String userid);
	public int sbcard_charge(String userid);
	public void sbcard_recharge(String fare, String userid);
	public ArrayList<PurchaseVO> myOrder(String userid, String oCode);
	public ArrayList<PurchaseVO> myOrderStore(String userid, String oCode);
	
}
