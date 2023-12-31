<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body{
        background-color: rgba(217, 217, 217, 1);
        margin: 0px;
    }
    #mainboard{
        border-radius: 10px;
        background-color: white;
    }

    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #time{
        position: relative;
        left: 80%;
        width: 300px;
    }
    .table-int{
        border: 3px solid rgba(59, 68, 75, 1);
       
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        border-radius: 10px;
    }
    .btn-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 3px;
        height: 15%;
        position: relative;
        bottom: 2px;
        font-size: 0.6em;
        align-items: center
    }
    .bbb{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
        font-size: 0.9em;
    }
    #table-area{
        width: 95%;
        height: 82%;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
        grid-template-columns: repeat(7,1fr);
        margin: auto;
        grid-gap: 10px;
    }
    .t-bold{
        font-weight: bold;
    }
    .book-list{
        height: 63%;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .ss{
        font-size: 0.6em;
    }
    .book-int{
        display: grid;
        grid-template-rows: 1fr 1fr;
        border-top: 2px solid  rgba(59, 68, 75, 1);
        height: 30%;
    }
    .sidegrid{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    .ok{
        color: blue;
    }
    .no{
        color: red;
    }
    #search{
        position: relative;
        left: 70%;
        width: 30%;
        padding: 5px
    }
    .model{
        position: fixed;
        background-color: white;
        z-index: 999;
        width: 280px;
        height: 300px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        display: none;
        border: 3px solid rgba(59, 68, 75, 1);
        border-radius: 10px;
        left: 25%;
        top: 30%;
    }
    .model-delete{
        position: relative;
        left: 45%;
    }
    .model-btn{
        height: 15%;
    }
    #overlay {
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        display: none;
    }
</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
           <div id="title">
                 식당 테이블
             </div>
             <div id="search-area">
                 <div id="search">
                     예약 날짜 : 
                     <input type="date" id="dateInput" >
                 </div>
             </div>
     
             <div id="table-area">
                 <c:forEach begin="1" end="21" var="i">
                     <div class="table-int" >
                         <div class="table-num t-bold">
                             ${i}
                         </div>
                         <div class="book-list">
                             <div class="book-int">
                                 <div class="ss"> 김찬진 (01012341234)</div>
                                 <div class="sidegrid ss">
                                     <div>17:00 4명   </div>
                                     <div class="sidegrid">
                                         <div class="ok">확인 </div>
                                         <div class="no">취소</div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="btn-area">
                             <div >
                                 최대인원 : 4명
                             </div>
                             <button class="bbb">이용/예약</button>
                         </div>
                     </div>
     
                    <div class="model">
                        <div class="model-delete">
                            X
                        </div>
                        <div class="logo">
                            로고이미지
                        </div>
                        <div class="table-num">
                            ${i}테이블 예약
                        </div>
                        <div class="int">
                            <div>
                                손님 이름 : <input type="text">
                            </div>
                            <div>
                                핸드폰 번호 : <input type="text">
                            </div>
                            <div>
                                예약 인원 : <input type="text">
                            </div>
                            <div>
                                예약 시간 : <input type="time">
                            </div>
                        </div>
                        <div class="model-btn">
                            <button>예약하기</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
    
            
            <div id="overlay"></div>
        
        </div>
     
     </div>

        
        
<script>

    // JavaScript 코드
    const dateInput = document.getElementById('dateInput');
    const today = new Date();
    // 오늘 날짜를 YYYY-MM-DD 형식으로 변환
    const formattedDate = today.toISOString().split('T')[0];
    // 기본값으로 설정
    dateInput.value = formattedDate;


    


    const openModals = document.querySelectorAll('.btn-area>button');
    const closeModals = document.querySelectorAll('.model-delete');
    const modals = document.querySelectorAll('.model');
    const overlay = document.querySelector("#overlay");

    openModals.forEach(function(openModal, index) {
        openModal.addEventListener('click', function() {
            modals[index].style.display = 'flex';
            overlay.style.display = "block";
        });
    });
            
    closeModals.forEach(function(closeModal, index) {
        closeModal.addEventListener('click', function() {
            modals[index].style.display = 'none';
            overlay.style.display = "none";
        });
    });

    // 날짜 가져와서 에약 구하기 
    function getBook(){

        const day = document.querySelector("#dateInput").value;


        console.log(1);

        $.ajax({
            type : "post" ,
            url : "${root}/restaurant/table/getBook" ,
            data : {
                day:day
            } ,
            dataType : "json" ,
            success : function(x){

                console.log(x);
                
                // 받아온 정보로 table 채우기
                // const tbody = document.querySelector("#foodList");
                // let str = "";
                // let total = 0 ;
            
                // for(let i = 0; i < x.length; i++){
                //     str +=		;
                // }
                                    
                // tbody.innerHTML = str;
            
            } ,
            error : function(x){
                alert("bad");
                console.log(x);
            } ,
        
        });

    }

    getBook();













</script>

        


</body>
</html>