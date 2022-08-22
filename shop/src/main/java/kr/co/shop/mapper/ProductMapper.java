package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.DaeVO;
import kr.co.shop.vo.JungVO;
import kr.co.shop.vo.SoVO;

public interface ProductMapper {

	public ArrayList<DaeVO> pro_write();
	public ArrayList<JungVO> getjung(String daecode);
	public ArrayList<SoVO> getso(String daejung);
	public String getpcode(String daejungso);
	
}
