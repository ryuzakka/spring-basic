package kr.co.buck1.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.buck1.menu.MenuVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	
	@Override
	public String member(Model model, HttpServletRequest req) {
		
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
		total = mapper.memberGetTotal(keyword);
		if(pend > total)
			pend = total;
		
//		model.addAttribute("list", mapper.notice_list(keyword, index));
		model.addAttribute("member", mapper.member(keyword, index));

		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		
		return "/admin/member";
	}
	
	@Override
	public String order(Model model) {
		
		// 총 주문 수
		//int orderCount = mapper.getOrderCount();
		
		// 주문 목록 + 주문별 상품수
		model.addAttribute("order", mapper.getOrderItemCount());
		
		// 전체 주문
//		model.addAttribute("items", mapper.getOrderItemCount());
		model.addAttribute("items", mapper.order());
		
		return "/admin/order";
	}
	
	@Override
	public void orderProgress(HttpServletRequest req, PrintWriter out) {
		String orderCode = req.getParameter("orderCode");
		int state = Integer.parseInt(req.getParameter("state"));
		
		mapper.orderProgress(orderCode,state);
		
		out.print(state);
	}
	
	@Override
	public String menu(Model model, HttpServletRequest req) {
		
		// 키워드 검색어 처리
		String keyword;
		if(req.getParameter("keyword") == null) {
			keyword = "";
		} else {
			keyword = req.getParameter("keyword");
		}
		
		// 카테고리 처리
		String cateId;
		if(req.getParameter("cateid") == null)
			cateId = "01";
		else
			cateId = req.getParameter("cateid");
		
		model.addAttribute("drink", mapper.getCateDrink());
		model.addAttribute("menu", mapper.getMenu(keyword, cateId));
		return "/admin/menu";
	}
	
	@Override
	public String menu_write(Model model) {
		model.addAttribute("cate", mapper.getCateDrink());
		return "/admin/menu_write";
	}
	
	@Override
	public String menu_write_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("resources/menuimg");
		int size = 5*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 메뉴코드를 생성하기 위한 준비
		String menuCode, menuCate1, menuCate2, optionType, optionSize;
		menuCate1 = multi.getParameter("cate1");	// 12 자리
		menuCate2 = multi.getParameter("cate2");	// 34 자리
		optionType = multi.getParameter("type");	// 7 자리
		
		// 56자리 구하기
		String menuNum = mapper.codeGenerate(menuCate1, menuCate2, optionType);	
		if(!menuNum.equals("0")) {
			int temp = Integer.parseInt(menuNum);
			temp++;
			if(temp < 10) {					
				menuNum = "0" + Integer.toString(temp);
			} else {					
				menuNum = Integer.toString(temp);
			}
		} else {
			menuNum += "1";
		}
		
		// 등록할 Size를 배열에 담기
		String[] sizeStr = multi.getParameter("sizeArray").split(",");
		int optionSizeInt;
		
		// 사이즈 선택 수 만큼 메뉴 등록
		for(int i=0; i<sizeStr.length; i++) {
			
			// 메뉴코드 만들기
			/*	
			 * 총 8자리 => 12345678
			 * 		12 : 상위 카테고리
			 * 		34 : 하위 카테고리
			 * 		56 : 상품 번호
			 * 		78 : 타입+사이즈
			 */
			
			optionSize = sizeStr[i];					// 8 자리
			
			// 메뉴코드 생성
			menuCode = menuCate1 + menuCate2 + menuNum + optionType + optionSize;
			
			// size별 price 설정하기
			String price = "price" + optionSize;
			optionSizeInt = Integer.parseInt(optionSize);	// 선택한 사이즈를 int형으로 변환하여 사용
			/*switch(optionSizeInt) {
				case 1 : price = "price1";
				case 2 : price = "price2";
				case 3 : price = "price3";
				case 4 : price = "price4";
				default: price = "";
			}*/
			
			// MenuVO에 추가할 메뉴 정보 세팅
			MenuVO vo = new MenuVO();
			vo.setCate2(multi.getParameter("cate2"));
			vo.setCode(menuCode);
			vo.setName(multi.getParameter("menu_name"));
			vo.setImg(multi.getFilesystemName("menu_img"));
			vo.setType(Integer.parseInt(multi.getParameter("type")));
			vo.setSize(optionSizeInt);
			vo.setPrice(Integer.parseInt(multi.getParameter(price)));
			vo.setPriceStr(multi.getParameter(price));
			
			// Menu테이블에 MenuVO에 세팅한 값 등록
			mapper.setMenu(vo);
		}
		
		return "redirect:/admin/menu";
	}
	
	@Override
	public void menu_stateChange(HttpServletRequest req) {
		try {			
			mapper.menu_stateChange(req.getParameter("id"));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	@Override
	public String campaign(Model model) {
		model.addAttribute("list", mapper.campaignList());
		return "/admin/campaign";
	}
	
}
