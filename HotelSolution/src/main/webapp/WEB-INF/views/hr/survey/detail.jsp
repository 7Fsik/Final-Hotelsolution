<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hrBody{
		width : 1400px;
		height : 820px;
		margin-top: 50px;
		margin-left :20px;
		margin-right: 40px;
		overflow: scroll;
		
		
	}
	.hrWrap{
	
		display: grid;
        
		grid-template-columns: 7fr 4fr;
      	text-align:right;
		width:100%;
		height : 100%;
        border: 1px solid #3B444B;
        border-radius: 20px;
        background-color: white;
	}
	.detailHrSurveyWrap{
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width: 950px;
		height : 800px;
        border: 1px solid #3B444B;
        border-radius: 20px;
        gap:20px;
	}
    .detailHrSurvey{
        width: 100%;
		height : 100%;
        display: grid;
        grid-template-rows: 1fr 8fr 1fr;
    }
    .surveyTitle{
        margin-top: 10px;
        padding-left : 20px;
        text-align: center;
        border: 0px;
        font-size: 40px;
       
        border-bottom: 1px solid #3B444B;
    }
    .surveyTitleInput{
        place-items: center; 
        font-size: 40px;
    }
    .qustion{
    	text-align:left;
        margin-left: 10%;
        font-size: 20px;
    }
    .qustionInput{
    	margin-top: 2%;
        width: 70%;
        height: 30px;
        font-size: 20px;
        font-weight: bold;
    }
    input{
        border: 0px;
    }
    .btn{
        margin:30px;
        text-align: center;
    }
    .button{
        width: 100px;
        height: 100%;
        border: #3B444B;
        background-color: #3B444B;
        color: white;
        border-radius: 20px;
    }
    textarea{
        width: 80%;
        height: 60%;
        border: 0px solid #3B444B;
        border-radius: 20px;
        resize: none;
        
    }

    .titleListWrap{
      	margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width: 370px;
		height : 800px;
        border: 1px solid #3B444B;
        border-radius: 20px;
      
        display: grid;
        grid-template-rows: 1fr 7fr 1fr 1fr;
    }
    .listHead{
        margin-top: 10px;
        padding-top : 10px;
        
        text-align: center;
        border: 0px;
        font-size: 40px;
       
        border-bottom: 1px solid #3B444B;
    }
    .titleList{
        padding-left: 10%;
        width: 90%;
        height: 90%;
        margin-top: 10px;
        font-size: 20px;
        border-bottom: 1px solid #3B444B;
         cursor: pointer;
    }
    .searchList{
        text-align: right;
    }
    .listWrap{
    	display: grid;
    	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr
    	
    }
    .pageBtn{
    text-align: center;
    }
    .searchInput{
    	border-bottom: 1px solid black;
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
	
	  .tableDiv{
    	border: 1px solid black;
        padding: 22px;
        box-sizing: border-box;
        text-align: left;
        align-items: center;
        
    }
    .tableWrap{
        display: grid;
        grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
        grid-template-columns: 6fr 6fr 6fr 6fr;
        box-sizing: border-box;
    }
    .surveyListBtn{
        margin-top: 30px;
        text-align: center;
    }
	  p.titleListTruncate {
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 300px; /* 원하는 글자 수에 따라 조정 */
	}
	 p.titleTruncate{
	 white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 850px; /* 원하는 글자 수에 따라 조정 */
	  text-align: center;
	 }
	 p.questionTruncate{
	 white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 150px; /* 원하는 글자 수에 따라 조정 */
	  text-align: center;
	 }

</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/aside.jsp" %>
		
<body>
		<div class="main-container">
			<aside class="main-aside">
				<div class="profile-box"></div>
				<div class="main-aside-empty"></div>
				<div class="team-menu-bar"></div>
			</aside>
			<div class="hrBody">
		
	    <div class="hrWrap">
	        <div class="detailHrSurveyWrap">
                <div class="detailHrSurvey">
                    <div class="surveyTitle">
                           <p class="titleTruncate">${title} (${enrollDate})</p> 
                    </div>
	                
	                <div class="tableWrap">

                        
                       
                        <c:forEach items="${list}" var="list" >
								<div class="tableDiv">
		                        	 <p class="questionTruncate">${list.question})</p>
		                        </div>
						</c:forEach>
                       
                      
                    </div>

                    <div class="surveyListBtn">
                        <button type="button">페이징처리</button>
                    </div>
	               
	            </div>
	        </div>
			            <div class="titleListWrap">
			            <div class="listHead">
			                <div>이전 설문 목록</div>
			            </div>
			                <div class= listWrap>
				                <c:forEach items="${titleList}" var="title" >
								     <div class="titleList" onclick="goDetail('${title.no}', '${title.title}', '${title.enrollDate}', '${currentPage}')">
							            <p class="titleTruncate">${title.title}</p>
							            <br><br>
							            <p style="text-align: right; font-size: 15px;">(${title.enrollDate})</p>
							        </div>
								</c:forEach>
			               </div>
			             
			                 <div class="searchList">
								
			                    설문 제목 : <input type="text" class="searchInput">
			                    <button type="submit" > 검색 </button>
			                 </div>
			                 
		                   
		                   <div id="page-area">
				            	<c:if test="${pv.currentPage > 1}">
					            	<a  href="${root}/hr/survey/write?titleListpage=${pv.currentPage - 1}">이전</a>
				            	</c:if>
					            	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
					            		<c:if test="${pv.currentPage != i}">
							            	<a  href="${root}/hr/survey/write?titleListpage=${i}">${i}</a>
					            		</c:if>
					            		<c:if test="${pv.currentPage == i}">
							            	<a >${i}</a>
					            		</c:if>
					            	</c:forEach>
					            <c:if test="${pv.currentPage < pv.maxPage}">
					            	<a  href="${root}/hr/survey/write?titleListpage=${pv.currentPage + 1}">다음</a>
					            </c:if>
				            </div>
			                    
			                                  
			            
			        </div>
			    </div>
		    </div>
		</div>
	
</body>
<script>
function goDetail(no, title, enrollDate, titleListpage) {
    window.location.href = '${root}/hr/survey/detail?no=' + no + '&title=' + title + '&enrollDate=' + enrollDate + '&titleListpage=' + titleListpage;
}

    
</script>
</html>