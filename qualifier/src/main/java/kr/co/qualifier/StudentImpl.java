package kr.co.qualifier;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("s1")
public class StudentImpl implements Student {
	// 구현클래스 : 인터페이스의 추상메소드를 사용할 수 있도록 메소드의 내용을 재정의하는 것

	@Override
	public String output() {
		return "output";
	}
	
	
	
}
