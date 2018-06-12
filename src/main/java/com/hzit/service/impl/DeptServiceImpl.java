package com.hzit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzit.bean.Dept;
import com.hzit.dao.DeptDao;
import com.hzit.service.IDeptService;

@Service
public class DeptServiceImpl implements IDeptService {

	@Autowired
	private DeptDao deptDao;

	@Override
	public List<Dept> findDeptList() {
		List<Dept> list = deptDao.findDeptList();
		return list;
	}

}
