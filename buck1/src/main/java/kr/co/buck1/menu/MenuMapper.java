package kr.co.buck1.menu;

import java.util.ArrayList;

import kr.co.buck1.cart.CartVO;

public interface MenuMapper {

	public ArrayList<MenuVO> drink_list();
	public ArrayList<MenuVO> getOption(String name);
	public MenuVO getCate(String name);
	public String getCatename(String cate1, String cate2, String name);
	public int getPrice(String name, String size);
	public String getCode(String name, String size);
	public void insertCart(CartVO vo);
	
}
