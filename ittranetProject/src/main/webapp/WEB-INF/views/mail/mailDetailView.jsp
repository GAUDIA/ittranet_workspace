<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
           width:1200px;
           height:800px;
           margin:10px;
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
    .mainOuter>div{float:left; width:100%}
    #buttonbar>button{
    	float:right;
    	padding-left:5px;
		width:50px;
        height:40px;
    }      
	#mailalllist {
		text-decoration:none;
		color:white;
	}

    
    
   .mainOuter{
           /*margin:auto;*/
           margin:10px;
           width:800px;
           height:800px;
          }
    .btn{
         float:right;
         margin:5px; 
         font-family: 'Gowun Dodum', sans-serif;      
    }
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
			
			<form id="detaildelete" action="detail.ml" method="post">
				<input type="hidden" name="mno" value="${ m.sendMailNo }">
				<input type="hidden" name="rvno" value="${ m.receiveMailNo }">


			<!-- 버튼바 (목록, 삭제, 스팸, 답장) -->
	        <div id="buttonbar">
	        	<button type="button" class="delete" class="btn btn-danger" onclick="detaildelete();">삭제</button>
	            <button type="button" class="spam" class="btn btn-warning" onclick="spamMail();">스팸</button>
	            <button type="button" class="answer" class="btn btn-secondary" onclick="asMail();">답장</button>
	         	<button type="button" class="backpage" class="btn btn-secondary" onclick="history.back()">뒤로</button>
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
	            <input type="hidden" spam="${m.spam }">
	            
	            <hr>
	            
	            <div>
				<c:forEach var="at" items="${ list }">
	            	<c:choose>
	            		<c:when test="${ empty at.originName }">
	            			첨부파일이 없습니다.
	            		</c:when>
	            		<c:otherwise>
	            			<a href="${at.filePath}${ at.changeName }" download="${at.originName}">${ at.originName }</a>	
	            		</c:otherwise>
	            	</c:choose>
	            </c:forEach>
	            </div>
	        </div>
	        
	        </form>
	        
	        <!-- 
	        <script>
	        function fileDownload(fileNameKey, fileName, filePath){
	            
	            location.href = "/board/fileDownload?fileNameKey="+fileNameKey+"&fileName="+fileName+"&filePath="+filePath;
	        }
	        </script>
	         -->
	        
	        
			
	        <!-- 메일 삭제 
	        <script>
	        function detaildelete() {
	        	$("#detaildelete").submit;
	        }
	        </script>-->
	          
	        
	        <!-- 메일 스팸처리 -->
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
	        			   alert("스팸메일 전송 완료");
	        			   location.href="alllist.ml?cpage=1";
	        		   }else{
	        			   alert("스팸메일 전송 실패");
	        		   }
	        	    },
	        	   error : function (data) {
	        	    	alert('ajax 스팸 메일 전송 실패');
	        	   }
	        })
	        }
	        
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

</body>
</html>