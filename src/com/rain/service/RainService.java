package com.rain.service;

import java.util.List;

import com.rain.domain.User;
import com.rain.domain.Dept;
import com.rain.domain.Document;
import com.rain.domain.Employee;
import com.rain.domain.Job;
import com.rain.domain.Notice;

public interface RainService {
	/**
	 * 部门信息的service
	 * @param content
	 * @return
	 */
	List<Dept> findAllDept(String content);
	
	void addDept(Dept dept);

	Dept get_Info(Integer id);

	void update_Info(Dept dept);

	void delete_Info(Integer id);

	List<Dept> findAllDept();
	/**
	 * 职位信息的service
	 * @return
	 */

	List<Job> findAllJob();
	
	List<Job> findAllJob(String content);

	Job get_JobInfo(Integer id);

	void update_JobInfo(Job job);

	void insert_JobInfo(Job job);

	void delete_JobInfo(Integer id);
	/**
	 * 员工信息的service
	 */
	List<Employee> get_EmployeeList();
	List<Employee> get_EmployeeLikeList(String content);
	Employee get_EmployeeInfo(Integer id);
	void update_EmployeeInfo(Employee data);
	void insert_EmployeeInfo(Employee data);
	void delete_EmployeeInfo(Integer id);
	Employee login2(String loginname, String password);

	List<Notice> get_NoticeList();

	List<Notice> get_NoticeLikeList(String content);

	Notice get_NoticeInfo(Integer id);

	void update_NoticeInfo(Notice notice);

	void insert_NoticeInfo(Notice notice);

	void delete_NoticeInfo(Integer id);

	User login(String loginname, String password, String tip);

	List<User> get_UserList();

	List<User> get_UserLikeList(String content);

	User get_UserInfo(Integer id);

	void update_UserInfo(User notice);

	void insert_UserInfo(User notice);

	void delete_UserInfo(Integer id);
	
}
