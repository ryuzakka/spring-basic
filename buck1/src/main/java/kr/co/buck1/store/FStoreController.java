package kr.co.buck1.store;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FStoreController {

	@Autowired
	@Qualifier("fs")
	private FStoreService service;
	
	@RequestMapping("/store/store_map")
	public String store_map() {
		return "/store/store_map";
	}
	
	@RequestMapping(value="/store/keyword_search", produces = "text/html; charset=utf-8")
	public void keyword_search(HttpServletRequest req, PrintWriter out) {
		service.keywordSearch(req, out);
	}
	
	@RequestMapping("/store/store_info")
	public String storeList(Model model, HttpServletRequest req) {
		return service.storeList(model, req);
	}
	
}