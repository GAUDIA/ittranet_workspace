<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.h4j.ITtranet.project.model.vo.Newsfeed" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .project_mn{
     		color:#000000;
     	}
    .wrap{
       padding: 30px;
    }
    .menuname{
        display:inline-block;
        width: 300px;
        margin-left: 20px;
    }
    
    button{
        width: 80px;
        height: 35px;
        border: none;
        border-radius: 1mm;
        font-size: 13px;
        font-weight: bold;
        color: white;
    }
    .button1{
        background-color: rgb(165, 137, 177); 
        float: right;
        margin: 10px;
        margin-right: 100px;
        border-radius: 1mm;
    }
    .todo{
        margin-left: 50px;
    }

    tr{
        height: 40px;
        background-color: rgba(255, 255, 255, 0.57);
        border-bottom: 1px solid silver;
        font-size: 13.5px;
    }

    #newsfeed{
       padding: 15px;
       margin-left: 10px;
   }

   #feedwrite{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       width: 830px;
       height: 200px;
       padding: 10px;
       background-color: rgba(211, 196, 220, 0.47);
   }

   #write{
       width: 790px;
       height: 90px;
       border-radius: 2mm;
       border:1px solid rgb(190, 190, 190);
       margin: 10px;
   }

   #file{
       margin-left: 130px;
       margin-top: 5px;
       font-size: 13px;
   }

   #writeok{
       float: right;
       margin-right: 20px;
       border-radius: 1mm;
       width: 70px;
   }

   .feedlist{
       border:1px solid rgb(190, 190, 190);
       border-radius: 5mm;
       background-color: rgba(224, 224, 224, 0.87);
       width: 830px;
       padding: 10px;
       margin-top: 20px;
       
   }
   .userProfile{
       display:inline-block;
       width: 70px;
       height: 70px;
       background-color: white;
       border-radius: 50%;
       margin: 10px;
   }
   .projectmem{
       display:inline-block;
       width: 500px;
       height: 30px;
       margin-left: 10px;
   }
   .feedcontent{
       width: 680px;
       margin-left: 105px;
       font-size: 13px;
   }
   .buttons{
       float: right;
       margin: 25px;
       font-size: 13px;
   }

   .btn1{
       background-color: rgb(165, 137, 177);
       border-radius: 1mm;
       width: 50px;
       height: 30px;
   }

   .btn2{
       background-color: rgb(160, 156, 163);  
       border-radius: 1mm;   
       width: 50px;
       height: 30px;
    }
   .reply{
       background-color: rgb(227, 210, 235);
       border-radius: 3mm;
       border: 1px solid rgb(204, 204, 204);
       width: 700px;
       margin-left: 100px;
       margin-top: 15px;
       padding: 15px;
   }
   .replylist{
       margin-bottom: 15px;
   }
   .date{
       float: right;
       margin-right: 70px;
   }
   .replycontent{
       width: 585px;
       height: 60px;
       border-radius: 2mm;
       border: 1px solid rgb(199, 198, 198);
   }
   .replyok{
       background-color: rgb(187, 159, 202);   
       margin-left: 8px;
       border-radius: 1mm;
       width: 70px;
   }

   #replyButton{
       width: 70px;
       height: 40px;
       border-radius: 2mm;
       background-color: rgb(184, 181, 181);
   }
   ::placeholder{
       font-size: 13px;
   }

   .modal-overlay{
        width: 300px;
        height: 300px;
        padding: 15px;
        background-color :rgb(244, 240, 245);
        border: 1px solid rgb(199, 198, 198);
        border-radius: 2mm;
   }

   .todoButtons{
        margin-left: 120px;
        margin-top: 10px;
   }
   
   #modalid{
        width: 300px;
        height: 260px;
        position: absolute;
        margin: auto;
   }
   .proTodo{
       margin: 20px;
       width: 800px;
       height: 100px;
       border-radius: 2mm;
       margin-left: 50px;
       background-color: rgb(197, 181, 204);
   }

   .todoTabletr{
       border: none;
   }
   
    .updateFeed{
        width: 830px;
        height: 230px;
        border:1px solid rgb(190, 190, 190);
        border-radius: 5mm;
        background-color: rgb(231, 217, 238);
        padding: 30px;
        margin-top: 15px;
    }
    #nfContent{
        width: 760px;
        margin : auto;
        border-radius: 2mm;
        height: 150px;
        border: 1px solid rgb(202, 202, 202);
    }
    .replyUpButton{
        width: 50px;
        margin-right:10px;
        border-radius: 1mm;
        height: 30px;
        background-color: rgb(203, 188, 218);
    }
        .replyDelButton{
        width: 50px;
        margin-right:10px;
        border-radius: 1mm;
        height: 30px;
        background-color: rgb(203, 188, 218);
    }
    .okButton{
       float: right;
       margin-right: 20px;
       border-radius: 1mm;
       width: 70px;
       background-color: rgb(203, 188, 218);
    }
    .cancelButton{
       float: right;
       margin-right: 20px;
       border-radius: 1mm;
       width: 70px;
       background-color: rgb(190, 190, 190);
    }   
</style>
</head>
<body>
<div class="back">
 <div class="innerBack">
 	<jsp:include page="../common/pageHeader.jsp" />
 	<jsp:include page="../common/userMenu.jsp" />
 	
 	<br clear="both">
 	<div style="position:relative">
 	<jsp:include page="../common/sidebar.jsp"  />
 		<div class="cont">
          <ul id="ac">
             <li class="division">
               <a href="#">????????????</a>
             </li>
                <div id="border">
		               <li class="menu1">
		                  <a href="list.pr">??? ????????????</a>
		               </li>
		               <li class="menu1">
		                  <a href="newpro.pr">???????????? ?????????</a>
		               </li>
		               <li class="menu1">
		                  <a href="todo.pr">??? ??????</a>
		               </li>
		               <li class="menu1">
		                  <a href="news.pr">????????????</a>
		               </li>
            	</div>
            </ul>
         </div>
 

    <div class="mainOuter"> 
    <div class="wrap">   
        <h4 style="font-weight:bold;">${ prTitle }</h4>
        
        <!--?????? ??????, ?????? ??????, ?????????-->
        <div class="menuname">
            <br>
            <h6 style="font-weight: bold;">&emsp;???????????? ?????? ??????</h6>
        </div>
            <button id="newTodo" class="button1" onclick="openNew();">??? ??????</button>
          
            <br><br>
            <div class="proTodo">
                <table class="todoTable" style="text-align: center;">
                    <tr class="todoTabletr" style="background-color: transparent;">
                        <th rowspan="2" style="width: 250px; height: 70px; font-size: 60px;" > <fmt:formatNumber value="${(todoO/todoAll)*100}" pattern="#,#0.0" /></h>%</h1> </th>
                        
                        <th style="width: 100px;">??????</th>
                        <th style="width: 100px;">?????????</th>
                        <th style="width: 100px;">??????</th>
                        <th style="width: 100px;">??????</th>
                    </tr>
                    <tr class="todoTabletr" style="background-color: transparent;">
                        <td>${ todoW }</td>
                        <td>${ todoY }</td>
                        <td>${ todoO }</td>
                        <td>${ todoL }</td>
                    </tr>
                </table>
            </div>
        <table class="todo" width="780" style="text-align: center;" >
            <thead>
                <tr style="background-color: rgba(209, 189, 220, 0.7); border: none; font-size: 14px; ">
                    <th width="50">no</th>
                    <th width="340px">??????</th>
                    <th width="115">?????????</th>
                    <th width="115">??????</th>
                    <th width="115">?????????</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="t" items="${ todo }">
                <tr>
                    <td>
                  	 1
                    </td>
                    <td>${ t.todoTitle }</td>
                    <td>${ t.empName }</td>
                    <td>
	                   <c:choose>
	                       <c:when test="${ t.status eq 'W'}">
	                        	??????
	                       </c:when>
	                       <c:when test="${ t.status eq 'Y'}">
	                           	?????????
	                       </c:when>	                            		
	                       <c:when test="${ t.status eq 'O'}">
	                                                              ??????
	                       </c:when>
	                       <c:when test="${ t.status eq 'L'}">
	                           	??????
	                        </c:when>	                            		
	                        <c:when test="${ t.status eq 'N'}">
	                           	??????
	                        </c:when>
	                      </c:choose>    
                    </td>
                    <td>${ t.todoEnddate }</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
 
        <!-- ?????? ???????????? -->
        <div class="menuname">
            <br><br>
            <h6 style="font-weight: bold;">&emsp;??????</h6>
        </div>
        
        <div id="newsfeed">
           <!--????????? ??????-->
           <div id="feedwrite">
                 <form id="ttt" action="ninsert.pr" method="post" enctype="multipart/form-data">
				   <input type="hidden" name="prNo" value="${prNo}">
				   <input type="hidden" name="empNo" value="${ loginUser.empNo }">
				   <input id="write" name="nfContent" type="text" placeholder="&emsp;????????? ??????????????????">
          		   <input id="upfile" type="file" class="upfilec" name="upfile">
                    <br>
           		   <button type="submit" id="writeok"  style="background-color: rgb(187, 159, 202);">??????</button>
	  			 </form>
		    </div>

            <!-- ????????? -->
            <c:if test="${!empty list}">
            <c:forEach var="n" items="${ list }">
	            <div class="feedlist">
                   <c:choose>
                      <c:when test="${ loginUser.profile eq 'NULL'}">
                         <img class="userProfile" src="resources/images/userprofile.png">
                      </c:when>
                      <c:otherwise>
                         <img class="userProfile" src="${ loginUser.profile }">
                      </c:otherwise>
                   </c:choose>
	                <div class="projectmem">
	                    <b>${n.empName } &emsp;&emsp;&emsp;</b>
	                    <h style="font-size: 12px; color: dimgray;">${n.nfDate } &emsp; 13:01</h>
	                </div>
	                
	                <!-- ????????????, ???????????? ????????? ????????? ???????????? ????????? ??????????????? -->
	                	<c:if test="${ loginUser.empNo eq n.empNo }">
                            <div class="buttons">
                                <button id="updateFeed" class="btn1" onclick="updateFeed(this);">??????</button>
                                <button id="deleteFeed" class="btn2" onclick="feedDelete();">??????</button>
                            </div>
	               		</c:if>                     
	           
                            <form id="postForm" action="" method="post">
                                <input type="hidden" name="nfNo" value="${ n.nfNo }">
                                <input type="hidden" name="prNo" value="${ n.prNo }">
                            </form>	               		
	                   
                            <script>
                               function feedDelete(){
                                  $("#postForm").attr("action", "delete.pr").submit();
                                }
                            </script>

					<!-- ????????? ?????? -->
	                <div class="feedcontent">
	                    <p>${n.nfContent}</p>
	                    <form id="postForm" action="" method="post">
                                <input type="hidden" name="nfNo" value="${ n.nfNo }">
                        </form>
	                   
	                    <!-- ???????????? ?????? -->
	                    <div class="attdiv">
	                    <c:choose>
							<c:when test="${ n.originName eq null}">
								 ??????????????? ????????????.
							</c:when>
							<c:otherwise>
									???????????? <a href="${ n.changeName }" download="${ n.changeName }" class="aTag">${ n.originName }</a><br>
							</c:otherwise>
						</c:choose>	      	                    
	                    </div>
              	       
	                </div>

	                <!--??????-->
	                <div class="reply" style="font-size: 13px;">
	                    <div class="replylist">
                            <table id="replyArea">
                              <thead style="background-color:rgb(187, 159, 202)">                                 
                              	<tr>         	 
                                    <td colspan="3">
                              		  <textarea id="replyContent" type="text" name="reply" cols="80" rows="3" style="resize:none; margin:10px; border-radius: 2mm;"></textarea>                            	
                                    </td>
                                    <td>
                                        <button id="replyButton" onclick="addReply(${n.nfNo}, $(this).parents('.feedlist'), $(this).parents('#replyArea').find('#replyContent'));"><b>??????</b></button>  
                                    </td>
                                </tr>
                              </thead>
                              <tbody style="background-color:rgb(187, 159, 202)">
                              </tbody>
                            </table>
	                    </div>
	                    </div>
   			    </div>
       
   <!-- ???????????? ???????????? ???????????? ?????? ???  -->
    	<div class="updateFeed" style="display:none;">
			<div class="update">
			<form id="uu" action="update.pr" method="post" enctype="multipart/form-data">
				<textarea id="nfContent" name="nfContent"></textarea>
				<input id="upfile" type="file" name="reupfile" value="${n.originName}">
				<input type="hidden" name="prNo" value="${n.prNo}">
				<input type="hidden" name="nfNo" value="${n.nfNo}">
				<button type="submit" class="okButton">??????</button>
				<button type="submit" data-dismiss="modal" class="cancelButton">??????</button>	
			</form>
			</div>   
		</div>
    </c:forEach>
</c:if>

     <script>
          function updateFeed(btn){
                $(btn).parent().parent().next(".updateFeed").attr("style", "display:block");
                $(btn).parent().parent().attr("style", "display:none");
           }
          
      </script>




	<!-- ?????? script -->

	<script>
		
	$(function(){
		$(".feedlist").each(function(){
			
			selectReplyList($(this).find("input[name=nfNo]").val(), $(this));
			
		})
		
	})
	
		function addReply(no, newsDiv, content){
			
			if(content.val().trim().length != 0){
				$.ajax({
					url : "rinsert.pr",
					data : {
						refNo:no,
						empNo:${ loginUser.empNo },
						replyContent:content.val()
					}, success:function(status){
						if(status == "success"){
							selectReplyList(no,newsDiv);
							content.val("");
						}
					}, error:function(status){
						console.log("??????????????? ajax?????? ??????");
					}
				})
			}else{
				alertify.alert("?????? ????????? ?????? ??????????????????!");
			}
		}

	</script>
	
	
	<script>
	
	function selectReplyList(no, newsDiv){ 
        $.ajax({
           url:"rlist.pr",
           data:{
        	   nfNo:no
        	},
           success:function(list){
              console.log(list);
              let value = "";
              for(let i in list){
            	  if(list[i].empNo == '${loginUser.empNo}'){
                      value +="<tr>"
                          +   "<th width='30'>"+ list[i].empName + "</th>"
                          +   "<td width='200'>" + list[i].replyContent + "</td>"
                          +   "<td width='40'>"+ list[i].createDate + "</td>"
                          +   "<td width='20'>"+ "<button type='button' class='replyUpButton'> ?????? </button>"  +"</td>"	
                          +   "<td  width='20'>"+ "<button type='button' class='replyDelButton'> ?????? </button>" +"</td>"	
                          + "</tr>"
            	  }else{
            		     value +="<tr>"
                             +   "<th width='30'>"+ list[i].empName + "</th>"
                             +   "<td width='200'>" + list[i].replyContent + "</td>"
                             +   "<td width='20'></td>"
                             +   "<td width='40'>"+ list[i].createDate + "</td>"	
                             +   "<td width='20'></td>"   
                             + "</tr>"
            	  }
              }

              
              //$("#replyArea tbody").html(value);
              newsDiv.find("#replyArea tbody").html(value);
              
           },error:function(){
              console.log("???????????????????????? ajax ????????????");
           }
        })
        
        function updateReply(btn){
                $(btn).parent().parent().next("#replyButton").attr("style", "display:block");
                $(btn).parent().parent().attr("style", "display:none");
                console.log("???????");
           }
        

     }
	</script>
	
	<script>

	// ?????? ?????? ??????
	function delReply(replyNo){
		$.ajax({
			url:"rdelete.pr",
			data:{
				replyNo:replyNo
			},success:function(status){
				if(status == "success"){
					selectReplyList();
				}
			},error:function(){
				console.log("?????? ????????? ajax ?????? ??????");

			}
		})
	}
	
	</script>
    </div>
    </div>
    </div>
    </div>
   <!-- ??? ?????? ?????? ?????? -->
<div class="modal-overlay" id="modalid">
    <div class="modal-window">
        <h6 class="modal-title">??? ??????</h6>
            <div class="modal-body">
                <table class="makeTodo">
                    <tr style="background-color: transparent;">
                        <th><label for="tdTitle">?????????</th>
                        <td><textarea name="tdTitle" id="tdTitle" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="tdEnddate">?????????</label></th>
                        <td><textarea name="tdEnddate" id="tdEnddate" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="todoContent">??????</label></th>
                        <td><textarea name="todoContent" id="todoContent" rows="4" cols="30" ></textarea></td>
                    </tr>
                </table>
                    <div class="todoButtons">
                        <button type="button" onclick="closeTodo();" style="background-color: rgb(190, 190, 190);">??????</button>
                        <button type="button" onclick="insertTodo();" style="background: rgba(207, 168, 241, 0.45);">??????</button>
                    </div>   
                </div>
                
                <script>
              	
            	    closeTodo()
                
                	function openNew(){
                		$('#modalid').show();
                	}
                	
                	function closeTodo(){
                		$('#modalid').hide();
                	}
                	
                    function insertTodo(){
                        $.ajax({
                            url:"tdinsert.pr",
                            data:{
                                prNo:'${ prNo }',
	                			empNo:'${loginUser.empNo}',
	                			todoTitle:$("#tdTitle").val(),
	                			todoEnddate:$("#tdEnddate").val(),
	                			todoContent:$("#todoContent").val()
	                		}, success:function(status){
	                			if(status == "success"){
								    console.log("??? ?????? ajax ?????? ??????")
	                			    close();
                                    location.reload();
	                			}
	                		}, error:function(){
	                			console.log("??? ?????? ajax ?????? ??????")
                            }
                        })
                    }

                </script>
  
        </div>

 <!-- ?????? ?????? ?????? -->
<div class="modal-overlay" id="modalupdate">
    <div class="modal-window">
        <h6 class="modal-title">?????? ??????</h6>
            <div class="modal-body">
                <table class="makeTodo">
                    <tr style="background-color: transparent;">
                        <th><label for="tdTitle">?????????</th>
                        <td><textarea name="tdTitle" id="tdTitle" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="tdEnddate">?????????</label></th>
                        <td><textarea name="tdEnddate" id="tdEnddate" rows="1" cols="30"></textarea></td>
                    </tr>
                    <tr style="background-color: transparent;">
                        <th><label for="todoContent">??????</label></th>
                        <td><textarea name="todoContent" id="todoContent" rows="4" cols="30" ></textarea></td>
                    </tr>
                </table>
                    <div class="todoButtons">
                        <button type="button" onclick="closeTodo();" style="background-color: rgb(190, 190, 190);">??????</button>
                        <button type="button" onclick="insertTodo();" style="background: rgba(207, 168, 241, 0.45);">??????</button>
                    </div>   
                </div>

  
        </div>
	


 

</body>



</html>