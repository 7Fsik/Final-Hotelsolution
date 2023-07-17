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
        grid-template-rows: 1fr 1fr 7fr 1fr;
    }
    .surveyTitle{
        margin-top: 15px;
        padding-left : 15px;
        text-align: center;
        border: 0px;
        font-size: 40px;
       
        border-bottom: 1px solid #3B444B;
    }

    .questionInput{
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
		margin-bottom:20px;
        margin-left: 10px;
        margin-right: 20px;
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
    	text-align:left;
        padding-left: 35px;
       padding-top:10px;
        width: 100%;
        height: 100%;
        font-size: 20px;
        border-bottom: 1px solid #3B444B;
        cursor: pointer;
        
    }
   
  	.searchList{
    	margin-top: 20px;
    	margin-right : 20px;
        text-align: right;
    }
    .listWrap{
    	width:100%;
    	display: grid;
    	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr
    	
    	
    }
    .pageBtn{
    text-align: center;
    }
    .searchInput{
    	border-bottom: 1px solid #3b444b;
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
	  	border-collapse: separate;
   	 border-spacing: 0;
    	border: 1px solid #3b444b;
        padding: 22px;
        box-sizing: border-box;
        text-align: left;
        align-items: center;
        
    }
    .tableWrap{
    	border-collapse: separate;
    border-spacing: 0;
        display: grid;
        grid-template-columns: 6fr 6fr 6fr 6fr;
        box-sizing: border-box;
        font-size: 22px;
    }
    .surveyListBtn{
        margin-top: 30px;
        text-align: center;
    }
	  p.titleListTruncate {
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 370px; /* 원하는 글자 수에 따라 조정 */
	  text-align: left;
	}
	 p.titleTruncate {
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 300px; /* 원하는 글자 수에 따라 조정 */
	}
	p.surveyTitleTruncate{
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 900px; /* 원하는 글자 수에 따라 조정 */
	  text-align: left;
	}
	 p.questionTruncate{
	 white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 190px; /* 원하는 글자 수에 따라 조정 */
	  text-align: left;
	 }
	  
    .answerWrap{
    	border-collapse: separate;
    border-spacing: 0;
    	display: grid;
        grid-template-columns: 6fr 6fr 6fr 6fr;
        box-sizing: border-box;
       
    }
    .ansDivWrap{
   	 	border-collapse: separate;
    border-spacing: 0;
    	display: grid;
    	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
    	box-sizing: border-box;
    }
    .answerWrap > div{
    	box-sizing: border-box;
        border: 1px solid #3B444B;
        box-sizing: border-box;
    }
	.ansDiv{
		border-collapse: separate;
   		 border-spacing: 0;
    	border-bottom: 1px solid #3b444b;
        padding: 22px;
        box-sizing: border-box;
        text-align: left;
        align-items: center;
        }
    	#ans-page-area{
   		 margin :auto;
   	 	width: 400px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
        }
        #page-area{
   		 margin :auto;
   	 	width: 200px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
    }
     a{
   	width: 50px;
   }
    .titleList:hover {
        background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
    }
      .ansDiv:hover {
        background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
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
                           <p class="surveyTitleTruncate">${sdvo.title} (${sdvo.enrollDate})</p> 
                          
                           
                    </div>
	                
	                <div class="tableWrap">

                        
                       
                        <c:forEach items="${list}" var="list" varStatus="status">
								<div class="tableDiv">
		                        	 <p class="questionTruncate">${status.index + 1}. ${list.question}</p>
		                        </div>
						</c:forEach>
                       
                      
                    </div>
                    <div class="answerWrap" >

                        <div class="ans1 ansDivWrap">
                        	  <c:forEach items="${answerLists.get(0)}" var="list">
								<div class="ansDiv" onclick="goDetail('${sdvo.no}', '${sdvo.title}', '${sdvo.enrollDate}', '${pv.currentPage}' , '${list.answerer}')">
		                        	 <p class="questionTruncate"> ${list.answer}</p>
		                        </div>
							</c:forEach>
                        </div>
                        <div class="ans2 ansDivWrap">
                        	<c:forEach items="${answerLists.get(1)}" var="list">
								<div class="ansDiv" onclick="goDetail('${sdvo.no}', '${sdvo.title}', '${sdvo.enrollDate}', '${pv.currentPage}' , '${list.answerer}')">
		                        	 <p class="questionTruncate"> ${list.answer}</p>
		                        </div>
							</c:forEach>
                        </div>
                        <div class="ans3 ansDivWrap">
                        	<c:forEach items="${answerLists.get(2)}" var="list">
								<div class="ansDiv" onclick="goDetail('${sdvo.no}', '${sdvo.title}', '${sdvo.enrollDate}', '${pv.currentPage}' , '${list.answerer}')">
		                        	 <p class="questionTruncate"> ${list.answer}</p>
		                        </div>
							</c:forEach>
                        </div>
                        <div class="ans4 ansDivWrap">
                        	<c:forEach items="${answerLists.get(3)}" var="list">
								<div class="ansDiv" onclick="goDetail('${sdvo.no}', '${sdvo.title}', '${sdvo.enrollDate}', '${pv.currentPage}' , '${list.answerer}')">
		                        	 <p class="questionTruncate"> ${list.answer}</p>
		                        </div>
							</c:forEach>
                        </div>
                      
                       
                      
                    </div>

                    <div id="ans-page-area">
		            	<c:if test="${answerListPv.currentPage > 1}">
			            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&answerListpage=${answerListPv.currentPage - 1}&titleListpage=${pv.currentPage}">이전</a>
		            	</c:if>
			            	<c:forEach begin="${answerListPv.startPage}" end="${answerListPv.endPage}" step="1" var="i">
			            		<c:if test="${answerListPv.currentPage != i}">
					            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&answerListpage=${i}&titleListpage=${pv.currentPage}">${i}</a>
			            		</c:if>
			            		<c:if test="${answerListPv.currentPage == i}">
					            	<a >${i}</a>
			            		</c:if>
			            	</c:forEach>
			            <c:if test="${answerListPv.currentPage < answerListPv.maxPage}">
			            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&answerListpage=${answerListPv.currentPage + 1}&titleListpage=${pv.currentPage}">다음</a>
			            </c:if>
			             <button value="상세조회" onclick="goDetailList('${sdvo.no}', '${sdvo.title}', '${sdvo.enrollDate}', '${pv.currentPage}')">상세조회</button>
		            </div>
			                    
	               
	            </div>
	        </div>
			            <div class="titleListWrap">
			            <div class="listHead">
			                이전 설문 목록
			            </div>
			                <div class="listWrap">
							    <c:forEach items="${titleList}" var="title">
							        <div class="titleList" onclick="goAnswerList('${title.no}', '${title.title}', '${title.enrollDate}', '${pv.currentPage}')">
							            <p class="titleTruncate">${title.title}</p>
							            <br>
							            <p style="text-align: right; font-size: 15px; margin-right: 5px;">(${title.enrollDate})</p>
							        </div>
							    </c:forEach>
							</div>
			             
			                 <div class="searchList">
								
			                    설문 제목 : <input type="text" class="searchInput">
			                    <button type="submit" > 검색 </button>
			                 </div>
			                 
		                   
		                   <div id="page-area">
				            	<c:if test="${pv.currentPage > 1}">
					            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&titleListpage=${pv.currentPage - 1}&answerListpage=${answerListPv.currentPage}">이전</a>
				            	</c:if>
					            	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
					            		<c:if test="${pv.currentPage != i}">
							            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&titleListpage=${i}&answerListpage=${answerListPv.currentPage}">${i}</a>
					            		</c:if>
					            		<c:if test="${pv.currentPage == i}">
							            	<a >${i}</a>
					            		</c:if>
					            	</c:forEach>
					            <c:if test="${pv.currentPage < pv.maxPage}">
					            	<a  href="${root}/hr/survey/answerList?no=${sdvo.no}&title=${sdvo.title}&enrollDate=${sdvo.enrollDate}&titleListpage=${pv.currentPage + 1}&answerListpage=${answerListPv.currentPage}">다음</a>
					            </c:if>
				            </div>
			               
			                                  
			            
			        </div>
			    </div>
		    </div>
		</div>
	
</body>
<script>
function goAnswerList(no, title, enrollDate, titleListpage) {
    window.location.href = '${root}/hr/survey/answerList?no=' + no + '&title=' + title + '&enrollDate=' + enrollDate + '&titleListpage=' + titleListpage;
}
function goDetail(no, title, enrollDate, titleListpage, answerer) {
	 window.location.href = '${root}/hr/survey/detail?no=' + no + '&title=' + title + '&enrollDate=' + enrollDate + '&titleListpage=' + titleListpage + '&answerer=' + answerer ;
	
}
function goDetailList(no, title, enrollDate, titleListpage) {
	 window.location.href = '${root}/hr/survey/detailList?no=' + no + '&title=' + title + '&enrollDate=' + enrollDate + '&titleListpage=' + titleListpage;
	
}

/*
function goSurveyResultDetailByOne(questionNo, answerer) {
	 window.location.href = '${root}/hr/survey/detail?questionNo=' + questionNo + '&answerer=' + answerer;
	
}*/
</script>
</html>