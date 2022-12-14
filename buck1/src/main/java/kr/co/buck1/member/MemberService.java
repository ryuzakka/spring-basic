package kr.co.buck1.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {

	public String signin_ok(HttpServletRequest req, HttpSession session);
	public String signup_ok(HttpServletRequest req);
	public String logout(HttpSession session);
	public void idcheck(HttpServletRequest req, PrintWriter out);
	public void phonecheck(HttpServletRequest req, PrintWriter out);
	public String search_id(HttpServletRequest req);
	public String search_pwd(HttpServletRequest req);
	public String info(HttpSession session, Model model);
	public String info_update(HttpServletRequest req, Model model);
	public String info_update_ok(HttpServletRequest req); 
	public String withdrawal(HttpSession session);
	public String sbcard_charge(HttpSession session, Model model);
	public String sbcard_recharge(HttpServletRequest req);
	public String myOrder(HttpSession session, Model model);
	
}
