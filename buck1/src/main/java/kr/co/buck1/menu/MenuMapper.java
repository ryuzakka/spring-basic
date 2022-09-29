package kr.co.buck1.menu;

import java.util.ArrayList;

import kr.co.buck1.cart.CartVO;
import kr.co.buck1.member.MemberVO;

public interface MenuMapper {

	public ArrayList<MenuVO> drink_list(String cate2);
	public ArrayList<MenuVO> getOption(String name);
	public MenuVO getCate(String name);
	public String getCatename(String cate1, String cate2, String name);
	public int getPrice(String name, String size);
	public String getCode(String name, String size);
	public void insertCart(CartVO vo);
	public int login_ok(String userid, String pwd);
	public MemberVO getInfo(String userid);
	
}
