package kr.co.buck1.whatsnew;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WhatsNewController {

	@Autowired
	@Qualifier("wns")
	private WhatsNewService service;
	
	/*
	 * notice
	 */
	@RequestMapping("/whatsnew/notice_write")
	public String notice_write() {
		return "/whatsnew/notice_write";
	}
	
	@RequestMapping("/whatsnew/notice_write_ok")
	public String notice_write_ok(WhatsNewVO vo) {
		return service.notice_write_ok(vo);
	}
	
	@RequestMapping("/whatsnew/notice_list")
	public String notice_list(Model model, HttpServletRequest req) {
		return service.notice_list(model, req);
	}
	
	@RequestMapping("/whatsnew/notice_view")
	public String notice_view(Model model, HttpServletRequest req) {
		return service.notice_view(model, req);
	}
	
	@RequestMapping("/whatsnew/notice_viewcnt")
	public String notice_viewcnt(HttpServletRequest req) {
		return service.notice_viewcnt(req);
	}
	
	@RequestMapping("/whatsnew/notice_delete")
	public String notice_delete(HttpServletRequest req) {
		return service.notice_delete(req);
	}
	
	@RequestMapping("/whatsnew/notice_update")
	public String notice_update(HttpServletRequest req, Model model) {
		return service.notice_update(req, model);
	}
	
	@RequestMapping("/whatsnew/notice_update_ok")
	public String notice_update_ok(WhatsNewVO vo) {
		return service.notice_update_ok(vo);
	}
	
	
	/*
	 * news
	 */
	@RequestMapping("/whatsnew/news_write")
	public String news_write() {
		return "/whatsnew/news_write";
	}
	
	@RequestMapping("/whatsnew/news_write_ok")
	public String news_write_ok(HttpServletRequest req) {
		return service.news_write_ok(req);
	}
	@RequestMapping("/whatsnew/news_list")
	public String news_list(Model model, HttpServletRequest req) {
		return service.news_list(model, req);
	}
	
	@RequestMapping("/whatsnew/news_viewcnt")
	public String news_viewcnt(HttpServletRequest req) {
		return service.news_viewcnt(req);
	}
	
	@RequestMapping("/whatsnew/news_view")
	public String news_view(HttpServletRequest req, Model model) {
		return service.news_view(req, model);
	}
	
	@RequestMapping("/whatsnew/news_delete")
	public String news_delete(HttpServletRequest req) {
		return service.news_delete(req);
	}
	
	@RequestMapping("/whatsnew/news_update")
	public String news_update(HttpServletRequest req, Model model) {
		return service.news_update(req, model);
	}
	
	@RequestMapping("/whatsnew/news_update_ok")
	public String news_update_ok(HttpServletRequest req) {
		return service.news_update_ok(req);
	}
	
	
	/*
	 * campaign
	 */
	@RequestMapping("/whatsnew/campaign_write")
	public String campaign_write() {
		return "/whatsnew/campaign_write";
	}
	@RequestMapping("/whatsnew/campaign_write_ok")
	public String campaign_write_ok(HttpServletRequest req) {
		return service.campaign_write_ok(req);
	}
	@RequestMapping("/whatsnew/campaign_list")
	public String campaign_list(Model model, HttpServletRequest req) {
		return service.campaign_list(model, req);
	}
	@RequestMapping("/whatsnew/campaign_viewcnt")
	public String campaign_viewcnt(HttpServletRequest req) {
		return service.campaign_viewcnt(req);
	}
	@RequestMapping("/whatsnew/campaign_view")
	public String campaign_view(Model model, HttpServletRequest req) {
		return service.campaign_view(model, req);
	}
	@RequestMapping("/whatsnew/campaign_delete")
	public String campaign_delete(HttpServletRequest req) {
		return service.campaign_delete(req);
	}
	@RequestMapping("/whatsnew/campaign_update")
	public String campaign_update(HttpServletRequest req, Model model) {
		return service.campaign_update(req, model);
	}
	@RequestMapping("/whatsnew/campaign_update_ok")
	public String campaign_update_ok(HttpServletRequest req) {
		return service.campaign_update_ok(req);
	}
	
}
