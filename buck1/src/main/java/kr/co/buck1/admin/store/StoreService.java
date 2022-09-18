package kr.co.buck1.admin.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StoreService {

	public String store_write_ok(HttpServletRequest req);
	public String store_list(Model model, HttpServletRequest req);
	public void store_state(HttpServletRequest req);
	public String store_update(HttpServletRequest req, Model model);
	public void store_imgdel(HttpServletRequest req);
	public String store_update_ok(HttpServletRequest req);
	
}
