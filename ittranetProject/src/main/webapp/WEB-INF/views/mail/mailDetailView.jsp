<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 상세 조회페이지</title>
<style>
	/*메뉴바 픽스 스타일*/
    .mail_mn{
    	color: #000000;
    }
    
    
    /*버튼 (삭제,스팸,답장,뒤로)*/
    #buttonbar>button{
    	float:right;
    	padding-left:5px;
		width:50px;
        height:40px;
    }
    /*버튼(삭제,스팸,답장,뒤로)*/
    .btn{
         float:right;
         margin:5px; 
         font-family: 'Gowun Dodum', sans-serif;      
    }
    /*내용*/
   	.mainOuter{
    	margin:10px;
        width:800px;
        height:800px;
    }
    /*메일 상세내용*/
    .mailcontent{
    	margin-top:30px;
    	margin:20px;
        font-family: 'Gowun Dodum', sans-serif;
    }
    .mailcontent>div{
    	width:100%;
    }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 공용 -->
	<div class="back">
    
    	<!--  상단 : 페이지헤더, 메뉴바 -->
        <div class="innerBack">
			<jsp:include page="../common/pageHeader.jsp" />
 			<jsp:include page="../common/userMenu.jsp" />

			<!-- 왼쪽 : 사이드바 -->
 			<br clear="both">
 			<div style="position:relative">
				<jsp:include page="../mail/mailSideBar.jsp" />
			
				<!-- 내용 -->
        		<div class="mainOuter" style="font-family: 'Gowun Dodum', sans-serif;">
				<br>
			
				<!-- 상세조회 폼 -->
				<form id="detaildelete" action="detail.ml" method="post">
					<input type="hidden" name="mno" value="${ m.sendMailNo }">
					<input type="hidden" name="rvno" value="${ m.receiveMailNo }">

					<!-- 버튼바 (목록, 삭제, 스팸, 답장) -->
	        		<div id="buttonbar">
	        			<c:if test="${m.spam eq 'N' and m.statusSd eq 'Y' or m.spam eq 'N' and m.statusRv eq 'Y'}">
		        			<button type="button" class="btn btn-danger" onclick="deleteMail();">삭제</button>
		            		<button type="button" class="btn btn-warning" onclick="spamMail();">스팸</button>
		            		<button type="button" class="btn btn-secondary" onclick="asMail();">답장</button>
	            		</c:if>
	         				<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로</button>
	        		</div>
	        		
					<!-- 메일 상세내용 -->
	        		<div class="mailcontent">
			        	<input type="hidden" name="mno" value="${ m.sendMailNo }">
	        			<input type="hidden" name="rvno" class="rvno" value="${ m.receiveMailNo }">
	        	
	            		<div>${ m.mailTitle }</div>
	            		<div>${ m.sendDate }</div>
	            		<br>
	            		
	            		<div> 보낸사람 : ${ m.empNameSd } &lt; ${ m.senderAccount } &gt;</div>
	            		<div> 받는사람 : ${ m.empNameRv } &lt; ${ m.receiverAccount } &gt;</div>
	           			<br>
		            	<hr>
		            	
	            		<br>
	            		<div>${ m.mailContent }</div>
	            		<br>
	            		
			            <input type="hidden" value="${m.statusRv }">
	            		<input type="hidden" value="${m.spam }">
	            		<input type="hidden" value="${statusCheck}" name="statusCheck">
				        <hr>
				        
		            	<div>
							<c:forEach var="at" items="${ list }">
	            				<c:choose>
	            					<c:when test="${ empty at.originName }">
	            						첨부파일이 없습니다.
	            					</c:when>
	            					<c:otherwise>
	            						<a href="${at.filePath}${ at.changeName }" download="${at.originName}">${ at.originName } <br> </a>	
	            					</c:otherwise>
	            				</c:choose>
	            			</c:forEach>
	            		</div>
	        		</div>
		        </form>
	        
	          	<!--스팸-->
	        	<script>
	        		function spamMail() {
	        			var rvno = $("input[name='rvno']").val();
	        			console.log(rvno);
	        	
	        			$.ajax({
	        	   			type : "POST",
	        	   			url : "dtspam.ml",
	        	   			data : {rvno:rvno},
	        	   			success: function(result){
	        		   			if(result == 'success'){
	        			   			alert("스팸 메일에 추가 되었습니다.");
	        			   			location.href="alllist.ml?cpage=1";
	        		   			}else{
	        			   			alert("스팸 메일 추가에 실패하였습니다!");
	        		   			}
	        	    		}, error : function (data) {
	        	    			alert('ajax 스팸 메일 전송 실패');
	        	   			}
	       				})
	        		}
	        		
	        		<!-- 삭제 -->
	        		function deleteMail() {
	        			var rvno = $("input[name='rvno']").val();
	        			var statusCheck = $("input[name='statusCheck']").val();
	        			var mno = $("input[name='mno']").val();
	        			console.log(rvno);
			        	
	        			$.ajax({
	        	   			type : "POST",
	        	   			url : "deleteone.ml",
	        	   			data : {
	        		   			rvno:rvno,
	        		   			statusCheck:statusCheck,
	        		   			mno:mno
	        	   			},
	        	   			success: function(result){
	        		   			if(result == 'success'){
	        			   			alert("메일 삭제가 완료되었습니다.");
	        			   			location.href="binlist.ml?cpage=1";
	        		   			}else{
	        			   			alert("메일 삭제가 실패하였습니다!");
	        		   			}
	        	    		},
	        	   			error : function (data) {
	        	    			alert('ajax 메일 삭제 전송 실패');
	        	   			}
	        			})
	        		}
	        
	        		<!--답장-->
	        		function asMail(){
	        			location.href="enrollForm.mlas?mno=" + $("input[name='mno']").val();
	        			console.log($("input[name='mno']").val());
	        		}
	        	</script> 
		        
		        <br><br><br>
	        	</div>
		
				<!-- 푸터바 -->
				<jsp:include page="../common/footer.jsp" />
			</div>
		</div>
    </div>

</body>
</html>