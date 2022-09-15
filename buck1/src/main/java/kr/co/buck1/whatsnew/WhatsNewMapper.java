package kr.co.buck1.whatsnew;

import java.util.ArrayList;

public interface WhatsNewMapper {

	// notice
	public void notice_write_ok(WhatsNewVO vo);
	public ArrayList<WhatsNewVO> notice_list(String keyword, int index);
	public WhatsNewVO notice_view(String id);
	public void notice_viewcnt(String id);
	public Integer noticeGetTotal(String keyword);
	public void notice_delete(String id);
	public void notice_update_ok(WhatsNewVO vo);
	
	// news
	public void news_write_ok(WhatsNewVO vo);
	public ArrayList<WhatsNewVO> news_list(String keyword, int index);
	public ArrayList<WhatsNewVO> news_rankList(String keyword);
	public WhatsNewVO news_view(String id);
	public void news_viewcnt(String id);
	public void news_delete(String id);
	public void news_update_ok(WhatsNewVO vo);
	public Integer newsGetTotal(String keyword);
	
	// campaign
	public void campaign_write_ok(WhatsNewVO vo);
	public ArrayList<WhatsNewVO> campaign_list(String keword);
	public void campaign_viewcnt(String id);
	public WhatsNewVO campaign_view(String id);
	public void campaign_delete(String id);
	public void campaign_update_ok(WhatsNewVO vo);
	
}
