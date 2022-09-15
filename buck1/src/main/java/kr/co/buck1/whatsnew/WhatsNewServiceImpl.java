package kr.co.buck1.whatsnew;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("wns")
public class WhatsNewServiceImpl implements WhatsNewService {

	@Autowired
	private WhatsNewMapper mapper;
	
	
	/*
	 * notice
	 */
	@Override
	public String notice_write_ok(WhatsNewVO vo) {
		mapper.notice_write_ok(vo);
		return "redirect:/whatsnew/notice_list";
	}
	
	@Override
	public String notice_list(Model model, HttpServletRequest req) {
		
		/* 검색 처리 */
		String keyword;
		if(req.getParameter("keyword") == null)
			keyword = "";
		else
			keyword = req.getParameter("keyword");
		
		/* 페이지 처리 */
		// 1. 페이지에 해당하는 레코드를 가져오기
		//	=> limit에 사용될 index값을 구해서 전달 : limit 시작 인덱스, 레코드갯수 
		int page, index;
		if(req.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}
		index = (page-1) * 10;
		
		// 2. 사용자에게 보여줄 링크를 처리하기 위한 값 구하기
		//	=> pstart, pend, total
		int pstart, pend, total;
		
		pstart = page / 10;
		if(page%10 == 0)	pstart--;
		pstart = (pstart*10) + 1;
		
		pend = pstart + 9;
		total = mapper.noticeGetTotal(keyword);
		if(pend > total)
			pend = total;
		
		model.addAttribute("list", mapper.notice_list(keyword, index));
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		
		return "/whatsnew/notice_list";
	}
	
	@Override
	public String notice_view(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		WhatsNewVO vo = mapper.notice_view(id);
		vo.setContent(vo.getContent().replace("\r\n", "<br>")); 
		model.addAttribute("notice", vo);
		return "/whatsnew/notice_view";
	}
	
	@Override
	public String notice_viewcnt(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.notice_viewcnt(id);
		return "redirect:/whatsnew/notice_view?id="+id;
	}
	
	@Override
	public String notice_delete(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.notice_delete(id);
		return "redirect:/whatsnew/notice_list";
	}
	
	@Override
	public String notice_update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		model.addAttribute("notice", mapper.notice_view(id));
		return "/whatsnew/notice_update";
	}
	
	@Override
	public String notice_update_ok(WhatsNewVO vo) {
		int id = vo.getId();
		mapper.notice_update_ok(vo);
		return "redirect:/whatsnew/notice_view?id="+id;
	}
	
	
	/*
	 * news
	 */
	@Override
	public String news_write_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("/resources/newsimg");
		int size = 10*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// thumbnail 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		File file = new File(path+"/"+multi.getParameter("thumbnail"));
		if(file.exists())	file.delete();
		
		// content 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		String[] imgs = multi.getParameter("wholecontent").split(",");
		for(int i=0; i<imgs.length; i++) {			
			file = new File(path+"/"+imgs[i]);
			if(file.exists())	file.delete();
		}
		
		int rank;
		if(multi.getParameter("rank") == null) {
			rank = 0;
		} else {
			rank = Integer.parseInt(multi.getParameter("rank"));
		}
		
		WhatsNewVO vo = new WhatsNewVO();
		vo.setCategory(Integer.parseInt(multi.getParameter("category")));
		vo.setRank(rank);
		vo.setThumbnail(multi.getFilesystemName("thumbnail"));
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("wholecontent"));
		mapper.news_write_ok(vo);
		
		return "redirect:/whatsnew/news_list";
	}
	
	@Override
	public String news_list(Model model, HttpServletRequest req) {
		
		/* 검색 처리 */
		String keyword;
		if(req.getParameter("keyword") == null)
			keyword = "";
		else
			keyword = req.getParameter("keyword");
		
		/* 페이지 처리 */
		// 1. 페이지에 해당하는 레코드를 가져오기
		//	=> limit에 사용될 index값을 구해서 전달 : limit 시작 인덱스, 레코드갯수 
		int page, index;
		if(req.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}
		index = (page-1) * 5;
		
		// 2. 사용자에게 보여줄 링크를 처리하기 위한 값 구하기
		//	=> pstart, pend, total
		int pstart, pend, total;
		
		pstart = page / 10;
		if(page%10 == 0)	pstart--;
		pstart = (pstart*10) + 1;
		
		pend = pstart + 9;
		total = mapper.newsGetTotal(keyword);
		if(pend > total)
			pend = total;
		
		model.addAttribute("list", mapper.news_list(keyword, index));
		model.addAttribute("rank", mapper.news_rankList(keyword));
//		model.addAttribute("list", mapper.notice_list(keyword, index));
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		
		return "/whatsnew/news_list";
	}
	
	@Override
	public String news_viewcnt(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.news_viewcnt(id);
		return "redirect:/whatsnew/news_view?id="+id;
	}
	
	@Override
	public String news_view(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		
		WhatsNewVO vo = mapper.news_view(id);
		String[] img = vo.getContent().split(",");
		
		model.addAttribute("news", vo);
		model.addAttribute("imgs", img);
		return "/whatsnew/news_view";
	}
	
	@Override
	public String news_delete(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.news_delete(id);
		return "redirect:/whatsnew/news_list";
	}
	
	@Override 
	public String news_update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		WhatsNewVO vo = mapper.news_view(id);
		String[] img = vo.getContent().split(",");
		
		model.addAttribute("news", vo);
		model.addAttribute("imgs", img);
		return "/whatsnew/news_update";
	}
	
	@Override
	public String news_update_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("/resources/newsimg");
		int size = 10*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String id = multi.getParameter("id");
		
		// thumbnail 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		File file = new File(path+"/"+multi.getParameter("thumbnail"));
		if(file.exists())	file.delete();
		
		// content 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		String[] imgs = multi.getParameter("wholecontent").split(",");
		for(int i=0; i<imgs.length; i++) {			
			file = new File(path+"/"+imgs[i]);
			if(file.exists())	file.delete();
		}
		
		WhatsNewVO vo = new WhatsNewVO();
		vo.setId(Integer.parseInt(id));
		vo.setCategory(Integer.parseInt(multi.getParameter("category")));
		vo.setRank(Integer.parseInt(multi.getParameter("rank")));
		vo.setThumbnail(multi.getFilesystemName("thumbnail"));	// 파일시스템
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("wholecontent"));		// 파일시스템
		
		mapper.news_update_ok(vo);
		
		return "redirect:/whatsnew/news_view?id="+id;
	}
	
	
	/*
	 * campaign
	 */
	@Override
	public String campaign_write_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("resources/campaignimg");
		int size = 10*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// thumbnail 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		File file = new File(path+"/"+multi.getParameter("thumbnail"));
		if(file.exists())	file.delete();
		
		// content 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제	
		file = new File(path+"/"+multi.getParameter("content"));
		if(file.exists())	file.delete();
		
		WhatsNewVO vo = new WhatsNewVO();
		vo.setCategory(Integer.parseInt(multi.getParameter("category")));
		vo.setThumbnail(multi.getFilesystemName("thumbnail"));
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getFilesystemName("content"));
		vo.setStartdate(multi.getParameter("startdate"));
		vo.setEnddate(multi.getParameter("enddate"));
		mapper.campaign_write_ok(vo);
		
		return "redirect:/whatsnew/campaign_list";
	}
	
	@Override
	public String campaign_list(Model model, HttpServletRequest req) {
		
		/* 검색 처리 */
		String keyword;
		if(req.getParameter("keyword") == null)
			keyword = "";
		else
			keyword = req.getParameter("keyword");
		
		model.addAttribute("list", mapper.campaign_list(keyword));
		model.addAttribute("keyword", keyword);
		
		return "/whatsnew/campaign_list";
	}
	
	@Override
	public String campaign_viewcnt(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.campaign_viewcnt(id);
		return "redirect:/whatsnew/campaign_view?id="+id;
	}
	
	@Override
	public String campaign_view(Model model, HttpServletRequest req) {
		model.addAttribute("view", mapper.campaign_view(req.getParameter("id")));
		return "/whatsnew/campaign_view";
	}
	
	@Override
	public String campaign_delete(HttpServletRequest req) {
		String id = req.getParameter("id");
		mapper.campaign_delete(id);
		return "redirect:/whatsnew/campaign_list";
	}
	
	@Override
	public String campaign_update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		model.addAttribute("camp", mapper.campaign_view(id));
		return "/whatsnew/campaign_update";
	}
	
	@Override
	public String campaign_update_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("resources/campaignimg");
		int size = 10*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int id = Integer.parseInt(multi.getParameter("id"));
		
		// thumbnail 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제
		File file = new File(path+"/"+multi.getParameter("thumbnail"));
		if(file.exists())	file.delete();
		
		// content 업로드 파일 변경 시 파일명이 동일할 경우 기존 이미지 삭제	
		file = new File(path+"/"+multi.getParameter("content"));
		if(file.exists())	file.delete();
		
		WhatsNewVO vo = new WhatsNewVO();
		vo.setId(id);
		vo.setCategory(Integer.parseInt(multi.getParameter("category")));
		vo.setThumbnail(multi.getFilesystemName("thumbnail"));
		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getFilesystemName("content"));
		vo.setStartdate(multi.getParameter("startdate"));
		vo.setEnddate(multi.getParameter("enddate"));
		mapper.campaign_update_ok(vo);
		
		return "redirect:/whatsnew/campaign_view?id=" + id;
	}
	
}
