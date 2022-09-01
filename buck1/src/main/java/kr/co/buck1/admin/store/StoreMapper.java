package kr.co.buck1.admin.store;

import java.util.ArrayList;

import kr.co.buck1.admin.StoreVO;

public interface StoreMapper {

	public void store_write(StoreVO vo);
	public ArrayList<StoreVO> store_list();
	
	
}
