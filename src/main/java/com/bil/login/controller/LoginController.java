package com.bil.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hsqldb.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.bil.common.service.CommonService;
import com.bil.login.service.LoginService;
import com.bil.login.service.impl.LoginServiceimpl;
import com.bil.user.vo.UserVO;
import com.bil.util.CommUtils;


@Controller
public class LoginController {


	@Resource(name = "jsonView")
	private MappingJackson2JsonView jsonView;

	@Resource(name="commonService")
	private CommonService commonService;

	/*@Resource(name="LoginServeice")
	private LoginService loginservice = new LoginServiceimpl();*/
	@Resource
	private LoginService loginservice;

	@RequestMapping(value="/login/login.do")
	public String loginview(HttpServletRequest request ) {

		return "/login/login";
	}
//로그인 컨트롤
	@RequestMapping(value="login/loginOK.do")
	public String userLogin(HttpServletRequest request, UserVO vo, HttpSession session)throws Exception {
		UserVO vo1 = vo;

		vo1 = loginservice.userLogin(vo);

		if(vo1 != null) {
			session.setAttribute("session", vo1);
			return "redirect:/account/accountList.do";

		}
		else {
			String error = "없는 정보 입니다. 로그인 실패";
			return "redirect:/login/login.do"+ error;
		}
	}

	@RequestMapping(value="/login/idCkedAjax.do")
	public ModelAndView idCkedAjax(HttpServletRequest request ) throws Exception {
		Map<String, Object> inOutMap  = CommUtils.getFormParam(request);



		return new ModelAndView(jsonView, inOutMap);
	}



}// end of class
