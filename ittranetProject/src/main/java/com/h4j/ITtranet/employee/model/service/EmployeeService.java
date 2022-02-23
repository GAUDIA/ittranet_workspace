package com.h4j.ITtranet.employee.model.service;

import com.h4j.ITtranet.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 (select)
	Employee loginMember(Employee e);
	
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
	
	// ~~~~~~~~~~~~~~ 여기서부터 해야하는 부분~~~~~~~~~~~~~
	// 정보수정 (update)
	int updateMember(Employee e);
	
	// 회원탈퇴 (update)
	int deleteMember(String empId);
		
	// 비밀번호 변경
	int updatePwd(String empPwd);
	
	// ~~사원 추가
	// 사원 추가 페이지 호출 addEmpForm.me
	
	// 사원 추가(초대메일보내는거) addEmp.me (W에서 Y로 변경)
	// int addEmployee(String empNo);
	
	// ~~가입 승인
	// 사원 가입 승인 페이지 호출 addEmpAppForm.me
	
	// 사원 가입 승인 addEmpApp.me
	
	// 사원 가입 반려 addEmpCom.me
	
	// ~~직위,직무 관리
	// 직위직무관리 페이지 호출 empSetForm.me
	
	// 직위 직무 관리 empSet.me
	
	// ~~사원 계정 삭제
	// 사원 계정 삭제 페이지 호출 delEmpForm.me
	
	// 사원 계정 삭제 delEmp.me

}
