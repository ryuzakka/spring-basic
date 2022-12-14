package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.ProductService;
import kr.co.shop.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/product/pro_write")
	public String pro_write(Model model) {
		// 대분류의 내용을 읽어온다.
		return service.pro_write(model);
	}
	
	@RequestMapping("/product/getjung")
	public void getjung(HttpServletRequest req, PrintWriter out) {
		service.getjung(req, out);
	}
	
	@RequestMapping("/product/getso")
	public void getso(HttpServletRequest req, PrintWriter out) {
		service.getso(req, out);
	}
	
	@RequestMapping("/product/getpcode")
	public void getpcode(HttpServletRequest req, PrintWriter out) {
		service.getpcode(req, out);
	}
	
	@RequestMapping("/product/pro_write_ok")
	public void pro_write_ok(HttpServletRequest req) {
		service.pro_write_ok(req);
	}
	
	@RequestMapping("/product/pro_list")
	public String pro_list(HttpServletRequest req, Model model) {
		return service.pro_list(req, model);
	}
	
	
	
}
