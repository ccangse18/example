package com.bil.user.controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bil.user.service.userservice;
import com.bil.user.service.impl.userserviceimpl;
import com.bil.user.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	userservice userservice = new userserviceimpl();

	@RequestMapping(value="/user/userInsert.do")
	public String userInsert() {

		return "/user/userInsert";
	}

	@RequestMapping(value="/user/userIdFind.do",method=RequestMethod.GET)
	@ResponseBody
	public int userIdFind(UserVO userVo)throws Exception{
//		System.out.println("아이디 중복 체크폼");
		// system 안쓰고 보통 logger 써요
		// logger 추가 하는 방법은 구글링 하시면 나와요
		String userid = userVo.getUserId();
//		System.out.println(userid);
		return userservice.userIdFind(userid);

	}
	@RequestMapping(value="/user/userIDinsert.do")
	public String userIDinsert(HttpServletRequest request, UserVO vo)throws Exception{
		System.out.println("userInsert");
		System.out.println(vo);
		userservice.userInsert(vo);
		return "redirect:/login/login.do";
	}
}
