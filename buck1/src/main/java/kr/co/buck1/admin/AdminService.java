package kr.co.buck1.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {

	public String store_write_ok(HttpServletRequest req);
	public String store_list(Model model);
	
	
}
