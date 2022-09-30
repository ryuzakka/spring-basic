package kr.co.buck1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Qualifier("hs")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeMapper mapper;
	
	@Override
	public String main(Model model) {
		
		model.addAttribute("notice", mapper.main_notice_list());
		model.addAttribute("news", mapper.main_news_list());
		model.addAttribute("campaign", mapper.main_campaign_list());
		
		return "main/index";
	}
	
}
