package com.h4j.ITtranet.employee.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.h4j.ITtranet.employee.model.service.EmployeeService;
import com.h4j.ITtranet.employee.model.vo.Employee;
import com.h4j.ITtranet.employee.model.vo.EmployeeMail;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 사용자 메인 페이지
	 * @return
	 */
	@RequestMapping("goUserMain.me")
	public String goUserMain() {
		return "common/userMain";
	}
	
	/**
	 * 관리자 메인페이지
	 * @return
	 */
	@RequestMapping("goAdminMain.me")
	public String goAdminMain() {
		return "common/adminMain";
	}
	
	/**
	 * 로그인
	 * @param e
	 * @param session
	 * @param mv
	 * @return ModelAndView mv
	 */
	@RequestMapping("hi.me")
	public ModelAndView loginMember(Employee e, HttpSession session, ModelAndView mv) {
		
		Employee loginUser = eService.loginMember(e);
		
		// System.out.println(loginUser);
		
		if(loginUser != null && (loginUser.getAdmin()).equals("Y") && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/adminMain");
		} else if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		} else {
			mv.setViewName("common/error");
		}
		
		/*
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		}else {
			mv.setViewName("common/error");
		}
		*/
		
		return mv;
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return String
	 */
	@RequestMapping("bye.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * ID/PWD 찾기
	 * @param accordMail
	 * @return String result
	 */
	@ResponseBody
	@RequestMapping(value="findIdPwd.me")
	public String findIdPwd(String accordMail) {
		
		// System.out.println("화면에서 입력 받은 메일 : " + accordMail);

		String result = null;
		Employee e = new Employee();
		int count = eService.mailCheck(accordMail);
		// 가입된 메일이 있으면 1 => 일치하는 회원 찾아서 비밀번호 바꾸기(암호화) => 메일 발송 => result : yeah (메일 발송되었다는 알림)
		// 가입된 메일이 없으면 0 => result : miss (가입된 메일이 없다는 알림)
		
		// System.out.println("결과 : " + count);
		
		if(count>0) {
			
			// 입력한 이메일과 일치하는 회원 정보 조회
			e = eService.whosMail(accordMail);
			
			// System.out.println("일치하는 회원 정보 " + e);
			
			// 임시 비밀번호 생성 후 setter메소드로 비밀번호 바꾸기
			String temporaryPwd = UUID.randomUUID().toString().replace("-", "");
			temporaryPwd = temporaryPwd.substring(0, 7);
			
			// System.out.println("임시 비밀번호 생성 : " + temporaryPwd);
			
			e.setEmpPwd(temporaryPwd);
			
			// System.out.println("임시 비밀번호로 정보 변경 : " + e);
			
			// 메일 발송
			EmployeeMail em = new EmployeeMail();
			try {
				em.findIdPwd(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			// 임시 비밀번호 암호화 후 데이터 수정
			String changePwd = bcryptPasswordEncoder.encode(temporaryPwd);
			e.setEmpPwd(changePwd);
			
			// System.out.println("암호화 : " + changePwd);
			// System.out.println("최종 업데이트 : " + e);
			
			int updateResult = eService.setTempwd(e);
			
			// System.out.println("updateResult : " + updateResult);
			
			if(updateResult>0) {
				result = "yeah";
			} else {
				result = "oops";
			}
			
		}else {
			result = "miss";
		}
		
		// System.out.println("result : " + result);
		return result;
	}
	
	/**
	 * 회원가입  페이지 호출
	 * @return 응답페이지
	 * 
	 * (회원가입 메일 => 링크 클릭 => 회원가입 페이지)
	 * 링크 주소 : http://localhost:8174/ITtranet/joinForm.me
	 */
	@RequestMapping("joinForm.me")
	public String joinForm() {
		return "member/joinForm";
	}
	
	/**
	 * 회원가입 메일 중복 확인
	 * @param checkMail
	 * @return int count(중복 o => 1 | 중복 x => 0)
	 */
	@ResponseBody
	@RequestMapping("mailCheck.me")
	public String mailCheck(String checkMail) {
		int count = 0;
		return eService.mailCheck(checkMail) > 0 ? "FAIL" : "PASS";
	}
	
	/**
	 * 회원가입 아이디 중복 확인
	 * @param checkId
	 * @return int count(중복 o => 1 | 중복 x => 0)
	 */
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = 0;
		return eService.idCheck(checkId) > 0 ? "FAIL" : "PASS";
	}
	
	/**
	 * 회원가입 요청
	 * => DB에 status 'W(wait)'로 정보 담김 && 가입 승인 대기 페이지로 이동(사원관리)
	 * => 관리자가 가입을 승인하면 status 'W'에서 'Y'로 변경 && 가입 승인 메일 발송
	 * @param e
	 * @param model
	 * @param session
	 * @return String 페이지
	 */
	@RequestMapping("join.me")
	public String insertMember(Employee e, Model model, HttpSession session) {
		
		// System.out.println(e);
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd()); // 암호화
		
		// System.out.println(encPwd);
		
		e.setEmpPwd(encPwd); // empPwd필드 암호문으로 변경
		
		int result = eService.insertMember(e);
		
		if(result>0) {
			session.setAttribute("success", "성공");
			return "redirect:joinForm.me";
		}else { 
			return "common/error";
		}	
	}
	
	/**
	 * 마이페이지 호출
	 * @return
	 */
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/mymyPage";
	}
	
	/**
	 * 회원 정보 변경
	 * @param e
	 * @param session
	 * @return
	 */
	@RequestMapping("update.me")
	public String updateMember(Employee e, HttpSession session) {
		// System.out.println(e);
		int result = eService.updateMember(e);
		if(result>0) {
			session.setAttribute("loginUser",  eService.loginMember(e));
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다");
			return "redirect:myPage.me";
		}else { 
			session.setAttribute("fail", "실패");
			return "redirect:myPage.me";
		}	
	}
	
	@RequestMapping("setPwdForm.me")
	public String setPwdForm() {
		return "member/setPwdForm";
	}

	// adminJobcode => 사원 정보 
	// adminJobcodeDetail => 사원 정보 디테일
	// adminMemberDelete => 사원 ㄱㅖ정 삭제 ★ 체크 표시 있음!! 대박~~ 테이블 짱
	// adminMemberInsert => 사원 초대
	/*
	 * 사원 추가
	 * 사원 가입 승인
	 * 직위/직무 관리
	 * 사원 계정 삭제
	 */
	
	// 정보 수정 update.me
	
	// ~~사원 추가
	// 사원 추가 페이지 호출 addEmpForm.me (사원관리 메뉴를 누르면 제일 처음 보여지는 페이지 - DB연결 x)
	
	// 사원 추가 addEmp.me (이메일 주소 작성하고 버튼 누르면 회원가입폼 보내는 메일 발송 - DB연결 x)
	
	// ~~가입 승인
	// 사원 가입 승인 페이지 호출 addEmpAppForm.me
	
	// 사원 가입 승인 addEmpApp.me (status를 W에서 Y로 update)
	
	// 사원 가입 반려 addEmpCom.me (status를 W에서 N으로 update)
	
	// ~~직위,직무 관리
	// 직위직무관리 페이지 호출 empSetForm.me
	
	// 직위 직무 관리 empSet.me (Department, Team, Job 변경 / jsp에서 한 번에 값 담아서 보내고 update시키기)
	
	// ~~사원 계정 삭제
	// 사원 계정 삭제 페이지 호출 delEmpForm.me
	
	// 사원 계정 삭제 delEmp.me (status Y에서 N으로 update)
	
	
	

}
