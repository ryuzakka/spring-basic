package kr.co.buck1.admin;

import java.util.ArrayList;

import kr.co.buck1.member.MemberVO;
import kr.co.buck1.vo.PurchaseVO;

public interface AdminMapper {

	public ArrayList<MemberVO> member(String keyword, int index);
	public int memberGetTotal(String keyword);
	public ArrayList<PurchaseVO> order();
	public ArrayList<PurchaseVO> getOrderItemCount();
	
}
