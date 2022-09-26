package kr.co.buck1;

import java.util.ArrayList;

import kr.co.buck1.whatsnew.WhatsNewVO;

public interface HomeMapper {

	public ArrayList<WhatsNewVO> main_notice_list();
	public ArrayList<WhatsNewVO> main_news_list();
	public ArrayList<WhatsNewVO> main_campaign_list();
	
}
