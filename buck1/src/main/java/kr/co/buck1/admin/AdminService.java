package kr.co.buck1.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {

	public String member(Model model, HttpServletRequest req);
	public String order(Model model);
	public void orderProgress(HttpServletRequest req, PrintWriter out);
	public String menu(Model model, HttpServletRequest req);
	public String menu_write(Model model);
	public String menu_write_ok(HttpServletRequest req);
	
}
