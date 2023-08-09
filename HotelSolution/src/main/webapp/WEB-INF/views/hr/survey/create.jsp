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
		width : 100%;
		height : 100%;
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
	.writeHrSurveyWrap{
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width: 900px;
		height : 800px;
        border: 1px solid #3B444B;
        border-radius: 20px;
        gap:20px;
	}
    .writeHrSurveyForm{
        width: 100%;
		height : 100%;
        display: grid;
        grid-template-rows: 2fr 4fr 4fr 4fr 4fr 2fr;
    }
    .surveyTitle{
        margin-top: 10px;
        
        text-align: center;
        border: 0px;
        font-size: 40px;
       
        border-bottom: 1px solid #3B444B;
    }
    .surveyTitleInput{
    	width: 80%;
        place-items: center; 
        font-size: 40px;
    }
    .question{
    	text-align:left;
        margin-left: 10%;
        font-size: 20px;
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
        outline: none;
        
    }

    .titleListWrap{
      	margin-top:1vh;
		margin-bottom:20px;
        margin-left: 10px;
        margin-right: 20px;
		width: 350px;
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
    .titleList:hover {
        background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
    }
    p.titleTruncate {
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  max-width: 300px; /* 원하는 글자 수에 따라 조정 */
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
  
     #page-area{
   		 margin :auto;
   	 	width: 200px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
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
	 a{
   	width: 50px;
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
</style>
</head>
<body>
	<div id ="wrap">

   <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">
		
		      <div class="hrBody">
		
			    <div class="hrWrap">
			        <div class="writeHrSurveyWrap">
			            <form action="${root}/hr/survey/create" method="POST" class="writeHrSurveyForm">
			                <div class="surveyTitle">
			                    <input type="text" placeholder="설문 제목을 입력하세요" name="title" class="surveyTitleInput" maxlength="30">
			                </div>
			               
			                
			                <div class="question">
			                    1. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="questionInput" maxlength="50">
			                    <textarea style="resize: none;"readonly></textarea>
			                </div>
			                <div class="question">
			                    2. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="questionInput" maxlength="50">
			                      <textarea style="resize: none;"readonly></textarea>
			                </div>
			                <div class="question">
			                    3. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="questionInput" maxlength="50">
			                      <textarea style="resize: none;"readonly></textarea>
			                </div>
			                <div class="question">
			                    4. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="questionInput" maxlength="50">
			                      <textarea style="resize: none;"readonly></textarea>
			                </div>
			                <div class="btn">
			                    <button type="submit" class="button" onclick="submitForm()">설문지 배포</button>
			                </div>
			            </form>
			        </div>
			        
			        <div class="titleListWrap">
			            <div class="listHead">
			                <div>이전 설문 목록</div>
			            </div>
			                <div class="listWrap">
							    <c:forEach items="${titleList}" var="title">
							        <div class="titleList" onclick="goAnswerList('${title.no}', '${title.title}', '${title.enrollDate}')">
							            <p class="titleTruncate">${title.title}</p>
							            <br>
							            <p style="text-align: right; font-size: 15px; margin-right: 5px;">(${title.enrollDate})</p>
							        </div>
							    </c:forEach>
							
			                
			             </div>
			              <form action="${root}/hr/survey/create" method="get" class="searchList">
								
			                   <input class = "searchValueElem " id="searchValue" type = "text" name = "searchValue" value = "${searchVo.searchValue}" placeholder="검색할 내용">
							                    
			                     <input type="image" id="img1" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Submit" />
			                 </form>
			                 
		                   
		                   <div id="page-area">
				            	<c:if test="${pv.currentPage > 1}">
					            	<a  href="${root}/hr/survey/create?searchValue=${searchValue}&titleListpage=${pv.currentPage - 1}"><</a>
				            	</c:if>
					            	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
					            		<c:if test="${pv.currentPage != i}">
							            	<a  href="${root}/hr/survey/create?searchValue=${searchValue}&titleListpage=${i}">${i}</a>
					            		</c:if>
					            		<c:if test="${pv.currentPage == i}">
							            	<a >${i}</a>
					            		</c:if>
					            	</c:forEach>
					            <c:if test="${pv.currentPage < pv.endPage}">
					            	<a  href="${root}/hr/survey/create?searchValue=${searchValue}&titleListpage=${pv.currentPage + 1}">></a>
					            </c:if>
				            </div>        		             
			            
			        </div>
			    </div>
		    </div>
		   
		   </div>
		
		</div>
			
 	
</body>
<script>
	function goAnswerList(no, title, enrollDate, titleListpage) {
	    window.location.href = '${root}/hr/survey/answerList?no=' + no + '&title=' + title + '&enrollDate=' + enrollDate+'&titleListpage=1';
	}
    
   
	function validateForm() {
	    let surveyTitleInput = document.querySelector('.surveyTitleInput');
	    if (surveyTitleInput.value.trim() === '') {
	        alert("제목은 입력하셔야 됩니다.");
	        return false;
	    }
	    return true;
	}

// 등록하기 버튼 클릭 시 폼 유효성 검사 수행
	function submitForm() {
	 if (!validateForm()) {
	    event.preventDefault();
	    
	  }
	}

</script>

</html>