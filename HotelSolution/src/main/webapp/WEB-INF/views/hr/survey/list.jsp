<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hrWrap{
		display: grid;
        
		grid-template-columns: 7fr 4fr;
        place-items: center; 
      
		width: 70vw;
		height : 80vh;
		margin-top: 15vh;
		margin-left:25vw;
        margin-right: 10px;
        border: 1px solid #3B444B;
        border-radius: 20px;
	}
	.listHrSurveyWrap{
        margin-left: 20px;
		width: 100%;
		height : 95%;
        border: 1px solid #3B444B;
        border-radius: 20px;
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
        place-items: center; 
        font-size: 40px;
    }
    .qustion{
        margin-left: 10%;
        font-size: 20px;
    }
    .qustionInput{
        width: 90%;
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
        width: 90%;
        height: 80%;
        border: 0px solid #3B444B;
        border-radius: 20px;
        resize: none;
        
    }

    .titleListWrap{
        margin-left: 20px;
		width: 90%;
		height : 95%;
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
    	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr
    }
    .pageBtn{
    text-align: center;
    }
</style>
</head>
<body>
    <div class="hrWrap">
        <div class="listHrSurveyWrap">
                <div class="surveyTitle">
                    <input type="text" value=" class="surveyTitleInput">
                </div>
               
                
                <div class="qustion">
                    1. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="qustionInput">
                    <textarea readonly></textarea>
                </div>
                <div class="qustion">
                    2. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="qustionInput">
                    <textarea readonly></textarea>
                </div>
                <div class="qustion">
                    3. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="qustionInput">
                    <textarea readonly></textarea>
                </div>
                <div class="qustion">
                    4. <input type="text" placeholder="설문 질문을 입력하세요" name="question" class="qustionInput">
                    <textarea readonly></textarea>
                </div>
                <div class="btn">
                    <button type="submit" class="button">설문지 배포</button>
                </div>
        </div>
        
        <div class="titleListWrap">
            <div class="listHead">
                이전 설문 목록
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
    
</body>
</html>