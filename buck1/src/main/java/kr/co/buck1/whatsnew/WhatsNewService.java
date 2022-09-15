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
	public String news_write_ok(HttpServletRequest req);
	public String news_list(Model model, HttpServletRequest req);
	public String news_view(HttpServletRequest req, Model model);
	public String news_viewcnt(HttpServletRequest req);
	public String news_delete(HttpServletRequest req);
	public String news_update(HttpServletRequest req, Model model);
	public String news_update_ok(HttpServletRequest req);
	
	//campaign
	public String campaign_write_ok(HttpServletRequest req);
	public String campaign_list(Model model, HttpServletRequest req);
	public String campaign_viewcnt(HttpServletRequest req);
	public String campaign_view(Model model, HttpServletRequest req);
	public String campaign_delete(HttpServletRequest req);
	public String campaign_update(HttpServletRequest req, Model model);
	public String campaign_update_ok(HttpServletRequest req);
	
}
