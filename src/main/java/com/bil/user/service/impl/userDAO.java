package com.bil.user.service.impl;

import org.springframework.stereotype.Repository;

import com.bil.user.vo.UserVO;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("userDAO")
public class userDAO extends EgovAbstractMapper {


	public int userIdfInd(String userid) throws EgovBizException{
		System.out.println(userid);
		return selectOne("Login.userIdfInd", userid);
	}
	//유저insert저장 DAO
	public int userInsert(UserVO vo) throws EgovBizException{
		System.out.println("userinsertDAO");
		return insert("Login.userInsert", vo);
	}

}
