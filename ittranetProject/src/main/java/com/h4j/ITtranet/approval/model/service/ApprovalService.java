package com.h4j.ITtranet.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.h4j.ITtranet.approval.model.vo.AppLine;
import com.h4j.ITtranet.approval.model.vo.Approval;
import com.h4j.ITtranet.common.model.vo.Attachment;
import com.h4j.ITtranet.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 결재선 검색
	ArrayList<AppLine> selectSearchTeam(String keyword);
	ArrayList<AppLine> selectSearchName(String keyword);
	
	// 기안 insert
	int insertAttachment(Attachment at);
	int insertDraft(Approval app, int formNo, ArrayList<AppLine> appList);
	
	// 기안 게시판 listCount
	int selectListCount(int category, int empNo);
	
	// 기안 게시판 select
	ArrayList<AppLine> selectAppName();
	ArrayList<Approval> selectList(PageInfo pi, int category, int empNo);
	
	// 기안 게시판 검색
	ArrayList<Approval> selectSearchForm(HashMap<String, Integer> map);
	ArrayList<Approval> selectSearchDate(HashMap<String, Integer> map);
	
	// 기안 게시판 상세조회
	Attachment selectAttachment(int drNo);
	Approval selectDetail(int drNo, String drDivision);
	
	//---------------------------------------------------------------------
	// 결재 게시판 select
	int selectApListCount(int category, int empNo);
	ArrayList<Approval> selectApList(PageInfo pi, int category, int empNo);
	
	// 반려 상태 update
	int updateReject(HashMap<String, Integer> map);
	
	// 반려 상태 update
	int updateComplete(HashMap<String, Integer> map);
	
	//---------------------------------------------------------------------
	// 관리자 권한 결재 리스트
	int selectAdminApListCount();
	ArrayList<Approval> selectAdminApList(PageInfo pi);
	
	// 관리자 권한 결재 update
	int updateAdminReject(int drNo);	
	int updateAdminComplete(int drNo);
	
	//----------------------------------------------------------------------
	// 메인화면 기안 리스트
	ArrayList<Approval> mainSelectList(int empNo);
	
	
}
