package kr.co.buck1.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public interface AdminMapper {

	public void store_write(StoreVO vo);
	public ArrayList<StoreVO> store_list();
	
	
	
}
