package kr.co.buck1.admin.store;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.buck1.admin.AdminMapper;
import kr.co.buck1.admin.StoreVO;

@Service
@Qualifier("ss")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public String store_write_ok(HttpServletRequest req) {
		MultipartRequest multi = null;
		String path = req.getRealPath("resources/storeimg");
		int size = 5*1024*1024;
		String enc = "utf-8";
		try {
			multi = new MultipartRequest(req,path,size,enc,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StoreVO vo = new StoreVO();
		vo.setStorename(multi.getParameter("storename"));
		vo.setStoreimg(multi.getFilesystemName("storeimg"));
		vo.setAddr1(multi.getParameter("addr1"));
		vo.setAddr2(multi.getParameter("addr2"));
		vo.setLat(multi.getParameter("lat"));
		vo.setLng(multi.getParameter("lng"));
		
		mapper.store_write(vo);
		return "redirect:/admin/store/store_list";
	}
	
	@Override
	public String store_list(Model model) {
		model.addAttribute("list", mapper.store_list());
		return "/admin/store/store_list";
	}
}
