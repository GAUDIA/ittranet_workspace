<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*메인페이지 스타일*/
    body{
		margin:0;
        padding: 0;
	}
    .profile-area{
        width: 400px;
        height: 100vh;
        background: rgb(142,207,246);
        background: linear-gradient(157deg, rgba(142,207,246,1) 0%
        , rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%
        , rgba(252,225,255,1) 100%);
        position: absolute;
    }
    .logo{
        height: 220px;
    }
    .logo>img{
        width:80%;
        height:100px;
        margin:auto;
        margin-top: 25px;
        margin-left:40px;
        display: inline-block;
    }
    /*프로필 스타일*/
    .profile-box{
        width: 300px;
        height: 350px;
        margin: auto;
        background: lightgray;
        border-radius: 20px;
        margin-bottom: 30px;
    }
    .photo{
        padding: 20px;
        height: 125px;
    }
    .profile{
        height:80px;
        text-align: center;
        font-size: 16px;
    }
    /*근태 스타일*/
    .commute-box{
        width: 300px;
        height: 250px;
        margin: auto;
        background: lightgray;
        border-radius: 20px;
        text-align: center;
    }
    .commute-btn{
        float: left;
        margin-top: 20px;
        height: 120px;
        width: 149px;
        font-size: 14px;
        border: none;
        background: none;
    }
    .commute-btn i{
    	font-size: 45px;
    }
    .content-area{
        width: 1500px;
        float: right;
        padding: 0px 100px;
    }
    #cdiv1{
    	height: 40%;
    }
    #cdiv2{
    	height: 20%;
    }
    #cdiv3{
    	height: 30%;
    }
    .now span{
    	width: 50px;
    	height: 20px;
    	float: left;
    	border: solid 1px red;
    }
    /*게시판 연결*/
    .contentbox{
        background: lightgray;
        border-radius: 20px;
        float: left;
        margin-top: 30px;
        margin-left: 30px;
        margin-right: 30px;
    }
    .category-title{
        height: 40px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        background-color: rgba(196, 158, 212, 0.8);
        font-size: 18px;
        font-weight: 600;
        line-height: 40px;
        color: rgb(61, 58, 58);
    }
    .plus-btn{
        color: rgb(53, 50, 50);
        text-decoration: none;
        float: right;
        font-size: 22px;
        margin-right: 15px;
    }
    table{
        margin: auto;
        border-spacing: 0 20px;
        width: 90%;
        text-align: left;
        font-size: 15px;
    }
    .newBoardTr:hover {
    	cursor:pointer;
    	background-color: rgb(177, 176, 176);
    }
    .btnStyle:hover{
    	cursor:pointer;
    	text-decoration:none;
    }
    /*프로필 사진 영역*/
    .profileZone {
    	width:150px;
    	height:150px;
    	border-radius:50%;	
    }
</style>
</head>
<body>
    <div class="outer">
    <!-- 헤더 -->
    <jsp:include page="header.jsp" />
    <!-- 메뉴바 -->
    <jsp:include page="userMenu.jsp" />
        <!--메인페이지-->
        <!--좌측 프로필 영역-->
        <div class="profile-area">
            <div class="logo">
                <img src="resources/images/logo.png"  alt="logo	" />
            </div>
            <div class="profile-box">
                <div class="photo" align="center">
                	<%-- 여기 복붙하면 됨!!! (style 가서 .profileZone 스타일 => 크기는 각자 화면에 맞춰서) --%>
                   	<c:choose>
                		<c:when test="${ loginUser.profile eq 'NULL'}">
		                	<img class="profileZone" src="resources/images/userprofile.png">
                		</c:when>
                		<c:otherwise>
		                	<img class="profileZone" src="${ loginUser.profile }">
                		</c:otherwise>
                	</c:choose>
                	<%--여기까지 프로필 사진 동그라미 영역 (마이페이지에서 사진 등록) --%>
                </div>
                <br><br><br>
                <c:choose>
                	<c:when test="${ loginUser.empNo eq '1' }">
                		<div class="adminProfile">
                			<p style="font-weight: 900; text-align:center;">관리자님 환영합니다</p>
                			<button class="header-btn" onclick="location.href='goAdminMain.me'" style="margin-left:100px;">관리자 페이지</button>
                		</div>
                	</c:when>
                	<c:otherwise>
	                	<div class="profile">
		                    <!--사용자 이름, 부서명 연결-->
		                    <p style="font-weight: 900;">${ loginUser.empName } ${ loginUser.jobName }</p>        
		                    <c:choose>
		                    	<c:when test="${ loginUser.teamCode eq 'T0' }">
		                    		<p style="font-weight: 900;">${ loginUser.deptName }</p>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<p style="font-weight: 900;">${ loginUser.deptName } ${ loginUser.teamName }</p>
		                    	</c:otherwise>
		                    </c:choose>
		                    <div align="center">
			                    <button class="header-btn" onclick="location.href='myPage.me'">마이페이지</button>
			                    <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>   
                			</div>
	                	</div>
                	</c:otherwise>
                </c:choose>
            </div>
            <div class="commute-box">
                <div id="now" style="height: 50px; font-size: 18px; margin: 20px; padding-top: 20px;">
                    <!--오늘날짜-->
					<span id="nowYear"></span><span>년</span>
                    <span id="nowMonth"></span><span>월</span>
					<span id="nowDay"></span><span>일</span>
                    <!--현재시간-->
                    <br>
                    <span id="nowTimes"></span>
                </div>
                <button id="arr-btn" class="commute-btn" onclick="insertArrive();" style="border-right: 0.1px solid rgb(156, 156, 156);">
                	<div id="cdiv1"><i class="far fa-arrow-alt-circle-right fa-4x fa-rotate-90" style="color: rgb(163, 100, 223);"></i></div>
                    <br>
                    <div id="cdiv2">
                        출근하기
                    </div>
                    <div id="cdiv3"><span id="arr-time"></span></div>
                </button>
                <button id="lev-btn" class="commute-btn" onclick="updateLeave();" disabled>
                    <div id="cdiv1"><i class="far fa-arrow-alt-circle-right fa-4x" style="color: gray;"></i></div>
                    <br>
                    <div id="cdiv2">
                        퇴근하기 
                    </div>
                    <div id="cdiv3"><span id="lev-time"></span></div>
                </button>
            </div>
        </div>
        <!-- 출퇴근기록용 스크립트 -->
        <script>
			$(function(){
				selectAttStatus();
				setInterval(selectAttStatus, 1000);
				
		        clock();
		        setInterval(clock, 500);
			})
			
			function insertArrive(){ // 출근기록용
				$.ajax({
					url: "arrive.at",
					data:{
						empNo: '${loginUser.empNo}'
					}, success:function(arstatus){
						if(arstatus == "success"){
							console.log("출근 통신 성공")
						}
					}, error:function(){
						console.log("출근 통신 실패")
					}
				})
			}
			
			function updateLeave(){ // 퇴근기록용
				$.ajax({
					url: "leave.at",
					data:{
						empNo: '${loginUser.empNo}'
					}, success:function(arstatus){
						if(arstatus == "success"){
							console.log("퇴근 통신 성공")
						}
					}, error:function(){
						console.log("퇴근 통신 실패")
					}
				})
			}
			
			function selectAttStatus(){ // 출퇴근기록 조회용
				$.ajax({
					url:"list.at",
					type: "post",
					data:{
						empNo: '${loginUser.empNo}'
					}, success: function(at){
						let arr = "";
						let lev = "";
						console.log(at);
						if(at.arriveTime != null){
							
							arr = at.arriveTime;
							
						}if(at.leaveTime != null){
							
							lev = at.leaveTime;
							
						}		  
						$("#arr-time").html(arr);
						$("#lev-time").html(lev);
					}, error:function(){
						console.log("출퇴근리스트 통신실패");
					}
				})
			}
			
		    function clock() { // 날짜 및 시간 조회
				const nowTime = new Date();
				const hour = nowTime.getHours();
				const min = nowTime.getMinutes();
				const sec = nowTime.getSeconds();
				
				
				let month = nowTime.getMonth();
				let day =  nowTime.getDate();
				let year = nowTime.getFullYear();
				let value = hour + ":" + addzero(min) + ":" + addzero(sec);
				
				$("#nowMonth").html(month);
				$("#nowDay").html(day);
				$("#nowYear").html(year);
				$("#nowTimes").html(value);
			}
		        // 1자리수의 숫자인 경우 앞에 0을 붙이도록
			function addzero(num) {
				if(num < 10) { num = "0" + num; }
		 		return num;
			}
		    
		    // 출퇴근버튼 클릭 효과
			$('#arr-btn').click(function() {
        	    $('#arr-btn').attr("disabled","disabled");
        	    $('#arr-btn i').css("color","gray"); 
        	    $('#lev-btn').removeAttr("disabled");
        	    $('#lev-btn i').css("color","rgb(163, 100, 223)");
    	    })
    	    $('#lev-btn').click(function() {
        	    $('#lev-btn').attr("disabled","disabled");
        	    $('#lev-btn i').css("color","gray");
        	    $('#arr-btn').removeAttr("disabled");
        	    $('#arr-btn i').css("color","rgb(163, 100, 223)");
    	    })   
		</script>

        <!--각 메뉴 연결할 영역-->
        <div class="content-area">
            <div class="contentbox" style="width: 390px; height: 280px;">
                <div class="category-title">
                    &nbsp;&nbsp;프로젝트
                    <a href="" class="plus-btn">+</a>
                </div>
                <table>
                    <tr>
                        <th width="90">프로젝트명</th>
                        <td>내용</td>
                    </tr>
                </table>
            </div>
            <div class="contentbox" style="width: 390px; height: 280px; margin-left: 0px;">
                <div class="category-title">
                    &nbsp;&nbsp;결재내역
                    <a href="newForm.fo" class="plus-btn">+</a>
                </div>
                <table id="drList">
                	<thead>
	                    <tr>
	                        <th width="300">기안 제목</th>
	                        <td>상태</td>
	                    </tr>
	                </thead>
	                <tbody>
	                	
	                </tbody>    
                </table>
            </div>
            <div class="contentbox" style="width: 390px; height: 590px; float: right; margin-left: 0px;">
                <div class="category-title">
                    &nbsp;&nbsp;일정
                    <a href="" class="plus-btn">+</a>
                </div>
                <div id="calendar-area" style="height: 320px; padding: 10px;" align="center">
                    <!--캘린더 넣은 다음 border 지우기!-->
                    <div style="width: 300px; height: 300px; border: solid 1px;">
                        캘린더자리
                    </div>         
                </div>
                <table>
                    <tr>
                        <th colspan="2">오늘의 일정</th>
                    </tr>
                    <tr>
                        <td width="50">12:00</td>
                        <td>일정내용</td>
                    </tr>
                </table>
            </div>
            <div class="contentbox" style="width: 810px; height: 280px;">
                <div class="category-title">
                    &nbsp;&nbsp;게시판
                    <a href="list.no" class="plus-btn btnStyle">+</a>
                </div>
                <table id="newBoardList">
                    <tbody>
                    
                    </tbody>
                </table>
                <script>
                	$(function(){
                		selectNewList();
                		
                		$(document).on("click", "#newBoardList>tbody>tr", function(){
                			
                			var type = $(this).children(".type").text();
                			console.log(type);
                			var number = $(this).children(".type").children(".number").val();
                			console.log(number);
                			
                			if(type === '공지사항'){
                				location.href = "detail.no?nno=" + number;
                			}else{
                				location.href = "detail.bo?bno=" + number;
                			}
                		})
                		
                		selectDrList();

                		
                	})
                	
                	function selectNewList(){
                		$.ajax({
                			url: "newList.no",
                			success:function(list){
                				console.log(list);
                				
                				let value="";
                				for(let i in list){
                					value += "<tr class='newBoardTr'>"
                							+ 	"<th width='120' class='type' height='30'>";
                					if(list[i].headerNo == 0){
                						value += "자유게시판" + "<input type='hidden' name='bno' class='number' value='" + list[i].noticeNo + "'>" + "</th>"
		                						+ 	"<td class='title' width='500' height='30'>" + list[i].noticeTitle + "</td>"
		            							+	"<td width='120' height='30'>" + list[i].createDate + "</td>";
                					}else{
                						value += "공지사항" + "<input type='hidden' name='nno' class='number' value='" + list[i].noticeNo + "'>" + "</th>"
	                							+ 	"<td class='title' width='500' height='30'>" + list[i].noticeTitle + "</td>"
	                							+	"<td width='120' height='30'>" + list[i].createDate + "</td>";
                					}
                				}
                				
                				$("#newBoardList>tbody").html(value);
                			},error:function(){
                				console.log("최신글 ajax 통신 실패");
                			}
                		})
                	}
                	
                	// 결재내역 불러오기
                	$(document).on("click", "#drList>tbody", function selectDrList(){
                		$.ajax({
                			url: "draftWait.dr",
                			success:function(list){
                				console.log(list);
                				
                				let value="";
                				for(let i in list){
                					value += "<tr>"
                							+ 	"<th width='120' class='type' height='30'>";
											+	"<input type='hidden' name='drNo'  value='" + list[i].drNo + "'>" + "</th>"
               								+ 	"<td width='500' height='30'>" + list[i].drTitle + "</td>"
	                						+ 	"<td width='500' height='30'>" + list[i].drDivision + "</td>";
                							+ "</td>"
                				}
                				
                				$("#drList>tbody").html(value);
                			},error:function(){
                				console.log("최신글 ajax 통신 실패");
                			}
                		})
                	})
                </script>
            </div>
        </div>
    </div>
    <!-- <br clear="both"> -->
    <!-- 푸터바 -->
    <jsp:include page="footer.jsp" />
</body>
</html>