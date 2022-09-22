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
	public int recharge(String userid);
	public void popup_recharge_ok(String fare, String userid);
	
	// 주문번호 만들기
	public String getOrderCode(String orderCode);
	
	// 구매내역 추가
	public void orderOk(String orderCode, String userid, String proCode, int unit, int storeid);
	
	// 장바구니 상태변경 : 구매전->구매후
	public void cartStateChange(int id);
	
	// 스타벅스 카드로 결제시 금액 차감
	public void payWithSbcard(int cost, String userid);
	
}
