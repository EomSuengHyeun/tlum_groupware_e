package com.tlum.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hamcrest.Matchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.tlum.dao.EmployeeDAO;
import com.tlum.dto.EmployeeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:context/root-context.xml")
@TransactionConfiguration(transactionManager="transactionManager",
						  defaultRollback=false)
@Transactional
public class EmployeeDAOImplTest {

	@Autowired
	private EmployeeDAO dao;
	
	@Autowired
	private BasicDataSource dataSource;
	
	@Test	
	public void listTest()throws Exception{

		List<EmployeeVO> employeeList=dao.selectEmployeeList();
		System.out.println(employeeList);
		Assert.assertThat(employeeList.size(),Matchers.greaterThan(0));
	} 

}





