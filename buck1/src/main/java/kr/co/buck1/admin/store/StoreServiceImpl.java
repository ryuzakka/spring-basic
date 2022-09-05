package kr.co.buck1.admin.store;

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
@Qualifier("ss")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper mapper;
	
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
		return "redirect:/admin_store/store_list";
	}
	
	@Override
	public String store_list(Model model) {
		model.addAttribute("list", mapper.store_list());
		return "/admin_store/store_list";
	}
	
	@Override
	public void store_state(HttpServletRequest req) {
		String id, state;
		id = req.getParameter("id");
		state = req.getParameter("state");
		mapper.store_state(state, id);
	}
	
	@Override
	public String store_update(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		model.addAttribute("content", mapper.store_content(id));
		return "/admin_store/store_update";
	}
	
	@Override
	public void store_imgdel(HttpServletRequest req) {
		String id = req.getParameter("id");
		String img = req.getParameter("img");
		mapper.store_imgdel(id);
		
		String path = req.getRealPath("resources/storeimg");
		File ff = new File(path+"/"+img);
		if(ff.exists()) // 존재하느냐
		  ff.delete();	// 파일 삭제
	}
	
	@Override
	public String store_update_ok(HttpServletRequest req) {
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
				
		File ff = new File(path+"/"+multi.getParameter("fname"));
		if(ff.exists())	ff.delete();
		
		StoreVO vo = new StoreVO();
		vo.setId(Integer.parseInt(multi.getParameter("id")));
		vo.setStorename(multi.getParameter("storename"));
		vo.setStoreimg(multi.getFilesystemName("storeimg"));
		vo.setAddr1(multi.getParameter("addr1"));
		vo.setAddr2(multi.getParameter("addr2"));
		vo.setLat(multi.getParameter("lat"));
		vo.setLng(multi.getParameter("lng"));
//		vo.setState(Integer.parseInt(multi.getParameter("state")));
		
		mapper.store_update(vo);
		return "redirect:/admin_store/store_list";
	}
	
	
	
}
