<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
    /*헤더 스타일*/
    div{
        box-sizing: border-box;
    }
    .outer{
        margin:auto;
        background:rgb(238, 235, 235);
        width:100vw;
        height:100vh;
    }
    .headerOuter{
        width: 1200px;
        float:right;
        height: 50px;
        margin-bottom: 20px;
        margin-right: 30px;
    }
    .header-btn{
        border: none;
        background: rgb(168, 201, 185);
        height: 35px;
        border-radius: 5px;
        margin: 7px;
    }
    .menu>a{
        text-decoration: none; 
        color:gray;
    }
</style>
</head>
<body>
        <!--헤더 영역-->
        <div class="headerOuter" align="right">
            <span style="font-size: 16px;">김땡땡</span> <span style="font-size: 16px;">사원</span>
            <button class="header-btn" onclick="location.href=''">마이페이지</button>
            <button class="header-btn" onclick="location.href='bye.me'">로그아웃</button>
            <!--관리자에게만 보여지도록-->
            <button class="header-btn" onclick="location.href=''">관리자페이지</button>            
        </div>

</body>
</html>