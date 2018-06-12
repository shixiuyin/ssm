package com.hzit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzit.bean.Dept;
import com.hzit.service.IDeptService;

@Controller
public class DeptController {

	@Autowired
	private IDeptService deptService;

	@RequestMapping("/test")
	@ResponseBody
	public Object test() {
		List<Dept> list = deptService.findDeptList();
		return list;
	}

}
