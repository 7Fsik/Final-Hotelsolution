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
		margin-top: 10px;
		margin-left :470px;
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
	}
	.listHrSurveyWrap{
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width: 950px;
		height : 800px;
        border: 1px solid #3B444B;
        border-radius: 20px;
	}
    .listHrSurvey{
        width: 100%;
		height : 100%;
        display: grid;
        grid-template-rows: 1fr 8fr 1fr;
    }
    .surveyTitle{
        margin-top: 10px;
        
        text-align: center;
        border: 0px;
        font-size: 40px;
       
        border-bottom: 1px solid #3B444B;
    }
    .surveyTitleInput{
        place-items: center; 
        font-size: 40px;
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
    }
    .searchList{
        text-align: right;
    }
    .listWrap{
    	display: grid;
    	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
    }
    .pageBtn{
    text-align: center;
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
        grid-template-columns: 1fr 6fr 6fr 6fr 6fr;
        box-sizing: border-box;
    }
    .surveyListBtn{
        margin-top: 30px;
        text-align: center;
    }
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/aside.jsp" %>
<body>
	<div class="hrBody">
		
	    <div class="hrWrap">
	        <div class="listHrSurveyWrap">
                <div class="listHrSurvey">
                    <div class="surveyTitle">
                            설문제목 (설문생성날짜)
                    </div>
	                
	                <div class="tableWrap">

                        
                        <div class="tableDiv">
                           
                        </div>
                        <div class="tableDiv">
                            질문 1
                        </div>
                        <div class="tableDiv">
                            질문 2
                        </div>
                        <div class="tableDiv">
                            질문 3
                        </div>
                        <div class="tableDiv">
                            질문 4
                        </div>
                        <div class="tableDiv">
                            2
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            3
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            4
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            5
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            6
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            7
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            8
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            9
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>
                        <div class="tableDiv">
                            10
                        </div>
                        <div class="tableDiv">
                            1번 질문의 답
                        </div>
                        <div class="tableDiv">
                            2번 질문의답
                        </div>
                        <div class="tableDiv">
                            3번 질문의답
                        </div>
                        <div class="tableDiv">
                            4번 질문의답
                        </div>

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
		                <c:forEach items="${voList}" var="voList" >
						     <div class="titleList">
			                    ${voList.title}
			                    <br><br>
			                    ${voList.enrollDate}
			                </div>
						</c:forEach>
	               </div>
	             
	                 <div class="searchList">
	                    검색할 내용 : <input type="text">
	                    <button type="submit" > 검색 </button>
	                 </div>
	                 <div class="pageBtn">
	                    페이징처리
	                 </div>                 
	            
	        </div>
	    </div>
    </div>
</body>
</html>