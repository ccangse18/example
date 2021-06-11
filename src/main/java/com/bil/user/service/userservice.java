package com.bil.user.service;

import com.bil.user.vo.UserVO;

public interface userservice {
	
	public int userIdFind(String userId)throws Exception;
	
	//user insert
	public int userInsert(UserVO vo)throws Exception;
}
