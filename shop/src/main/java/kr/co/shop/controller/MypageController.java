package kr.co.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.shop.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms2")
	private MypageService service;
}
