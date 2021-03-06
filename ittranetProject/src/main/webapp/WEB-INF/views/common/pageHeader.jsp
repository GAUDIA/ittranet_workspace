<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- alert창 꾸미기 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/07e0557a32.js" crossorigin="anonymous"></script>
<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
    /*헤더 스타일*/
    div{
        box-sizing: border-box;
    }
    /*그라데이션배경*/
    .back{
        background: rgb(142,207,246);
        background: linear-gradient(157deg, rgba(142,207,246,1) 0%
        , rgba(134,189,251,1) 15%, rgba(169,160,255,1) 52%, rgba(237,198,241,1) 87%
        , rgba(252,225,255,1) 100%);
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        padding: 60px;
        padding-bottom:0px;
    }
    /*연회색배경*/
    .innerBack{
        width:1700px;
        margin:auto;
        padding: 10px;
        background:rgb(233, 232, 232);
        border-radius: 30px;
        margin-bottom: 100px;
        box-shadow:1px 1px 20px 5px rgba(0, 0, 0, 0.144);
    }
    .header{
        width: 1200px;
        float:right;
        height: 50px;
        margin-bottom: 20px;
        margin-right: 30px;
    }
    .header-btn{
        border: none;
        background: rgba(100, 175, 157, 0.45);
        height: 35px;
        border-radius: 5px;
        margin: 6px;
        padding: 7px;
    }
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
    /*컬러로고스타일*/
    #pageLogo{
        height:10px;
        width: 250px; 
    }
    #pageLogo img{
        width:270px;
        height:120px;
        margin:auto;
        margin-top: 75px;
        margin-left: 70px;
        display: inline-block;
    }
    .header-btn:hover {
    	transform: scale(1.1);
    	background:lightseagreen;
    	color:white;
    }
    #pageLogo:hover {
    	transform:scale(1.1);
    	cursor:pointer;
    }
    .pageProfileZone {
    	width:50px;
    	height:50px;
    	border-radius:50%;	
    }
</style>
</head>
<body>
	<!-- alertMsg키값으로 alert메시지가 담겨있을 때에만 이부분 작동 -->
	<c:if test="${ not empty alertifyMsg }">
		<script>
			alertify.alert('IT!tranet 잇트라넷 메시지', "${alertifyMsg}");
		</script>
		<c:remove var="alertifyMsg" scope="session"/>
	</c:if>
	<!-- 한 번만 출력이 되고 더 이상 출력  x  -->

    <!--헤더 영역-->
    <div class="header" align="right">
	   <c:choose>
            <c:when test="${ loginUser.profile eq 'NULL'}">
          		<img class="pageProfileZone" src="resources/images/userprofile.png">
            </c:when>
            <c:otherwise>
          		<img class="pageProfileZone" src="${ loginUser.profile }">
            </c:otherwise>
        </c:choose>
        <span style="font-size: 16px;">${ loginUser.empName }</span> <span style="font-size: 16px;">님 환영합니다</span>
        <button class="header-btn" onclick="location.href='myPage.me'">마이페이지</button>
        <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
		<c:if test="${ loginUser.empNo eq '1' }">
			<button class="header-btn" onclick="location.href='goUserMain.me?empNo=1'">유저페이지</button>
		</c:if>    
    </div>
    <!--로고영역-->
    <c:choose>
    	<c:when test="${ loginUser.empNo == '1' }">
    		<div id="pageLogo" onclick="goAdminMain();">
		        <img src="resources/images/colorLogo.png"/>
		    </div>
    	</c:when>
    	<c:otherwise>
    		<div id="pageLogo" onclick="goUserMain(${ loginUser.empNo });">
		        <img src="resources/images/colorLogo.png"/>
		    </div>
    	</c:otherwise>
    </c:choose>
    
    <script>
     	function goUserMain(empNo){
     		location.href="goUserMain.me?empNo=" + empNo; // ☆
     	}
     	
     	function goAdminMain(){
     		location.href="goAdminMain.me"; 
     	}
    </script>
</body>
</html>