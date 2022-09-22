package kr.co.buck1.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {

	public String member(Model model, HttpServletRequest req);
	public String order(Model model);
	
}
