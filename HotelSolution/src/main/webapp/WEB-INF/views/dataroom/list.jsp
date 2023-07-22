<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="dataRoomListPv" value="${map.dataRoomListPv}" />
<c:set var="dataVoList" value="${map.dataVoList}" />
<c:set var="categoryNo" value="${map.categoryNo}" />
<c:set var="searchValue" value="${map.searchValue}" />
<c:set var="searchType" value="${map.searchType}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
 <style type="text/css">
	.dataroomBody{
		width : 1300px;
		height : 820px;
		margin-left :20px;
		margin-right: 40px;
		overflow: scroll;
		
		
		
	}
	.dataroomWrap{
        display:grid;
		width:100%;
		height : 800px;
        border: 0px solid #3B444B;
        border-radius: 20px;
        background-color: white;
        grid-template-rows: 2fr 11fr;	
	}
	.writeDataroomWrap{
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width:97%;
		height : 680px;
        border: 1px solid #3B444B;
        border-radius: 20px;
		
	}
   	.listWrap{
   		
   		
   		display:grid;
        grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
        margin : 20px auto;
        width: 90%;
   		height:95%;
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
	.dataListTop{
		display:grid;
		grid-template-columns: 4fr 12fr 12fr 12fr 3fr 8fr;
		border: 1px solid #3b444b;	
		box-sizing: border-box;
		background-color: #3b444b;
		font-weight:bold;
		font-size: 20px;
		color: white;
	}
	.dataListTop > div{
		width:100%;
		height:100%;
		
		text-align: center;
		padding-top: 15px;
		box-sizing: border-box;
	}
	.dataList{
		display:grid;
		grid-template-columns: 4fr 12fr 12fr 12fr 3fr 8fr;
		border: 1px solid #3b444b;
		box-sizing: border-box;
	
	}
	.dataList > div{
		width:100%;
		height:100%;
		padding-top: 20px;
		padding-left: 20px;
		padding-right: 20px;
		box-sizing: border-box;
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    
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
	#data-page-area{
   		margin :auto;
   	 	width: 400px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
        }
      .tt{
      	display:grid;
      	padding-left: 40px;
      	grid-template-columns : 1fr 1fr 1fr 1fr 2fr;  
        }
     .ttt{
        margin-left: 60px; 
		margin-top: 35px;  
		text-align: left; 
		font-size: 40px;
        }
     .ttc{
     	cursor: pointer;
     	padding-top: 10px;	
     }
     .dataList:hover {
        background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
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
#img1{
	height:20px;
}
 a {
            text-decoration: none; /* Remove underline */
            color: #007bff; /* Set default link color (blue in this case) */
        }

        /* Apply Bootstrap button styles to <a> tags */
        a.tcca {
        	
            display: inline-block;
            padding: 0.375rem 0.75rem;
            margin-bottom: 0;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 0.25rem;
            color:#6c757d;
            
        }

        /* Set the link color on hover */
        a.tcca:hover {
            color: skyblue; /* Change to olive green (#28a745) on hover */
            text-decoration: none; /* Remove underline on hover */
        }

</style>
</head>
<body>

		<div id ="wrap">

		   <%@ include file="/WEB-INF/views/common/main.jsp" %>
		
		   <div id="mainboard">
		
		   		<div class="dataroomBody">
			    <div class="dataroomWrap">
			    <c:choose>
   				 <c:when test="${not empty dataVoList}">
					<div class="ttt">	${dataVoList.get(0).categoryName } 자료실</div>
			      </c:when>
				    <c:otherwise>
				       <div class="ttt"> 등록된 자료가 없습니다.</div>
				    </c:otherwise>
				</c:choose>
			        <div class="writeDataroomWrap">
			        	<div class="listWrap">
			        		<div class="tt">
			        				
			        				<div class="ttc">
									    <a class="tcca" href="${root}/dataroom/list?categoryNo=${loginMember.teamNo}&dataRoomListPage=1">부서</a>
									</div>
					        		<div class="ttc"><a class="tcca" href="${root}/dataroom/list?categoryNo=100&dataRoomListPage=1">개인</a></div>
					        		<div class="ttc"><a class="tcca" href="${root}/dataroom/list?categoryNo=0&dataRoomListPage=1">공용</a></div>
					        		<div class="ttc"  style="margin-right: 5px; text-align: right;"><a class="tcca" href="${root}/dataroom/write?categoryNo=${categoryNo}" style="color: #3b444b;">글작성</a></div>
		        					  <form action="${root}/dataroom/list" method="get" style="margin-reft: 10px; text-align: right; padding-top: 15px;">
							                <input type="hidden" value="1" name="page">
							                <input type="hidden" value="${categoryNo}" name="categoryNo">
							                    <select name="searchType" id="opt" >
							                        <option value="title" >제목</option>
							                        <option value="writerName" >작성자</option>
							                        <option value="securityLevelName" >보안등급</option>
							                        
							                    </select>
							                    
							               
							                    <input class = "searchValueElem " id="searchValue" type = "text" name = "searchValue" value = "${searchVo.searchValue}" placeholder="검색할 내용">
							                    
							                     <input type="image" id="img1" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Submit" />
							            </form>
	               						
			        		</div>
			        		
				        	<div class="dataListTop">
								<div class="bbrt">등급</div>
								<div class="bbrt">제목</div>
								<div class="bbrt">첨부파일</div>
								<div class="bbrt">작성자</div>
								<div class="bbrt">조회수</div>
								<div>작성일</div>
							</div>
							<c:if test="${not empty dataVoList}">
								<c:forEach begin="1" end="10" varStatus="status">
								    <c:set var="dataVo" value="${status.index <= dataVoList.size() ? dataVoList[status.index - 1] : null}" />
								    <div class="dataList" onclick="goDetail(${dataVo.dataNo},${dataVo.securityLevel},${loginMember.positionNo},${dataVo.writerNo},${loginMember.no})">
								        <div class="bbr">
								            <c:if test="${not empty dataVo}">
								                ${dataVo.securityLevelName}
								            </c:if>
								        </div>
								        <div class="bbr" style="padding-left: 70px;">
								            <c:if test="${not empty dataVo}">
								                ${dataVo.title}
								            </c:if>
								        </div>
								        <div class="bbr">
								            <c:if test="${not empty dataVo}">
								                (총 ${dataVo.fileCnt}개) ${dataVo.firstFile} 
								            </c:if>
								        </div>
								        <div class="bbr"style="padding-left: 70px;">
								            <c:if test="${not empty dataVo}">
								                ${dataVo.writerName}(${dataVo.writerTeam})
								            </c:if>
								        </div>
								        <div class="bbr">
								            <c:if test="${not empty dataVo}">
								                ${dataVo.hit}
								            </c:if>
								        </div>
								        <div>
								            <c:if test="${not empty dataVo}">
								                ${dataVo.enrollDate}
								            </c:if>
								        </div>
								    </div>
								</c:forEach>
								 <div id="data-page-area">
					            	<c:if test="${dataRoomListPv.currentPage > 1}">
						            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${dataRoomListPv.currentPage - 1}&searchType=${searchType}&searchValue=${searchValue}">이전</a>
					            	</c:if>
						            	<c:forEach begin="${dataRoomListPv.startPage}" end="${dataRoomListPv.endPage}" step="1" var="i">
	
						            		<c:if test="${dataRoomListPv.currentPage != i}">
								            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${i}&searchType=${searchType}&searchValue=${searchValue}">${i}</a>
						            		</c:if>
						            		<c:if test="${dataRoomListPv.currentPage == i}">
								            	<a >${i}</a>
						            		</c:if>
						            	</c:forEach>
						            <c:if test="${dataRoomListPv.currentPage < dataRoomListPv.maxPage +1}">
						            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${dataRoomListPv.currentPage + 1}&searchType=${searchType}&searchValue=${searchValue}">다음</a>
						            </c:if>
					            </div>
							</c:if>

						</div>
						
			        </div>
			    </div>
		    </div>
		   </div>
		
		</div>
</body>
<script type="text/javascript">
	function goDetail(drvoNo,drvoLevel,loginMemberLevel,writerNo,loginMemberNo) {
		
		if(drvoLevel<=loginMemberLevel){
			  if (typeof drvoNo !== 'undefined') {
				    window.location.href = '${root}/dataroom/detail?drvoNo=' + drvoNo;
				  }
		}else if(writerNo==loginMemberNo){
			if (typeof drvoNo !== 'undefined') {
			    window.location.href = '${root}/dataroom/detail?drvoNo=' + drvoNo;
			  }
		}else{
			alert("보안등급 이하입니다.");
		  event.preventDefault();
		}
	
	}
	

  </script>
 
</html>
