package com.h4j.ITtranet.employee.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.calendar.model.vo.Calendar;
import com.h4j.ITtranet.common.model.vo.PageInfo;
import com.h4j.ITtranet.employee.model.vo.Department;
import com.h4j.ITtranet.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 (select)
	Employee loginMember(Employee e);
	
	// 관리자 로그인시 
	Department empCount();
	ArrayList<Calendar> selectAdminSchedule();
	
	// 유저로 로그인시
	ArrayList<Calendar> selectUserSchedule(String empNo);
	
	// 이메일 중복체크(ajax/select)
	int mailCheck(String checkMail);
	
	// 아이디 중복체크 (ajax /select)
	// 아이디 개수 반환 (이미 있는 아이디면 1, 없는 아이디면 0)
	int idCheck(String checkId);
	
	// 이메일과 일치하는 회원 찾기 (ajax/select)
	Employee whosMail(String accordMail);
	
	// 임시 비밀번호로 변경
	int setTempwd(Employee e);
	
	// 회원가입 (insert)
	int insertMember(Employee e);
	
	// 정보수정 (update)
	int updateMember(Employee e);
	
	// 회원탈퇴 | 계정삭제 (update status => N)
	int deleteMember(String empNo);
		
	// 비밀번호 변경
	int updatePwd(Employee e);
	
	// 가입 승인 대기 회원 화면 조회
	int selectWemployeeCount();
	ArrayList<Employee> selectWemployee(PageInfo pi);
	
	// 가입 승인 (status => Y && 부서,팀,직급 정하기도 함)
	int confirmMember(Employee e);
	
	// 상태 Y인 사원  조회 
	int selectAllemployeeCount();
	ArrayList<Employee> selectAllemployee(PageInfo pi);

	ArrayList<Employee> selectAllemployeeByDept(String deptCode);
	// 상태 Y인 회원 조회 2
	ArrayList<Employee> selectAllemployee2();
	
	// 직무/직급 관리 화면 조회
	ArrayList<Employee> selectEmpJobList();

}
