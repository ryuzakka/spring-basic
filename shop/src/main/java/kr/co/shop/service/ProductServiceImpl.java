package kr.co.shop.service;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.JungVO;
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
			int num = Integer.parseInt(res.substring(7));
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
	
	
}
