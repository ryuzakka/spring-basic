package kr.co.buck1.menu;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MenuService {

	public String drink_list(Model model);
	public String drink_content(HttpServletRequest req, Model model);
	public void getPrice(HttpServletRequest req, PrintWriter out);
	public String drink_order(HttpServletRequest req);
	
}
