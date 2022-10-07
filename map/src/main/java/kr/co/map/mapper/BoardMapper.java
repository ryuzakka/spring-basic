package kr.co.map.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface BoardMapper {

	public ArrayList<HashMap<String,String>> list();
	public void readnum(String id);
	public void readnum2(HashMap map);
	public HashMap<String,String> content(String id);
	public void write_ok(HashMap<String,String> map);
	
}
