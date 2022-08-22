package kr.co.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.shop.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	@Qualifier("ls")
	private LoginService service;
}
