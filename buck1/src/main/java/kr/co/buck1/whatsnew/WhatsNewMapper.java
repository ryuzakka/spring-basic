package kr.co.buck1.whatsnew;

import java.util.ArrayList;

public interface WhatsNewMapper {

	// notice
	public void notice_write_ok(WhatsNewVO vo);
	public ArrayList<WhatsNewVO> notice_list(String keyword, int index);
	public WhatsNewVO notice_view(String id);
	public void notice_viewcnt(String id);
	public Integer getTotal(String keyword);
	public void notice_delete(String id);
	public void notice_update_ok(WhatsNewVO vo);
	
	// news
	public void news_write_ok(WhatsNewVO vo);
	public ArrayList<WhatsNewVO> news_list();
	public ArrayList<WhatsNewVO> news_rankList();
	public WhatsNewVO news_view(String id);
	public void news_viewcnt(String id);
	
	
	// campaign
	
	
}
