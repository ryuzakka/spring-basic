package kr.co.buck1.whatsnew;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WhatsNewService {

	// notice
	public String notice_write_ok(WhatsNewVO vo);
	public String notice_list(Model model, HttpServletRequest req);
	public String notice_view(Model model, HttpServletRequest req);
	public String notice_viewcnt(HttpServletRequest req);
	public String notice_delete(HttpServletRequest req);
	public String notice_update(HttpServletRequest req, Model model);
	public String notice_update_ok(WhatsNewVO vo);
	
	
	// news
	
	
	//campaign
	
	
}
