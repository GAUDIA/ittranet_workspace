<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
    <style>
        .contentArea{
            height: 720px;
            text-align: center;
        }
        #title{
            font-size: 20px;
            margin:10px;
            margin-left: 20px;
            font-weight: 700;
            color:rgb(94, 94, 94);
        }
        #searchBox-1{
            border:2px solid lightgray;
            width: 90%;
            height:50px;
            text-align: center;
            margin:auto;
            padding: 5px 0px;
        }
        .stitle{
            display: inline-block;
            font-size: 18px;
            font-weight: 600;
            color:rgb(94, 94, 94);
            margin-right: 3px;
        }
        .searchBox{
            display: inline-block;
            width:240px;
            height:30px;
            border:1px solid lightgray;
            border-radius: 2px;
            vertical-align: middle;
            margin-top:-5px;
        }
        .sinput{
            font-size: 15px;
            width:170px;
            height:90%;
            padding:1px;
            border:0px;
            outline: none;
            float:left;
        }
        .searchBox button{
            width:50px;
            height:100%;
            border:0px;
            background-color: rgba(19, 33, 142, 0.2);
            outline: none;
            float:right;
            border-radius: 2px;
        }
        
        .tablelayout{
            width:90%;
            height:200px;
            margin:auto;
            border-bottom: 2px solid rgba(94, 94, 94, 0.6);
            overflow-y:auto;
            position:relative;
        }
        .boardList{
            width:100%;
            table-layout: fixed;
            empty-cells:show;
            text-align: center;
        }
        .boardList tr{
            white-space:normal;
            word-break:break-all;
            height:30px;
        }
        .boardList th{
            background-color: #6C6C6C;
            color:white;
            padding:8px;
        }
        .boardList thead{
        	position:sticky; top:0px;
        }
        

        .arrowbtn{
            background-color: white;
            border:none;
            border-radius: 5px;
            width:30px;
            height:30px;
            margin:20px 10px;

        }
        .arrowbtn img{
        	width:25px;
            height:25px;
            margin:auto;
        }        
        #savebtn{
            background-color: #6C6C6C;
            color:white;
            width:80px;
            height: 40px;
            border:none;
            border-radius: 3px;
        }

        hr{
            border:1px solid gray;
            background-color: gray;
        }
        
        input[type="checkbox"]:checked {
	        background-color: red;
	        border-color: rgba(255, 255, 255, 0.3);
	        color: white;
	    }

        
    </style>
    <body>
    <!-- ????????? ????????? -->    	
	<div class="modal-header">
	  <h5 class="modal-title" id="lineModalLabel">????????? ??????</h5>
	  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	    <span aria-hidden="true">x</span>
	  </button>
	</div>
	
	<!-- Modal body -->
	<div class="modal-body">
        <div class="contentArea">
    
            <br>
            
            <!-- ???????????? -->
            <div id="searchBox-1">

	                <div style="margin-top:5px;">
	                    <label class="stitle">???</label>
	                    <div class="searchBox">
	                        <input type="text" id="keywordTeam" value="" class="sinput" placeholder="????????? ??????">
	                        <button onclick="searchList(1)" class="sbtnTeam">??????</button>
	                    </div>
	
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	                    <label class="stitle">??????</label>
	                    <div class="searchBox">
	                        <input type="text" id="keywordName" value="" class="sinput" placeholder="????????? ??????">
	                        <button onclick="searchList(2)" class="sbtnName">??????</button>
	                    </div>
	                </div>
	        	       
            </div>
            
        <br>
        
            <div class="tablelayout">
	            <table class="boardList" id="boardList" align="center">
	                <thead>
	                  <tr>
	                    <th width="10%"></th>
	                    <th>???</th>
	                    <th>??????</th>
	                    <th>??????ID</th>
	                    <th>?????????</th>
	                  </tr>
	                </thead>
	                <tbody>
	                    
	                    
	                </tbody>
	            </table>
	        </div>

            <button class="arrowbtn"><img src="resources/images/approval/down-arrow.png" alt=""></button>
            <button class="arrowbtn"><img src="resources/images/approval/up-arrow.png" alt=""></button>
			
			<div id="cloneTest"></div>
            <div class="tablelayout">
            	
	            <table class="boardList" align="center">
	                <thead>
	                  <tr>
	                    <th width="10%"></th>
	                    <th>???</th>
	                    <th>??????</th>
	                    <th>??????ID</th>
	                    <th>?????????</th>
	                  </tr>
	                </thead>
	                <tbody id="boardListTwo">
	                    
	
	                </tbody>
	            </table>
	            
	        </div>

            <br><br>
            <button data-dismiss="modal" id="savebtn" type="button" >????????????</button>
		

        </div>    
       </div>
       
    <script>
    /*????????????*/
    	function searchList(flag){
    		
    		let keyword="";
    		if(flag == 1 ){
    			keyword = $("#keywordTeam").val();
    		} else {
    			keyword = $("#keywordName").val();
    		}
	    			
	    		$.ajax({
	    			type : 'GET',
	    			url:"search.fo",
	    			data:{
	    				keyword:keyword,
	    				flag:flag
	    			}, success : function(list){
	    				
				    		console.log(keyword);	
		    				console.log(list);
		    				
		    				//????????? ?????????
		    				$('#boardList > tbody').empty();
		    				
		    				let str="";
		    					for(let i in list){
		    						str +="<tr class='rows'>"
			    						   + "<td><input style='zoom:1.5;' type='checkbox' onclick='changeColor(this)' name='checkPerson'></td>"
			    						   + "<td name='team'>"+ list[i].team + "</td>"
			    						   + "<td name='job'>"+ list[i].job + "</td>"
			    						   + "<td name='empId'>"+ list[i].empId + "</td>"
			    						   + "<td name='empName'>"+ list[i].empName + "</td>"
			    						   + "<input type='hidden' name='apempNo' value='" + list[i].empNo + "'>"
			    						   + "<input type='hidden' name='aplineNo' value=''>"
			    						   + "<input type='hidden' name='aplineOrder' value=''>"			    						   
		    						   + "</tr>";
		    					}
	   						$('#boardList > tbody').html(str);
	   						$("#keywordTeam").val('');
	   						$("#keywordName").val('');
	    			}, error:function(){
	    				console.log("ajax ?????? ??????");
	    			}
	    		})
    	}
    
    
    	/*???????????? ????????? ?????? ????????? td ????????? ??????*/
		function changeColor(t){
    		td = t.parentNode;
    		td.style.backgroundColor = (t.checked)? "rgb(233, 232, 232)" : "white";
    		tr = t.parentNode.parentNode;
    		tr.style.backgroundColor = (t.checked)? "rgb(233, 232, 232)" : "white";
    	}
    	
    	
    	/*???????????? ????????? ?????????*/
    	$(document).on("click", ".arrowbtn",function(){
    		
    		let checkValue = [];
    		let $downRow;
    		
    		$("input[name='checkPerson']:checked").each(function(){
	    		//downRow = $("input[name=checkPerson]:checked").parent().parent().html(); //????????????
	    		downRow = $(this).parent().parent().html(); //????????????
	    		checkValue.push(downRow);
	    		console.log(downRow);
    		});
    		
    		let trHtml = '';
    		for(let i in checkValue){
    			trHtml += '<tr>'+ checkValue[i] +'</tr>';
    		}
    		$("#boardListTwo").html(trHtml);    		
    	})
    	
    	

	  /* ???????????? ?????? ?????? */
	  $("#savebtn").on('click',function(){
		  
		  let value = "";
		  if($("#boardListTwo input[name=checkPerson]:checked").length==0){
			  alert("???????????? ???????????? ?????????");
			  return false;
		  } else {
			  $("#boardListTwo tr").each(function(i, tr){
				  value += "[" + (i+1) + "]"
				         + "<span>"+ $(tr).find("td[name=empName]").text() + " " + $(tr).find("td[name=job]").text() + "</span>"
				         + "<input type='hidden' name='appList[" + i + "].empNo' value='" +  $(tr).find("input[name=apempNo]").val() + "'>" //name='appList[0,1,...].empNo' value='empNo' 
				         + "<input type='hidden' name='appList[" + i + "].aplineOrder' value='" +  (i+1) + "'><br>";
			  })
			   console.log(value);
			  
			  value = '<span id="appLineText">????????? </span> <br>' + value;
			  
			  $("#appLine").html(value);
		  }
			  
	  })
	  
	  



	  
	  
	  
	  
	  
	  
	  
	  
	  
    	
    </script> 
       
    </body>
    </html>