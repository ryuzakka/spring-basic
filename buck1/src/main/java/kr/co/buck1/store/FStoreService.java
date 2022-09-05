package kr.co.buck1.store;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface FStoreService {

	public void keywordSearch(HttpServletRequest req, PrintWriter out);
}
