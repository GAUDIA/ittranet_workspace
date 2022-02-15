package com.h4j.ITtranet.attendance.model.service;

import java.util.ArrayList;

import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;

public interface AttendanceService {

	// 사용자 예정휴가신청 리스트
	ArrayList<Vacation> selectUpVacationList(String empNo);
	// 사용자 지난휴가신청 리스트
	ArrayList<Vacation> selectLastVacationList(String empNo);
	
	
}
