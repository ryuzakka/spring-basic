package kr.co.shop.service;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {

}
