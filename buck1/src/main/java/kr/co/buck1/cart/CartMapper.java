package kr.co.buck1.cart;

import java.util.ArrayList;

import kr.co.buck1.member.MemberVO;
import kr.co.buck1.store.FStoreVO;

public interface CartMapper {

	public ArrayList<CartVO> list(String userid);
	public ArrayList<FStoreVO> storelist(String keyword);
	public int getStoreTotal(String keyword);
	public void delete(String id);
	public void unit_minus(String id);
	public void unit_plus(String id);
	public MemberVO getInfo(String userid);
	
}
