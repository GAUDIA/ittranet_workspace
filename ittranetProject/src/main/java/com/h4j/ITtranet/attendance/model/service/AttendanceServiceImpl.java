package com.h4j.ITtranet.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h4j.ITtranet.attendance.model.dao.AttendanceDao;
import com.h4j.ITtranet.attendance.model.vo.Vacation;
import com.h4j.ITtranet.common.model.vo.PageInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao atDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/*
	@Override
	public ArrayList<Vacation> selectVacationList(String empNo) {
		return atDao.selectVacationList(sqlSession, empNo);
	}
	*/
	@Override
	public ArrayList<Vacation> selectUpVacationList(String empNo) {
		return atDao.selectUpVacationList(sqlSession, empNo);
	}


	@Override
	public ArrayList<Vacation> selectLastVacationList(String empNo) {
		return atDao.selectLastVacationList(sqlSession, empNo);
	}



}
