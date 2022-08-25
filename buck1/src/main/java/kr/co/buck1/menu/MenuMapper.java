package kr.co.buck1.menu;

import java.util.ArrayList;

public interface MenuMapper {

	public ArrayList<MenuVO> drink_list();
	public ArrayList<MenuVO> getOption(String name);
	public MenuVO getCate(String name);
	public String getCatename(String cate1, String cate2, String name);
	public String getPrice(String name, String size);
	
}
