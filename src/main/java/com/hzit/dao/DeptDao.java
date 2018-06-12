package com.hzit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hzit.bean.Dept;

@Repository
public interface DeptDao {

	public List<Dept> findDeptList();

}
