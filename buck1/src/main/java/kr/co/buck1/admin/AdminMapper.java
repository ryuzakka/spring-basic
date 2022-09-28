package kr.co.buck1.admin;

import java.util.ArrayList;

import kr.co.buck1.member.MemberVO;
import kr.co.buck1.menu.MenuVO;
import kr.co.buck1.vo.PurchaseVO;

public interface AdminMapper {

	public ArrayList<MemberVO> member(String keyword, int index);
	public int memberGetTotal(String keyword);
	public ArrayList<PurchaseVO> order();
	public ArrayList<PurchaseVO> getOrderItemCount();
	
	// 주문 상태 변경
	public void orderProgress(String code, int state);
	
	public ArrayList<MenuVO> getMenu(String keyword, String cateid);
	public ArrayList<MenuVO> getCateDrink();
	public void setMenu(MenuVO vo);
	
}
