package kr.co.buck1.cart;

import java.util.ArrayList;

public interface CartMapper {

	public ArrayList<CartVO> list(String userid);
	public void delete(String id);
	
	
}
