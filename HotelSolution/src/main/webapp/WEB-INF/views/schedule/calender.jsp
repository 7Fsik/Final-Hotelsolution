<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<script>

   document.addEventListener('DOMContentLoaded', function() {
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
       initialView: 'dayGridMonth'
     });
     calendar.render();
   });
   
 </script>
</head>
<style>
	.modalWrap {
	  display: none;
	  position: fixed;
	  margin:200px;
	  z-index: 1;
	  left: 0;
	  top: 0;
	   width: 410px;
        height: 510px;
        grid-template-rows: 1fr 1fr 8fr;

        border: 5px solid #3B444B;
        border-radius: 30px;
        box-sizing: border-box;
        background-color:  white;
	}
	
	
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	  cursor: pointer;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
	 body{
        box-sizing: border-box;
        margin: 50px;
    }
    

    img{
        width: 360px;
        height: 40px;
    }

    .modalWrap > div{
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
    #calendar{
    	margin-top : 10vh;
    	margin-left : 10vw;
    	width:80cw;
    	height:80vh;
    }
    .modalbtn{
    	text-align: right;
    	margin-right: 12vw;
    }
</style>
<body>
	
	  	<div class="modalBtn">
			<button>등록하기</button>
			
		</div>
	  <div id='calendar'>
	  </div>
		
	<div class="modalWrap">
		

        <div class="logo">
            <img src="<%= request.getContextPath() %>/WEB-INF/common/logo/hsLogo.JPG" alt="로고입니다">
              <span class="close">&times;</span>
        </div>
        <div class="textArea">
            일정 등록
        </div>
        <form action="">
            <div class="formArea">
          
                <div class="scheduleDate">
                    2023.07.11 ~ 2023.08.11
                    
                </div>
                <div class="scheduleType">
                    <select name="scheduleTypeNo" class="scheduleTypeSelect">
                        <option disabled selected hidden value="" class="disabled">일정타입</option>
                        <option value="1">휴가</option>
                        <option value="2">팀일정</option>
                        <option value="3">업무일정</option>
                        <option value="4">사생활</option>
                    </select>
                </div>
                <div class="scheduleName">
                    일정 이름 : <br><input type="text" name="title" placeholder="일정 이름을 입력하세요" style="width: 370px; height: 20px;" >
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
</body>
<script type="text/javascript">
	let openModal = document.querySelector(".modalBtn");
	
	let modal = document.querySelector(".modalWrap");
	let closeModal = document.querySelector(".close");
	
	openModal.addEventListener("click", function() {
	  modal.style.display = "grid";
	});
	
	closeModal.addEventListener("click", function() {
	  modal.style.display = "none";
	});

</script>

</html>