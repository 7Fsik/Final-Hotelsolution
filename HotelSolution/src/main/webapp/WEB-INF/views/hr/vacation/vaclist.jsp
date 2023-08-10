<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .main {
    width: 100%;
    height: 100%;
}

.main-container{
    width: 100%;
    height: 100%;
    background-color: #dedede;
    display: flex;
} 
#img1{
	height: 20px;
}
.memberListBody{
		width : 100%;
		height : 100%;
		margin-right: 40px;
		overflow: scroll;
		
		
		
	}
	.memberListWrap{
        display:grid;
		width : 100%;
		height : 100%;
        border: 0px solid #3B444B;
        border-radius: 20px;
        background-color: white;
        grid-template-rows: 2fr 11fr;	
	}
	.writememberListWrap{
		display:grid;
		grid-template-columns: 4fr 1fr;	
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width:1200px;
		height : 680px;
       
		
	}
   	.listWrap{
   		
   		
   		display:grid;
        grid-template-rows: 1fr 12fr 1fr ;
        margin-left : 20px ;
        width: 900px;
   		height:645px;
   		border: 1px solid #3B444B;
        border-radius: 20px;
        
        padding:20px;
   	}
   	.vacList{
   		display:grid;
        grid-template-rows: 4fr 4fr 4fr ;
        gap :10px;
   	}
   	.newMemberListWrap{
   		display:grid;
        grid-template-rows: 1fr 1fr 12fr;
        margin-left: 20px;
        width: 350px;
   		height:645px;
   		border: 1px solid #3B444B;
        border-radius: 20px;
        padding:20px;
        overflow: auto;
   	}
  
    .main-container{
	    width: 100%;
	    height: 100%;
	    background-color: #dedede;
	    display: grid;
    	grid-template-columns: 1fr 3fr;
	}
	
	
	.main-aside{
	    width: 276px;
	    height: 900px ;
	    display: flex;
	    flex-direction: column;
	    margin-left: 150px;
	    margin-top: 50px;
	}
	
	.profile-box{
	    width: 100%;
	    height: 360px ;
	    background-color: #3b444b;
	}
	
	.main-aside-empty{
	    width: 100%;
	    height: 40px;
	}
	
	.team-menu-bar{
	    width: 100%;
	    height: 360px;
	    background-color: #ffffff;
	}
	.memberListTop{
		display:grid;
		grid-template-columns: 2fr 3fr 2fr 4fr 4fr 5fr;
		border: 1px solid #3b444b;	
		box-sizing: border-box;
		background-color: #3b444b;
		font-weight:bold;
		font-size: 20px;
		color: white;
	}
	.memberListTop > div{
		width:100%;
		height:100%;
		
		text-align: center;
		padding-top: 15px;
		box-sizing: border-box;
	}
	
	.bbr{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    cursor: pointer;
	}
	.bbrt{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    margin-left: 10px;
	}
	#page-area{
   		margin :auto;
   	 	width: 400px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
        }
      .tt{
      	padding-left: 40px;
        }
        #img1{
        	height: 20px;
        }
        .ac{
        	font-size: 30px;
        	
        }
     .ttt{
        margin-left: 60px; 
		margin-top: 35px;  
		text-align: left; 
		font-size: 40px;
        }
     .ttc{
     	cursor: pointer;
     	padding-top: 20px;	
     }
  
    .accept{
    	margin-top: 10px;
    	padding-top:2px;
    	width:40px;
    	height : 25px;
    	border:1px solid black;
    	cursor: pointer;
    	border-radius: 10px;	
    	text-align: center;
    	font-size: 15px;
    }
    .accept:hover{
    	  background-color: rgba(59, 68, 75, 0.2); /* #3b444b 색상의 투명도 50% */
    }
    .newMemberListTop{
    	
	    border: 1px solid #3b444b;
	    box-sizing: border-box;
	    background-color: #3b444b;
	    font-weight: bold;
	    font-size: 20px;
	    color: white;
    	
    	
		text-align: center;
		padding-top: 12px;
		box-sizing: border-box;
    }
    .newMemberList{
        border: 1px solid #3b444b;
	    box-sizing: border-box;
	    font-size: 20px;
    	display: grid;
    	grid-template-columns: 6fr 1fr;
    	
		text-align: center;
		box-sizing: border-box;
    	overflow: auto;
    }
    .main {
    width: 100%;
    height: 100%;
}

.main-container{
    width: 100%;
    height: 100%;
    background-color: #dedede;
    display: flex;
} 
.memberVoList{
	display: grid;
    grid-template-columns: 2fr 3fr 2fr 4fr 4fr 4fr;
    border: 1px solid #3b444b;
    box-sizing: border-box;
    padding-top:10px;
   
}
.memberVoList:hover{
	 background-color: rgba(59, 68, 75, 0.2); /* #3b444b 색상의 투명도 50% */
    
}
.ac{
	text-align: center;
}
.acNamediv{
	padding-top:10px;
	font-size: 15px;
}
.aj{
	display: grid;
	 grid-template-rows: repeat(10,1fr);
}
.vac{
	border: 1px solid #3b444b;
	border-radius: 20px;
	padding-top: 10px;
	padding-left:10px;
	display:grid;
	grid-template-columns: 1fr 3fr 2fr  ;
       
	
}
.pf{
	width: 100px;
	height: 100px;
	border-radius: 80px;
}
.vac2{
	height:100px; 
	display: grid;
	grid-template-rows:1fr 2fr; 
	border: 1px solid #3b444b;
	border-radius: 20px;
	
	
}
.vac2Name{
	margin-top:5px;
	font-size: 18px;
	text-align: center;
}
.vac2Date{
	margin-top:5px;
	font-size : 15px;
}
.vac2B{
	display: grid;
	grid-template-columns:1fr 3fr; 
}
.vac2D{
	display: grid;
	grid-template-rows:1fr 1fr; 
}
.vac2pf{
	margin-left:5px;
	width: 60px;
	height: 60px;
	border-radius: 40px;
}
.vac:hover{
	background-color: rgba(59, 68, 75, 0.2);
	cursor: pointer;
}
.vac2:hover{
	background-color: rgba(59, 68, 75, 0.2);
	cursor: pointer;
}
</style>
</head>
<body>
	<div id ="wrap">

	   <%@ include file="/WEB-INF/views/common/main.jsp" %>
	
	   <div id="mainboard">
	   		<div class="memberListBody">
			    <div class="memberListWrap">
					<div class="ttt">휴가 승인 목록</div>
			    	
			        <div class="writememberListWrap">
			        	<div class="listWrap">
			        		<div class="tt">
		        				 <form action="${root}/hr/vacation/vaclist" method="get" style="margin-left: 500px;">
						                <input type="hidden" value="1" name="page">
						                    <select name="searchType" id="opt" >
						                        <option value="teamName" >부서</option>
						                        <option value="positionName" >직책</option>
						                        <option value="name" >이름</option>
						                        <option value="id">전화번호</option>
						                        
						                    </select>
						                    
						               
						                    <input class = "searchValueElem " id="searchValue" type = "text" name = "searchValue" value = "${searchVo.searchValue}" placeholder="검색할 내용">
						                    
						                     <input type="image" id="img1" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Submit" />
						            </form>
	               						
			        		</div>
			        		
					        	<div class="vacList">
									<c:forEach items="${vdvoList}" var="vdvo"> 
										<div class="vac" onclick="goDetail(${vdvo.userNo})">
											<div class="pfimage" style="display:grid; grid-template-rows: 3fr 1fr;">
												<div><img class="pf" src="${root}/resources/img/member/profile/${vdvo.image}" alt="사진"></div>
												<div>이름 : ${vdvo.name}</div>
											</div>
											<div style="display:grid; grid-template-rows: 1fr 1fr 2fr;">
												<div style="display:grid; grid-template-columns: 1fr 1fr;">
													<div>제목 : ${vdvo.title}</div>
													<div>부서 : ${vdvo.teamName}</div>
												</div>
												<div>기간 : ${vdvo.vacationStart} ~ ${vdvo.vacationEnd} </div>
												<div>사유 : ${vdvo.content}</div>
											</div>
											<div style="display:grid; grid-template-rows: 1fr 1fr 1fr 1fr;">
												<div>직책 : ${vdvo.positionName}</div>
												<div>전화번호 : 0${vdvo.id}</div>
												<div>신청일 : ${vdvo.enrollDate}</div>
												<div></div>
											</div>
										</div>
									</c:forEach>
										
									
									
								</div>
							
							
							 <div id="page-area">
				            	<c:if test="${pv.currentPage > 1}">
					            	<a  href="${root}/hr/vacation/vaclist?submitListpage=${pv.currentPage - 1}&searchType=${searchType}&searchValue=${searchValue}">이전</a>
				            	</c:if>
					            	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
					            		<c:if test="${pv.currentPage != i}">
							            	<a  href="${root}/hr/vacation/vaclist?submitListpage=${i}&searchType=${searchType}&searchValue=${searchValue}">${i}</a>
					            		</c:if>
					            		<c:if test="${pv.currentPage == i}">
							            	<a >${i}</a>
					            		</c:if>
					            	</c:forEach>
					            <c:if test="${pv.currentPage < pv.endPage}">
					            	<a  href="${root}/hr/vacation/vaclist?submitListpage=${pv.currentPage + 1}&searchType=${searchType}&searchValue=${searchValue}">다음</a>
					            </c:if>
					            <div class="searchType" hidden="">${searchType}</div>
					            <div class="searchValue" hidden="">${searchValue}</div>
				            </div>


						</div>
						
						<div class="newMemberListWrap">
							
							<div class="ac">휴가 대기 목록</div>
				            <div class="newMemberListTop">
				                <div>휴가 결재 대기</div>
				                
				            </div>
				                <div style="overflow-y:auto; ">
				                <br>
				                	<c:forEach items="${vdvoList2}" var="vdvo"> 
										<div class="vac2" onclick="goDetail(${vdvo.userNo})" >
											<div class="vac2Name">[${vdvo.teamName}](${vdvo.positionName})${vdvo.name} </div>
											<div class="vac2B">
												<div class="vac2Img">
													<img class="vac2pf" src="${root}/resources/img/member/profile/${vdvo.image}" alt="사진">
												</div>
												<div class="vac2D">
													<div class="vac2Date">${vdvo.vacationStart} ~ ${vdvo.vacationEnd}  </div>
													<div class="vac2Date">신청일 : ${vdvo.enrollDate}</div>
												</div>
											
											</div>
										</div>
										<br>
									</c:forEach>
				                
				                </div>
						</div>
			        </div>
			    </div>
		    </div>

						
						
					
		</div>
	</div>
	
</body>
<script type="text/javascript">
	function goDetail(memberNo) {
		
		 window.location.href = '${root}/hr/em/getDetail?memberNo=' + memberNo ;
		
	}
</script>
</html>
	   		
				
				 
				