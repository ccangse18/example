package com.bil.login.service.impl;

import org.springframework.stereotype.Repository;
import com.bil.user.vo.UserVO;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("LoginDAO")
public class LoginDAO extends EgovAbstractMapper{
	//유저 login DAO
		public UserVO userLogin(UserVO vo){
			System.out.println("여기 안왔지?");
			return selectOne("Login.userLogin", vo);
		}


		public void userLogin1(){
			System.out.println("여기 안왔지?");
//			return selectOne("Login.userLogin", vo);
		}
}
