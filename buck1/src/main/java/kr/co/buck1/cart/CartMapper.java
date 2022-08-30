package kr.co.buck1.cart;

import java.util.ArrayList;

public interface CartMapper {

	public ArrayList<CartVO> list(String userid);
	public void delete(String id);
	public void unit_minus(String id);
	public void unit_plus(String id);
	
}
