package kr.co.data;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
	
	@RequestMapping("/")
	public String home() {
		return "/home";
	}
	
	/* 파라미터 처리 방법 */
	// 1. request.getParameter
	@RequestMapping("data1")
	public String data1(HttpServletRequest req, Model model) {

		// 파라미터 처리를 컨트롤러가 담당한다.
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		// model은 request영역에 만들어짐
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/data1";
	}
	
	// 2. Annotation => @RequestParam
	@RequestMapping("/data2")
	public String data2(@RequestParam("name") String name, @RequestParam("age") String age, Model model) {
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/data2";
	}
	
	// 3. 메소드의 매개변수 자리에 변수 선언
	@RequestMapping("/data3")
	public String data3(String name, String age, Model model) {
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/data2";
	}
	
	// 4. DTO
	@RequestMapping("/data4")
	public String data4(MyDto dto, Model model) {
		
		// 하나씩 추가
		model.addAttribute("name", dto.getName());
		model.addAttribute("age", dto.getAge());
		model.addAttribute("phone", dto.getPhone());
		model.addAttribute("addr", dto.getAddr());
		
		// 객체를 추가
		model.addAttribute("mydto", dto);
		
		return "/data4";
	}
	
	// 5. PathVariable
	@RequestMapping("/data5/{name}/{age}")
	public String data5(@PathVariable String name, @PathVariable String age, Model model) {
		
		return "/data5";
	}
	
	
}
