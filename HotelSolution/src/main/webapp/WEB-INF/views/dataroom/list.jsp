<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
 <style type="text/css">
	.dataroomBody{
		width : 1300px;
		height : 820px;
		margin-top: 50px;
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
      	grid-template-columns : 12fr 1fr 1fr 1fr 1fr;  
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
			        				
			        				<div></div>
			        				<div class="ttc">
									    <a href="${root}/dataroom/list?categoryNo=${loginMember.teamNo}&dataRoomListPage=1">부서</a>
									</div>
					        		<div class="ttc"><a href="${root}/dataroom/list?categoryNo=100&dataRoomListPage=1">개인</a></div>
					        		<div class="ttc"><a href="${root}/dataroom/list?categoryNo=0&dataRoomListPage=1">공용</a></div>
					        		<div class="ttc"><a href="${root}/dataroom/write">글작성</a></div>
			        		</div>
			        		
				        	<div class="dataListTop">
								<div class="bbrt">카테고리</div>
								<div class="bbrt">제목</div>
								<div class="bbrt">첨부파일</div>
								<div class="bbrt">작성자</div>
								<div class="bbrt">조회수</div>
								<div>작성일</div>
							</div>
							<c:if test="${not empty dataVoList}">
								<c:forEach begin="1" end="10" varStatus="status">
								    <c:set var="dataVo" value="${status.index <= dataVoList.size() ? dataVoList[status.index - 1] : null}" />
								    <div class="dataList" onclick="goDetail(${dataVo.dataNo})">
								        <div class="bbr">
								            <c:if test="${not empty dataVo}">
								                ${dataVo.categoryName}
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
								<c:set var="endPage" value="${dataVoList.size() + 1}" />
								<c:set var="endPage" value="${endPage / 10 + 1}" />
								 <div id="data-page-area">
					            	<c:if test="${dataRoomListPv.currentPage > 1}">
						            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${dataRoomListPv.currentPage - 1}">이전</a>
					            	</c:if>
						            	<c:forEach begin="${dataRoomListPv.startPage}" end="${endPage}" step="1" var="i">
	
						            		<c:if test="${dataRoomListPv.currentPage != i}">
								            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${i}">${i}</a>
						            		</c:if>
						            		<c:if test="${dataRoomListPv.currentPage == i}">
								            	<a >${i}</a>
						            		</c:if>
						            	</c:forEach>
						            <c:if test="${dataRoomListPv.currentPage < dataRoomListPv.maxPage}">
						            	<a  href="${root}/dataroom/list?categoryNo=${categoryNo}&dataRoomListPage=${dataRoomListPv.currentPage + 1}">다음</a>
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
	function goDetail(drvoNo) {
	  if (typeof drvoNo !== 'undefined') {
	    window.location.href = '${root}/dataroom/detail?drvoNo=' + drvoNo;
	  }
	}

</script>
 
</html>
