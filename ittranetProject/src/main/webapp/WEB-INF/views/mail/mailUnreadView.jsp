<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap{
        width: 900px;
    }
    #mainOuter{
           width:1200px;
           height:800px;
          }
    .outer div{float:left;}
    .top{
         width:1200px;
         height:200px;
    }
    .sidebar{
         width:300px;
         height:600px;
        }
    .middle{
            width:880px;
            height:580px;
    }


    #buttonbar{
    	float:right;
    	padding-left:5px;        
               
    }
    table{
          text-align:center;
    }
    
    
    /* 중요메일 : 별표 체크*/
    label.immail:before{
    	content:"\f005";
    	font-family:"Font Awesome 5 free";
    	vertical-align:middle;
    }
    label.moreimmail:checked + label.immail:before {
    	content:"\f005\f005";
    	font-family:"Font Awesome 5 free";
    	color:purple;
    	text-align:center;
    }
    input#oneStar{
    	display:none;
    }
    
    
    /* 버튼 그라데이션 존예 */
    .w-btn {
    	position: relative;
    	border: none;
    	display: inline-block;
    	padding: 15px 30px;
    	border-radius: 15px;
    	font-family: "paybooc-Light", sans-serif;
    	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    	text-decoration: none;
    	font-weight: 800;
    	transition: 0.25s;
	}
    .w-btn-gra1 {
    	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    	color: white;
	}
	.w-btn-gra2{
		background: linear-gradient(to top right, #33ccff 0%, #ff0000 100%);
		color: white;
	}

</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
</head>
<body>
	<!-- 공용 -->
    <div class="back">
    
    	<!-- 상단: 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

		<!-- 왼쪽 : 사이드바 -->
 		<br clear="both">
 		<div style="position:relative">
			<jsp:include page="../mail/mailSideBar.jsp" />
			
		<!-- 내용 -->
        <div class="mainOuter" id="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
			
            <br><br>

			<!-- 버튼바 (메일쓰기, 삭제) -->
            <div id="buttonbar">
            	<button class="w-btn w-btn-gra1" type="button"><a href="enrollForm.ml" style="text-decoration:none; color:white;">메일쓰기</a></button>
                <button class="w-btn w-btn-gra2" type="submit" onclick="deletemail();">삭제</button>
            
				
			</div>
			
            <form id="postForm" action="alllist.ml" method="post">

            
            <br><br><br>

			<!-- 메일 조회 리스트 -->
            <div class="table table-hover" align="center">
                <table id="unreadlist" style="background-color:white">
                	<thead>
                    	<tr>
                        	<th style="width:50px;"><input type="checkbox" name="checkedAll" id="allCheck" onclick="checkAll(this);"></th>
                        	<th style="width:50px;"><i class="fa-solid fa-star"></i></th>
                        	<th style="width:150px;">보낸사람</th>
                        	<th style="width:500px;">제목</th>
                        	<th style="width:200px;">날짜</th>
                    	</tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="m" items="${ unreadlist }">
	                    	<tr>
	                    		<input class="sdNo" type="hidden" name="mno" value=${ m.sendMailNo }>
	                    		
                        		<td onclick="event.cancelBubble=true;"><input type="checkbox" name="rvno" id="Check" value="${ m.receiveMailNo }"></td>
                        		<td>
                        			<button id="on" class="btn btn-sm" onclick="importantStar();">
                    				<c:choose>
	                    				<c:when test="${m.important eq 'N'}">
	                    					<img src="resources/images/whitestar.png" style="width:15px; height:15px;">
	                    				</c:when>
	                    				<c:otherwise>
	                    					<img src="resources/images/blackstar.png" style="width:15px; height:15px;">
	                    				</c:otherwise>
                    				</c:choose>
                    				</button>
                        		</td>
                        		<td>${ m.empNameSd }</td>
                        		<td>${ m.mailTitle }</td>
                        		<td>${ m.sendDate }</td>
                        		
                        		<input type="hidden" name="receiveAccount" value="${ m.receiverAccount }">
                        		<input type="hidden" name="statusRv" value="${ m.statusRv }">
                        		<input type="hidden" name="important" value="${ m.important }">
                        			
                    		</tr>
                    	</c:forEach>
                    </tbody>
                </table>
                
			</form>
			
				<!-- 상세페이지 조회 -->
                <script>
            		$(function(){
            			$("#unreadlist>tbody>tr").click(function(){
            				location.href = 'detail.ml?mno=' + $(this).children().siblings(".sdNo").val() + "&read=N";
            				console.log(mno);
            			});
            		})
            	</script>
            	
            	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            	
            	<!-- 체크박스 전체체크/체크해제 -->
            	<script>
            			function checkAll(check) {
            				if($("#allCheck").prop("checked")) { 
            				$("input[name=rvno]").prop("checked", true);
            			}else {
            				$("input[name=rvno]").prop("checked", false);
            			}
            			}
				</script>
				
				<!-- 체크박스 : 삭제 -->			
				<script>	
            	function deletemail() {
            		var rcArr = [];
            		$("input[name='rvno']:checked").each(function(){
            			rcArr.push($(this).val());
            		 })
            		 console.log(rcArr);
            		 
            		 $.ajax({
            			 url:"delete.ml",
            			 type:"post",
            			 data:{receiveMailNo:rcArr},
            			 success:function(result){
            				 if(result == 'sucsess'){
            				 	console.log("게시글 삭제 성공!");
            				 }else{
            					 console.log("게시글 삭제실패");
            				 }
            			 },error:function(){
            				 console.log("ajax게시글 삭제 통신 실패!");
            			 }
            			 
            			 
            		 })
            	}            	
            	</script>
            	
            	<!-- 체크박스 : 중요 -->
				<script>
				
				function importantStar(btn){
	
						let rvno = $(btn).parent().prev().children("input[name='rvno']").val();
					console.log(rvno);
						let important = $(btn).parent().siblings("input[name='important']").val();
						console.log(important);
					
			
					$.ajax({
						url:"impo.ml",
						data:{
							rvno:rvno,
							important:important
						},
						success:function(result){
							if(result == 'success'){
								console.log("중요 메일 성공");
								location.onload();
							}else {
								console.log("중요 메일 실패");
							}
						}, error:function() {
							console.log("ajax 중요 메일 통신 실패");
						}
					})
					
				}
				</script>
				
			<!-- 내용닫는곳 -->
            </div>

          	<div id="pagingArea">
    			<ul class="pagination justify-content-center">
	        		<c:choose>
            			<c:when test="${ pi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="unreadlist.ml?cpage=${ pi.currentPage-1 }">&lt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="unreadlist.ml?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="unreadlist.ml?cpage=${ pi.currentPage+1 }">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
            
        	</div>
        
        <!-- 푸터바 -->
        <jsp:include page="../common/footer.jsp" />


    </div>
    </div>



</body>
</html>