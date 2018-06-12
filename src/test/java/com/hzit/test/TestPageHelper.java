package com.hzit.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzit.bean.Emp;
import com.hzit.service.IEmpService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestPageHelper {

	@Autowired
	private IEmpService empService;

	@Test
	public void test1() {

		PageHelper.startPage(2, 4);
		List<Emp> list = empService.findEmpList();

		PageInfo page = new PageInfo(list,3);

		// junit里面的测试  判断2 是否和page.getPageNum()相等
		assertEquals(2, page.getPageNum());//

		/*assertEquals(10, page.getPageSize());
		assertEquals(1, page.getStartRow());
		assertEquals(10, page.getEndRow());
		assertEquals(183, page.getTotal());
		assertEquals(19, page.getPages());
		assertEquals(1, page.getFirstPage());
		assertEquals(8, page.getLastPage());
		assertEquals(true, page.isIsFirstPage());
		assertEquals(false, page.isIsLastPage());
		assertEquals(false, page.isHasPreviousPage());
		assertEquals(true, page.isHasNextPage());*/
		System.out.println(list);

	}

}
