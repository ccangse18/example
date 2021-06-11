package com.bil.user.service.impl;
import javax.annotation.Resource;
import javax.annotation.Resources;

import org.springframework.stereotype.Service;

import com.bil.user.service.userservice;
import com.bil.user.vo.UserVO;

@Service("userservice")
public class userserviceimpl implements userservice{
	
	/*@Resources(value="userDAO")*/
	
	@Resource(name="userDAO")
	private userDAO userDAO;
	
	@Override
	public int userIdFind(String userId) throws Exception {
		System.out.println("userIdFind");
		return userDAO.userIdfInd(userId);
	}

	@Override
	public int userInsert(UserVO vo) throws Exception {
		System.out.println("유저서비스 insert폼");
		return userDAO.userInsert(vo);
	}

}
