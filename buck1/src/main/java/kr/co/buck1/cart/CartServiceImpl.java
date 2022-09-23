package kr.co.buck1.cart;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.buck1.member.MemberMapper;
import kr.co.buck1.member.MemberVO;

@Service
@Qualifier("cs")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Override
	public String list(HttpSession session, Model model, HttpServletRequest req) {
		model.addAttribute("list", mapper.list(session.getAttribute("userid").toString()));
		return "/cart/list";
	}
	@Override
	public String popup_store(Model model, HttpServletRequest req) {
		String keyword;
		
		if(req.getParameter("keyword") == null) {
			keyword = "";
		} else {
			keyword = req.getParameter("keyword");
		}
		
		model.addAttribute("store", mapper.storelist(keyword));
		model.addAttribute("total", mapper.getStoreTotal(keyword));
		
		return "/cart/popup_store";
	}
	
	@Override
	public void delete(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
//		userid = session.getAttribute("userid").toString();
		mapper.delete(id);
	}
	
	@Override
	public void unit_minus(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
		mapper.unit_minus(id);
	}
	
	@Override
	public void unit_plus(HttpServletRequest req) {
		String id;
		id = req.getParameter("id");
		mapper.unit_plus(id);
	}
	
	@Override
	public String cart_order(HttpServletRequest req, HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		
		MemberVO vo = mapper.getInfo(userid);
		model.addAttribute("member", vo);
		model.addAttribute("cart", mapper.list(userid));
		model.addAttribute("cost", req.getParameter("cost"));
		model.addAttribute("store_id", req.getParameter("store_id"));
		
		return "/cart/cart_order";
	}
	
	@Override
	public String popup_recharge(HttpSession session, Model model) {
		int money = mapper.recharge(session.getAttribute("userid").toString());
		model.addAttribute("balance", money);
		
		return "/cart/popup_recharge";
	}
	
	@Override
	public void popup_recharge_ok(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		String rechargeFare = req.getParameter("fare");
		
		mapper.popup_recharge_ok(rechargeFare, userid);
	}
	
	@Override
	public String cart_order_ok(HttpServletRequest req, HttpSession session, PrintWriter out) {
		String userid = session.getAttribute("userid").toString();
		int storeid = Integer.parseInt(req.getParameter("store_id"));
		
		/*
		 * A. 주문번호 구성 : YYYYMMDD + 일련번호 4자리 (ex. 202208030001)
		 * B. 주문번호 만들기
		 * 	1. 날짜객체를 이용하여 오늘 날짜 구하기
		 * 	2. DB에 오늘날짜의 주문번호가 있는지 확인
		 * 		2-1. 없다면, 주문번호를 '오늘날짜0001' 설정
		 * 		2-2. 있다면, 가장 큰 값 가져와서 +1로 설정 
		 */
		
		// 주문번호 만들기1. 날짜객체를 통해 오늘 날짜 구하기 
		LocalDate today = LocalDate.now();
		DecimalFormat dmFormat = new DecimalFormat("00");
		int year = today.getYear();
		String month = dmFormat.format(Double.valueOf(today.getMonthValue()));
		String day = dmFormat.format(Double.valueOf(today.getDayOfMonth()));
		String orderCode = year + month + day;
		
		// 주문번호 만들기2. 오늘날짜의 주문번호가 있는지 확인
		String oCode = mapper.getOrderCode(orderCode);
		if(oCode.equals("0")) {	// 없다면 0001 설정하기
			orderCode += "0001";
		} else {	// 있다면 가장 큰 값에 +1 설정하기
			Long codeNum = Long.parseLong(oCode) + 1;
			orderCode = Long.toString(codeNum);
		}
		
		// 구매테이블(purchase)에 구매내역 등록
		ArrayList<CartVO> vo = mapper.list(userid);
		for(int i=0; i<vo.size(); i++) {
			// 구매 테이블에 구매내역 추가
			String pcode = vo.get(i).getCode();
			int punit = vo.get(i).getUnit();
			mapper.orderOk(orderCode, userid, pcode, punit, storeid);
			
			// 장바구니(cart) 테이블에 상태값 변경
			mapper.cartStateChange(vo.get(i).getId());
		}
		
		// 스타벅스 카드로 결제시 금액 차감
		String payWithSbcard = req.getParameter("payWithSbcard");
		if(payWithSbcard != null) {
			mapper.payWithSbcard(Integer.parseInt(payWithSbcard), userid);
		}
		
		// 별(star) 추가
		int totalUnit = Integer.parseInt(req.getParameter("total_unit"));
		mapper.starAdd(userid, totalUnit);
		
		// 별(star) 갯수 확인
		int cntStar = mapper.getStar(userid);
		if(cntStar >= 12) {
			mapper.levelUp(userid, 2);
		} else if (cntStar >= 5) {
			mapper.levelUp(userid, 1);
		} else {}
		
		return "redirect:/member/myorder";
//		return "redirect:/cart/cart_order";
	}
	
	
	
}
