package com.hzit.controller;

import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hzit.bean.Users;
import com.hzit.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	/**
	 * 登录
	 * 
	 * @return
	 */
	@PostMapping("/login")
	public String login(String username, String pwd, HttpSession session) {
		Users users = userService.login(username, pwd);
		if (users != null) {

			session.setAttribute("userInfo", users);

			// 跳转到主界面  默认分页   第一页 显示5条记录
			return "redirect:/emp/main/1/5";
		} else {

			session.setAttribute("msg", "登录失败，请检查!!!");

			// 跳转到登录界面，并且添加错误信息 /请求去到对应的jsp
			return "redirect:/";
		}

	}

}
