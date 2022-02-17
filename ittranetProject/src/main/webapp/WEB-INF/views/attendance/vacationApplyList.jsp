<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
    .content-area{
        width: 1000px; 
        padding:0 10px; 
        margin-left: 45px; 
        font-size: 18px; 
        font-weight: 600;
    }
    .vc-box{
        background: white;
        width: 950px;
        border-radius: 25px;
        padding: 50px;
        margin-left: 15px;
        font-size: 17px;
        margin-bottom: 50px;
    }
    .vc-box img{
        width: 50px;
        height: 50px;
    }
    .app-btn{
        width: 80px;
        height: 30px;
        background: rgb(211, 180, 211);
        border: none;
        border-radius: 5px;
        float: right;
        font-size: 15px;
    }
    table{
        font-size: 15px;
        font-weight: 400;
        text-align: center;
    }
    /*모달창 스타일*/
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.342);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }
    #modal .modal-window {
        background: white;
        box-shadow: 0 8px 32px 0 rgba(124, 6, 202, 0.199);
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 700px;
        position: relative;
        padding: 30px;
    }
    #modal .title {
        padding-left: 10px;
        display: inline;
        color: rgb(73, 73, 73);    
    }
    #modal .title h2 {
        display: inline;
    }
    #modal .mbtn-area {
        display: inline;
        float: right;
        cursor: pointer;
        color: rgb(73, 73, 73);
    }
    .mbtn-area button{
        float: left;
        width: 80px;
        height: 40px;
        border: none;
        background: lightgray;
        border-radius: 10px;
        margin-top: 20px;
        margin-left: 10px;
    }
    
    #modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        color: rgb(73, 73, 73);
    }

    .input-area{
        float: left;
        width: 50%;
        height: 60px;
        font-size: 17px;
    }
    .output-area{
        float: left;
        width: 100%;
        background: lightgray;
        border-radius: 10px;
        margin-top: 50px;
    }
    #warning{
        float: left;
        width: 100%;
        height: 50px;
        color: red;
    }
    
    /*메뉴바 픽스 스타일*/
    .attendance_mn{
    	color: #000000;
    }
</style>
</head>
<body>
    <div class="back">
        <div class="innerBack">
            <!-- 헤더, 메뉴바 -->
            <jsp:include page="../common/pageHeader.jsp" />
            <jsp:include page="../common/userMenu.jsp" />
            
            <br clear="both">
            <div style="position:relative">
                <jsp:include page="../common/sidebar.jsp" />
                    <div class="cont">
		            <ul id="ac">
		                <li class="division">
		                    <a href="#">근태관리</a>
		                </li>
		                <div id="border">
				               <li class="menu1">
				                  <a href="#">내 근무</a>
				               </li>
				               <li class="menu1">
				                  <a href="#">근무현황</a>
				               </li>
				               <li class="menu1">
				                  <a href="#">휴가 신청</a>
				               </li>
		            	</div>
		            </ul>
		         </div>                 
                <div class="mainOuter">

                    <!--제목영역-->
                    <div style="width:100%; height:200px; float:right; padding:40px; font-size: 22px; font-weight: 600;">
                        휴가 신청
                        <!--휴가신청버튼-->
                        <button id="modal_open_btn" class="app-btn" onclick="openPop();">휴가신청</button>
                        <br><br>
                        <hr>
                    </div>                   
                    <!--컨텐츠 영역-->
                    <div class="content-area">
                        예정 휴가
                        <br><br>
                        <c:if test="${ not empty ulist }">
	                        <div class="vc-box">
	                            <table id="upVacationList" border="1">
	                                <thead>
	                                    <tr>
	                                        <td width="100">No</td>
	                                        <th width="380">기간</th>
	                                        <th width="200">휴가구분</th>
	                                        <th width="200">총 시간</th>
	                                        <th width="200">상태</th>
	                                        <td width="100"></td>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="vc" items="${ ulist }">
		                                    <tr>
		                                        <td class="vcno">${ vc.vcApplyNo }</td>
	                                            <td>${ vc.vcStartDate } ~ ${ vc.vcEndDate }</td>
		                                        <td>${ vc.vcType }</td>
		                                        <td>${ vc.vcTime }</td>
		                                        <td>${ vc.vcStatus }</td>
		                                        <td><button>취소</button></td>
		                                    </tr>
		                                </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
                        </c:if>
                        <script>
                        	$(function(){
                        		$("#upVacationList>tbody>tr").click(function(){
                        			location.href='detail.vcno?vcno=' + $(this).children(".vcno").text();
                        		})
                        	})
                        </script>
                        
                        <br><br>
                        <!--신청내역 없을 경우--> 
                        <c:if test="${ empty ulist }">     
	                        <div class="vc-box" align="center">
	                            <!--휴가 이미지 넣기-->
	                            <img src="resources/images/attendance/vac_icon.png"><br><br>
	                            휴가 신청 내역이 없습니다.               
	                        </div>
                        </c:if>
                        <br><br>
        
                        지난 휴가
                        <br><br>
                        <c:if test="${ not empty llist }">  
	                        <div class="vc-box">
	                            <table id="lastVacationList" border="1">
	                                <thead>
	                                    <tr>
	                                        <td width="100">No</td>
	                                        <th width="380">기간</th>
	                                        <th width="200">휴가구분</th>
	                                        <th width="200">총 시간</th>
	                                        <th width="200">상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="vc" items="${ llist }">
		                                    <tr>
		                                        <td class="vcno">${ vc.vcApplyNo }</td>
	                                            <td>${ vc.vcStartDate } ~ ${ vc.vcEndDate }</td>
		                                        <td>${ vc.vcType }</td>
		                                        <td>${ vc.vcTime }</td>
		                                        <td>${ vc.vcStatus }</td>
		                                    </tr>
		                                </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
                        </c:if>
                        <br><br>
                        <!--신청내역 없을 경우-->
                        <c:if test="${ empty llist }">
	                        <div class="vc-box" align="center">
	                            <!--휴가 이미지 넣기-->
	                            <img src="resources/images/attendance/vac_icon.png"><br><br>
	                            휴가 신청 내역이 없습니다.                 
	                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            
            <!--휴가신청 모달-->
            <div id="modal" class="modal-overlay">
                <div class="modal-window">
                    <div class="title">
                        <!--선택한 휴가 종류에 따라 달라지게-->
                        <h2><b>연차 휴가</b></h2>
                    </div>
                    
                    <div class="content">
                        <div class="input-area">시작일<input type="date"></div>
                        <div class="input-area">종료일<input type="date"></div>
                        <div class="input-area">
                            시간
                            <select name="" id="">
                                <!--오전, 오후 옵션은 연차 신청 시에만 보여지게-->
                                <option value="">오전</option>
                                <option value="">오후</option>
                                <option value="">종일</option>
                            </select>
                        </div>
                        <div class="input-area">증명서제출<input type="file"></div>
                        <div class="input-area">비고<textarea name="" id=""></textarea></div>
                        <!--잔여휴가 0개일 시 보여질 문구-->
                        <div id="warning">! 사용가능한 휴가가 없습니다.</div>
                        <div class="output-area">
                            <ul>
                                <li>dd</li>
                                <li>dd</li>
                                <li>dd</li>
                            </ul>
                        </div>
                    </div>
                    <div class="mbtn-area">
                        <button onclick="closePop();">닫기</button>
                        <button style="background: rgb(210, 163, 238);">신청</button>
                    </div>
                </div>
                <!--모달 스크립트-->

	            <script type="text/javascript">
	      
	                //팝업 show 기능
	                function openPop(flag) {
	                     $('#modal').show();
	                };
	                //팝업 Close 기능
	                function closePop(flag) {
	                     $('#modal').hide();
	                };
	                
	                /*
	                //esc키 눌러서 close
	                function modalOff() {
					    modal.style.display = "none"
					}
	                window.addEventListener("keyup", e => {
	                    if(isModalOn() && e.key === "Escape") {
	                        modalOff()
	                    }
	                })
	                */
	                
	            </script>
	            <!--모달 스크립트 끝-->
	            </div>
	            <!--모달 끝-->

        </div>
            
    </div>

</body>
</html>