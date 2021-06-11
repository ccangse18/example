package com.bil.login.service;

import org.springframework.stereotype.Service;

import com.bil.user.vo.UserVO;


@Service
public interface LoginService {

	public UserVO userLogin(UserVO vo);

}
