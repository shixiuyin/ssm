package com.hzit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InitController {

	@RequestMapping({ "/" })
	public String init() {
		// 默认跳转到登录界面 拦截器配置 前缀/ 后缀:.jsp
		return "WEB-INF/jsp/login";
	}
}
