package com.hzit.bean;

import java.util.List;

public class Dept {

	private Integer deptno;
	private String dname;
	private String loc;
	private List<Emp> empList;

	public Integer getDeptno() {
		return deptno;
	}

	public List<Emp> getEmpList() {
		return empList;
	}

	public void setEmpList(List<Emp> empList) {
		this.empList = empList;
	}

	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String toString() {
		return "Dept [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}

	public Dept(Integer deptno, String dname, String loc, List<Emp> empList) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
		this.empList = empList;
	}

	public Dept() {
		super();
	}

}
