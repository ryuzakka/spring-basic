package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ProductService {

	public String pro_write(Model model);
	public void getjung(HttpServletRequest req, PrintWriter out);
	public void getso(HttpServletRequest req, PrintWriter out);
	public void getpcode(HttpServletRequest req, PrintWriter out);
	
}
