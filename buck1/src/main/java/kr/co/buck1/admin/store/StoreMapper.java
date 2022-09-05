package kr.co.buck1.admin.store;

import java.util.ArrayList;

public interface StoreMapper {

	public void store_write(StoreVO vo);
	public ArrayList<StoreVO> store_list();
	public void store_state(String state, String id);
	public StoreVO store_content(String id);
	public void store_imgdel(String id);
	public void store_update(StoreVO vo);
	
	
}
