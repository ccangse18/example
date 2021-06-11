package com.bil.login.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bil.login.service.LoginService;
import com.bil.user.vo.UserVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
//@Service("LoginService")
@Service
public class LoginServiceimpl extends EgovAbstractMapper implements LoginService{
	//userDAO를 불러 주기 위해 선언

	@Autowired
	private LoginDAO loginDAO;


	//로그인 서비스
	@Override
	public UserVO userLogin(UserVO vo){
		System.out.println("로그인 서비스");
		System.out.println(vo);
		System.out.println("여기왔다.");

		return loginDAO.userLogin(vo);
	}


}
