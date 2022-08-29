package kr.co.shop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.JungVO;
import kr.co.shop.vo.ProductVO;
import kr.co.shop.vo.SoVO;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String pro_write(Model model) {
		model.addAttribute("dae", mapper.pro_write());
		
		return "/product/pro_write";
	}
	
	@Override
	public void getjung(HttpServletRequest req, PrintWriter out) {
		String daeCode = req.getParameter("daecode");
		ArrayList<JungVO> list = mapper.getjung(daeCode);
		
		/* option태그 만들어서 전달 */
		String str = "";
		str += "<option>- "+URLEncoder.encode("중분류")+" -</option>";
		for(int i=0; i<list.size(); i++) {
			JungVO jvo = list.get(i);
			str += "<option value='"+jvo.getCode()+"'>"+URLEncoder.encode(jvo.getTitle())+"</option>";
		}
		
		out.print(str);
	}
	
	@Override
	public void getso(HttpServletRequest req, PrintWriter out) {
		String daeCode = req.getParameter("daecode");
		String jungCode = req.getParameter("jungcode");
		String daejung = daeCode+jungCode;
		ArrayList<SoVO> list = mapper.getso(daejung);
		
		String str = "";
		str += "<option>- "+URLEncoder.encode("소분류")+" -</option>";
		for(int i=0; i<list.size(); i++) {
			SoVO svo = list.get(i);
			str += "<option value='"+svo.getCode()+"'>"+URLEncoder.encode(svo.getTitle())+"</option>";
		}
		
		out.print(str);
	}
	
	@Override
	public void getpcode(HttpServletRequest req, PrintWriter out) {
		String daejungso = req.getParameter("djs");
		String res = mapper.getpcode(daejungso);
		//out.print(res);
		String pcode = "";
		
		if(res.length() == 1) {
			pcode = daejungso + "001";
		} else {
			int num = Integer.parseInt(res);
			String code = "";
			if(num < 9) {
				code = "00" + (num+1);
			} else if(num < 99) {
				code = "0" + (num+1);
			} else {
				code = "" + (num+1);
			}
			pcode = daejungso + code;
		}
		
		out.print(pcode);
	}
	
	@Override
	public String pro_write_ok(HttpServletRequest req) {
		// 라이브러리를 이용하여 폼태그에 값을 가져오기
		MultipartRequest multi = null;
		String path = req.getRealPath("resources/prod_img");
		int size = 20*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// return "redirect:error";		// 이와 같은 방식으로 에러메세지를 출력하면 된다.
		}
		
		// form값 가져오기 => ProductVO에 넣기
		ProductVO pvo = new ProductVO();
		pvo.setPcode(multi.getParameter("pcode"));
		pvo.setPimg(multi.getFilesystemName("pimg"));
		pvo.setCimg(multi.getFilesystemName("cimg"));
		pvo.setTitle(multi.getParameter("title"));
		pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		pvo.setMade(multi.getParameter("made"));
		pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
		pvo.setSu(Integer.parseInt(multi.getParameter("su")));
		pvo.setBaesong(Integer.parseInt(multi.getParameter("baesong")));
		pvo.setBaeday(Integer.parseInt(multi.getParameter("baeday")));
		
		mapper.pro_write_ok(pvo);
		return "/product/pro_list";
	}
	
	@Override
	public String pro_list(HttpServletRequest req, Model model) {
		model.addAttribute("list", mapper.list(req.getParameter("pcode")));
		return "/product/pro_list";
	}
	
	
}
