package kr.co.buck1.store;

import java.util.ArrayList;

public interface FStoreMapper {

	public ArrayList<FStoreVO> keywordSearch(String key);
	public ArrayList<FStoreVO> storeList();
	
}
