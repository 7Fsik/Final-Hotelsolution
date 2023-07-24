<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body{
        box-sizing: border-box;
        margin: 50px;
    }
    .wrap{
        
        width: 410px;
        height: 510px;
        display: grid;
        grid-template-rows: 1fr 1fr 8fr;

        border: 5px solid #3B444B;
        border-radius: 30px;
        box-sizing: border-box;
    }

    .logo img{
        width: 360px;
        height: 40px;
    }

    .wrap > div{
        margin: 5px;
    }
    
    .logo{
        
        text-align: center;
    }

    .textArea{
        text-align: center;
        font-weight: bold;
        font-size: 30px;
    }

    .formArea{
        height: 390px;
        display: grid;
        grid-template-columns: 3fr 1fr;
        grid-template-rows: 1fr 1fr 3fr 1fr;
    }
    form  div{
        margin: 5px;
    }

    .scheduleDate{
        text-align: center;
        font-size: 20px;

    }
   
    .scheduleType{
        text-align: center;
        
    }
    
    .scheduleName{
        
        grid-column: span 2;
    }

    .scheduleTypeSelect{
        margin: auto;
        height: 30px;
        background-color: #3B444B ;
        color: white;
        font-weight: bold;
    }
    
    .scheduleContentArea{
        grid-column: span 2;
        width: 380px;
    }
    .shcheduleContent{
        margin: auto
        
    }
    .scheduleSubmitBtn{
        grid-column: span 2;
        text-align: center;
    }
    .sbtn{
        text-align: center;
        width: 100px;
        height: 50px;

        background-color: #3B444B;
        color: white;
        border: 0px;
    }

    
</style>
<body>
	<div id ="wrap">

   <%@ include file="/WEB-INF/views/common/main.jsp" %>

   <div id="mainboard">

    <div class="wrap">

        <div class="logo">
            <img src="<%= request.getContextPath() %>/WEB-INF/common/logo/hsLogo.JPG" alt="로고입니다">
        </div>
        <div class="textArea">
            일정 등록
        </div>
        <form action="${root}/schedule/create" method="post">
            <div class="formArea">
          
                <div class="scheduleDate">
                   <input name="startDate" value="${startDate}" hidden> ${startDate} ~ ${endDate}
                   <input name="endDate" value="${endDate}" hidden>
                    
                </div>
                <div class="scheduleType">
                    <select name="scheduleTypeNo" class="scheduleTypeSelect">
                        <option disabled selected  value="" class="disabled">일정타입</option>
                        <option value="1">휴가</option>
                        <option value="2">팀일정</option>
                        <option value="3">업무일정</option>
                        <option value="4">사생활</option>
                    </select>
                </div>
                <div class="scheduleName">
                    일정 이름 : <br><input type="text" name="title" placeholder="일정 이름을 입력하세요" value="${title}"  style="width: 370px; height: 20px;" >
                </div>
                <div class="scheduleContentArea">
                    일정 내용 : <br> <textarea name="content" class="shcheduleContent" placeholder="일정 내용을 입력하세요" style="width: 370px; height: 150px; resize: none; overflow: auto;" ></textarea>
                </div>
                <div class="scheduleSubmitBtn">
                    <button type="submit" class="sbtn">등록하기</button>
                </div>
           
            </div>
        </form>
        

    </div>
   </div>
</div>
    
</body>
</html>
