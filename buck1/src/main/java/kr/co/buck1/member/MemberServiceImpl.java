package kr.co.buck1.member;

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

import kr.co.buck1.vo.PurchaseVO;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String signin_ok(MemberVO vo, HttpSession session) {
		
		if(mapper.signin_ok(vo) == 1) {
			// 로그인 진행
			MemberVO mvo = mapper.getInfo(vo.getUserid());
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("nick", mvo.getNickname());
			
			return "/main/index";
		} else {
			// ID/PW 불일치
			return "redirect:/member/signin?err=1";
		}
		
	}
	
	@Override
	public String signup_ok(HttpServletRequest req) {
		String birth, email;
		birth = req.getParameter("birth1") + req.getParameter("birth2") + req.getParameter("birth3");
		email = req.getParameter("email1") +"@"+ req.getParameter("email2");

		MemberVO vo = new MemberVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setPwd(req.getParameter("pwd2"));
		vo.setUsername(req.getParameter("username"));
		vo.setNickname(req.getParameter("nickname"));
		vo.setPhone(req.getParameter("phone"));
		vo.setBirth(birth);
		vo.setEmail(email);
		
		mapper.signup_ok(vo);
		return "/member/signup_success";
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
	@Override
	public void idcheck(HttpServletRequest req, PrintWriter out) {
		out.print(mapper.idcheck(req.getParameter("userid")));
	}
	
	@Override
	public void phonecheck(HttpServletRequest req, PrintWriter out) {
		out.print(mapper.phonecheck(req.getParameter("phone")));
	}
	
	@Override
	public String search_id(MemberVO vo) {
		String userid = mapper.search_id(vo.getPhone());
		if(userid == null)
			return "redirect:/member/search_id?err=1";
		else
			return "redirect:/member/search_id?userid="+userid;
	}
	
	@Override
	public String search_pwd(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		String phone = req.getParameter("phone");
		
		if(mapper.search_pwd(userid, phone) == null) {
			return "redirect:/member/search_pwd?err=1";
		} else {
			MemberVO mvo = mapper.search_pwd(userid, phone);
			userid = mvo.getUserid();
			String pwd = mvo.getPwd();
			return "redirect:/member/search_pwd?userid="+userid+"&pwd="+pwd;
		}
	}
	
	@Override
	public String info(HttpSession session, Model model) {
		model.addAttribute("my", mapper.getInfo(session.getAttribute("userid").toString()));
		return "/member/info";
	}
	
	@Override
	public String info_update(HttpServletRequest req, Model model) {
		MemberVO vo = mapper.getInfo(req.getParameter("userid"));
		String[] mail;
		mail = vo.getEmail().split("@");
		
		model.addAttribute("my", vo);
		model.addAttribute("email1", mail[0]);
		model.addAttribute("email2", mail[1]);
		return "/member/info_update";
	}
	
	@Override
	public String info_update_ok(HttpServletRequest req) {
		String email, nick, id;
		email = req.getParameter("email1") +"@"+ req.getParameter("email2");
		nick = req.getParameter("nickname");
		id = req.getParameter("id");
		
		mapper.info_update_ok(nick, email, id);
		return "redirect:/member/info";
	}
	
	@Override
	public String withdrawal(HttpSession session) {
		mapper.withdrawal(session.getAttribute("userid").toString());
		session.invalidate();
		return "redirect:/member/withdrawal_ok";
	}
	
	@Override
	public String sbcard_charge(HttpSession session, Model model) {
		int money = mapper.sbcard_charge(session.getAttribute("userid").toString());
		model.addAttribute("balance", money);
		return "/member/sbcard_charge";
	}
	
	@Override
	public String sbcard_recharge(HttpServletRequest req) {
		String rechargeFare = req.getParameter("fare");
		String userid = req.getParameter("userid");
		mapper.sbcard_recharge(rechargeFare, userid);
		return "/member/sbcard_charge";
	}
	
	@Override
	public String myOrder(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		
		// 오늘 날짜 구하기
		LocalDate today = LocalDate.now();
		DecimalFormat dmFormat = new DecimalFormat("00");
		int year = today.getYear();
		String month = dmFormat.format(Double.valueOf(today.getMonthValue()));
		String day = dmFormat.format(Double.valueOf(today.getDayOfMonth()));
		
		String oCode = year + month + day;	// 오늘 날짜로 주문번호 앞 8자리 생성
		
		// 구매정보 + 메뉴정보 가져오기
//		ArrayList<PurchaseVO> orderList = ;
		model.addAttribute("order", mapper.myOrder(userid, oCode));
		
		// 주문번호 + 주문매장
		model.addAttribute("store", mapper.myOrderStore(userid, oCode));
		
		return "/member/myorder";
	}
	
}
