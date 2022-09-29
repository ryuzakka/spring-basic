package kr.co.buck1.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {

	// 회원 확인
	public String member(Model model, HttpServletRequest req);
	
	// 주문 관리
	public String order(Model model);
	public void orderProgress(HttpServletRequest req, PrintWriter out);
	
	// 메뉴 관리
	public String menu(Model model, HttpServletRequest req);
	public String menu_write(Model model);
	public String menu_write_ok(HttpServletRequest req);
	public void menu_stateChange(HttpServletRequest req);
	
	// 이벤트 관리
	public String campaign(Model model);
	
}
