package com.hzit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzit.bean.Dept;
import com.hzit.bean.Emp;
import com.hzit.service.IDeptService;
import com.hzit.service.IEmpService;

@Controller
public class EmpController {

	Logger logger = Logger.getLogger(EmpController.class);

	@Autowired
	private IEmpService empService;

	@Autowired
	private IDeptService deptService;

	/**
	 * 查询所有的信息
	 * 
	 * @return
	 */
	@RequestMapping("/emp/main/{pageNum}/{pageSize}")
	public String mian(@PathVariable("pageNum") Integer pageNum,@PathVariable("pageSize") Integer pageSize, Model model) {

		// 语句必须放在查询之前
		PageHelper.startPage(pageNum,pageSize);
		List<Emp> empList = empService.findEmpList();

		// 创建一个分页对  navigatepageNums:指定连续出现的页面数，如果不给会显示出全部的内容
		PageInfo pageInfo = new PageInfo(empList,10);

		List<Dept> deptList = deptService.findDeptList();

		model.addAttribute("empList", empList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("pageInfo", pageInfo);

		logger.info(">>>>>查询" + empList);

		return "WEB-INF/jsp/main";
	}

	// 删除 emp/{empno} delete请求
	// @RequestMapping(method = RequestMethod.DELETE)
	@DeleteMapping("/emp/{empno}") // url模板
	public String delete(@PathVariable("empno") Integer empno) {

		Integer row = empService.deleteEmpById(empno);
		logger.info("删除>>>>" + row);

		// 重新去查询

		return "redirect:/emp/main/1/5";
	}

	@GetMapping("/emp/{empno}") // url模板
	public String getEmpById(@PathVariable("empno") Integer empno, Model model) {

		// int empno1 = Integer.parseInt(empno);
		// 员工详情
		Emp emp = empService.findEmpById(empno);

		List<Dept> deptList = deptService.findDeptList();
		// 重新去查询

		model.addAttribute("empInfo", emp);
		model.addAttribute("deptList", deptList);

		return "WEB-INF/jsp/update";
	}

	@PutMapping("/emp") // url模板
	public String putEmp(Emp emp) {

		Integer row = empService.updateEmp(emp);

		logger.info("修改>>>>>" + emp);

		return "redirect:/emp/main/1/5";
	}

	// 页面尚未完成
	@PostMapping("/emp") // url模板
	public String postEmp(Emp emp) {

		Integer row = empService.saveEmp(emp);

		logger.info("修改>>>>>" + emp);

		return "redirect:/emp/main/1/5";
	}

	// 去到新增页面
	@GetMapping("/emp") // url模板
	public String getEmp(Model model) {

		List<Dept> deptList = deptService.findDeptList();
		// 重新去查询
		model.addAttribute("deptList", deptList);

		return "WEB-INF/jsp/addEmp";
	}

	@DeleteMapping("/emps") // url模板
	public String deleteEmps(Integer[] emps, Model model) {
		if (null != emps) {
			empService.deleteEmpByIds(emps);
		}
		return "redirect:/emp/main/1/5";
	}

	@GetMapping("/emp/search") // url模板
	public String searchEmps(@RequestParam(value = "deptno", defaultValue = "-1") Integer deptno,
			@RequestParam(value = "ename", defaultValue = "") String ename, Model model) {

		// 封装查询条件

		Map<String, Object> map = new HashMap<>();
		map.put("deptno", deptno);
		map.put("ename", ename);

		// 根据条件去查询数据
		
		PageHelper.startPage(1, 5);
		List<Emp> empList = empService.searchEmps(map);

		PageInfo pageInfo = new PageInfo(empList);
		
		List<Dept> deptList = deptService.findDeptList();

		model.addAttribute("empList", empList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("pageInfo", pageInfo);

		return "WEB-INF/jsp/main";
	}

}
