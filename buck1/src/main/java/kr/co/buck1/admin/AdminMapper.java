package kr.co.buck1.admin;

import java.util.ArrayList;

import kr.co.buck1.member.MemberVO;
import kr.co.buck1.menu.MenuVO;
import kr.co.buck1.vo.PurchaseVO;
import kr.co.buck1.whatsnew.WhatsNewVO;

public interface AdminMapper {

	public ArrayList<MemberVO> member(String keyword, int index);
	public int memberGetTotal(String keyword);
	public ArrayList<PurchaseVO> order();
	public ArrayList<PurchaseVO> getOrderItemCount();
	
	// 주문 상태 변경
	public void orderProgress(String code, int state);
	
	// 메뉴 조회
	public ArrayList<MenuVO> getMenu(String keyword, String cateid);
	// 메뉴 카테고리 조회
	public ArrayList<MenuVO> getCateDrink();
	// 메뉴 추가(등록)
	public void setMenu(MenuVO vo);
	// 메뉴 코드 생성을 위한 조회
	public String codeGenerate(String cate1, String cate2, String type);
	// 메뉴 상태 변경
	public void menu_stateChange(String id);
	
	// 이벤트 전체 조회
	public ArrayList<WhatsNewVO> campaignList();
	
}
