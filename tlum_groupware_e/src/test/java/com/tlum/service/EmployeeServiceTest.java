package com.tlum.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tlum.dto.EmployeeVO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:context/root-context.xml")
public class EmployeeServiceTest {

	
	@Autowired
	private EmployeeService service;	
	
	@Autowired
	private EmployeeService serviceDB;
	
	@Test
	public void empListTest()throws Exception{
		List<EmployeeVO> empList=new ArrayList<EmployeeVO>();
		
		empList=service.selectEmployeeList();
		System.out.println(empList);
	}
	
	@Test
	public void empInsertTest()throws Exception{
		EmployeeVO employVO = new EmployeeVO("2", "2", "2", new Date(), "2", new Date(), "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2");
		service.insertEmployee(employVO);
		empListTest();
	}
	
	
}
