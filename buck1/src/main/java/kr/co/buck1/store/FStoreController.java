package kr.co.buck1.store;

import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FStoreController {

	@Autowired
	@Qualifier("ss")
	private FStoreService service;
	
	@RequestMapping("/store/store_map")
	public String store_map() {
		return "/store/store_map";
	}
	
	@RequestMapping("/store/keyword_search")
	public void keyword_search(HttpServletRequest req, PrintWriter out) {
		service.keywordSearch(req, out);
	}
	
}