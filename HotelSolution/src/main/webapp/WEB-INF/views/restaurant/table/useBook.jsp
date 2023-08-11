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
    #table-area{
        width: 95%;
        height: 82%;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
        grid-template-columns: repeat(7,1fr);
        margin: auto;
        grid-gap: 10px;
    }
    .table-int{
        border: 3px solid rgba(59, 68, 75, 1);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        border-radius: 10px;
        position: relative;
    }
    .btn-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 3px;
        height: 15%;
        position: relative;
        bottom: 2px;
        font-size: 0.8em;
        align-items: center
    }
    .bbb{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
        font-size: 0.9em;
        height: 80%;
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
        overflow-y: auto;
    }
    .ss{
        font-size: 0.8em;
    }
    .book-int{
        display: grid;
        grid-template-rows: 1fr 1fr;
        border-top: 2px solid  rgba(59, 68, 75, 1);
        height: 30%;
        z-index: 1;
        width: 90%;
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
        width: 20%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        display: none;
        border: 3px solid rgba(59, 68, 75, 1);
        border-radius: 10px;
        left: 50%;
        top: 30%;
        height: 50%;
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
    .iii{
        width: 100%;
        height: 60%;
        position: absolute;
        top: 15%;
        opacity : 0.4;
    }
    .int input {
        border: 0;
        border-bottom: 2px solid black;
        padding: 3px;
    }
    .int{
        display: flex;
        flex-direction: column;
        
    }
    .useBtn{
        border: 0;
        color: white;
        height: 50%;
        background-color:  rgba(59, 68, 75, 1);
        border-radius: 5px;
    }
    .wrn{
        text-align: center;
        color: red;
        font-size: 0.7em;
    }
    #sasa{
        border: 0;
        color: white;
        height: 100%;
        border-radius: 5px;
        background-color:  rgba(59, 68, 75, 1);

    }
    .point {
        cursor: pointer;
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
                    <input type="date"  id="dateInput">
                    <button onclick="getBook()" id="sasa">검색</button>
                </div>
            </div>
     
            <div id="table-area">
                <c:forEach items="${vo}" var="vo" >
                    <div class="table-int" >

                        <div class="table-num t-bold">
                            ${vo.tableNo}
                    </div>
                    <img class="iii" src="${root}/resources/img/restaurant/table.avif" alt="">
                        <div class="book-list" id = restaurant${vo.tableNo}>
                            
                        </div>
                        <div class="btn-area">
                            <div >
                                최대인원 :${vo.userNum}명
                            </div>
                            <button class="bbb">이용/예약</button>
                        </div>
                    </div>
     
                    <div class="model">
                        <div class="model-delete">
                            X
                        </div>
                        <div class="logo">
                            <img class="logoImg" src="${root}/resources/img/호텔솔루션.png" style="width:98%">
                        </div>
                        <div class="table-num">
                            ${vo.tableNo}번 테이블 이용 / 예약
                            <div class="wrn">전부 입력하시오</div>
                        </div>
                        <div class="int">
                            <div>
                                손님 이름 : <input type="text" name="bookName" class="bookName" placeholder="이름을 입력하시오">
                            </div>
                            <div>
                                핸드폰 번호 : <input type="text" name="bookPhone"  class="bookPhone" maxlength="11" placeholder="숫자만 입력하시오">
                            </div>
                            <div>
                                예약 인원 : <input type="text" name="bookpp" class="bookpp" placeholder="숫자만 입력하시오">
                            </div>
                            <div class="chch">
                                <select name="checked" class="selectOption">
                                    <option value="1">예약</option>
                                    <option value="2">이용</option>
                                </select>
                                <div class="titi">
                                    예약 시간 : <input type="time" name="bookDay" class="bookTime" >
                                </div>
                            </div>
                        </div>
                        <div class="model-btn">
                            <button class="useBtn" data-tableno = "${vo.tableNo}" >예약하기</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
    
            
            <div id="overlay"></div>
        
        </div>
     
     </div>

        
        
<script>
    const dateInput = document.getElementById('dateInput');
    const today = new Date();

    // 오늘 날짜를 YYYY-MM-DD 형식으로 변환
    const formattedDate = today.toISOString().split('T')[0];
    dateInput.value = formattedDate;


    ///select옵션
    const selectOptions = document.querySelectorAll(".selectOption");
    const bookTimeInputs = document.querySelectorAll(".titi");

    // 모든 select 요소에 대해 이벤트 리스너 등록
    selectOptions.forEach((selectOption, index) => {
        selectOption.onchange = function() {
            const selectedValue = selectOption.value;
            if (selectedValue === "1") {
                bookTimeInputs[index].style.display = "block";
            } else {
                bookTimeInputs[index].style.display = "none";
            }
        };
    });

    


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

        const bookListElements = document.querySelectorAll(".book-list");
        const day = document.querySelector("#dateInput").value;

        //우선 리스트 지우기
        bookListElements.forEach((element) => {
        const childDivs = element.querySelectorAll("div");
        childDivs.forEach((div) => {
            div.remove();
        });
        });


        $.ajax({
            type: "post",
            url: "${root}/restaurant/table/getBook",
            data: {
                day: day
            },
            dataType: "json",
            success: function (dataList) {
                function putInt(data) {

                    const tableNo = data.tableNo;
                    const no = parseInt(tableNo);
                    const targetDiv = document.querySelector("#restaurant" + no);

                    if (targetDiv) {
                        let div = document.createElement("div");
                        div.className = "book-int";
                        let innerHTML = "<div class='ss'>" + data.name + "(" + data.phoneNumber + ")</div>"
                            + "<div class='sidegrid ss'>"
                            + "<div>"+data.useTime+" "+data.bookPeople+"명</div>"
                            + "<div class='sidegrid'>"
                            + "<div class='ok point'  data-no = '"+data.no+"' data-name = '"+data.name+"'>확인 </div>"
                            + "<div class='no point' data-no = '"+data.no+"'  data-name = '"+data.name+"'>취소</div>"
                            + "</div>"
                            + "</div>";
                        div.innerHTML = innerHTML;

                        targetDiv.appendChild(div);
                    }
                }

                dataList.forEach((vo) => {
                    putInt(vo);
                });

                ok();
                cancel();
                bookUse();

            },
            error: function (x) {
                alert("bad");
                console.log(x);
            },

        });
    }


    function ok() {

        const oks =  document.querySelectorAll(".ok");

        oks.forEach(function(ok, index) {
            ok.addEventListener('click', function() {

                const no = ok.dataset.no;
                const name = ok.dataset.name;

                const result = confirm(name +"님이 오셨습니까?");
                if (result === true) {
                    $.ajax({
                    type : "POST",
                    url :"${root}/restaurant/table/checkOk" ,
                    data :{
                        no:no
                    } ,
                    success :function(x){ 

                        location.reload();

                    } ,
                    error : function(x){
                        alert("bad");
                    }

                });
                } else {
                    console.log("취소 ");
                }
            });
        });
    }
    function cancel() {

        const nos =  document.querySelectorAll(".no");

        nos.forEach(function(no, index) {
            no.addEventListener('click', function() {

                const num = no.dataset.no;
                const name = no.dataset.name;

                const result = confirm( "정말로 "+name+"님 예약 취소 하시겠습니까");
                if (result === true) {
                    $.ajax({
                    type : "POST",
                    url :"${root}/restaurant/table/cancel" ,
                    data :{
                        num:num
                    } ,
                    success :function(x){ 

                        location.reload();

                    } ,
                    error : function(x){
                        alert("bad");
                    }

                });
                } else {
                    console.log("취소 ");
                }
            });
        });
    }

    
    

    //예약하기 버튼 활성화
    function bookUse() {

        const useBtns =  document.querySelectorAll(".useBtn");
        const checkdes = document.querySelectorAll(".selectOption");
        const bookNames = document.querySelectorAll(".bookName");
        const bookPhones = document.querySelectorAll(".bookPhone");
        const bookpps = document.querySelectorAll(".bookpp");
        const bookTimes = document.querySelectorAll(".bookTime");
        const date = document.querySelector("#dateInput").value;


        useBtns.forEach(function(useBtn, index) {
            useBtn.addEventListener('click', function() {
                const check = checkdes[index].value;
                const bookName = bookNames[index].value;
                const bookPhone = bookPhones[index].value;
                const bookpp = bookpps[index].value;
                const bookTime = bookTimes[index].value;
                const tableNo = useBtn.dataset.tableno;

                console.log(check);
               
                //이용
                if (check==2) {
                    $.ajax({
                        type : "POST",
                        url :"${root}/restaurant/table/useBook" ,
                        data :{
                            bookName:bookName,
                            bookPhone:bookPhone,
                            bookpp:bookpp,
                            tableNo:tableNo
                        } ,
                        success :function(x){ 
                            if(x==1){
                                alert("테이블 안내해드리면 됩니다.");
                                location.reload();
                            }else{
                                alert("다시 이용하세요 ")
                            }

                            
                        } ,
                        error : function(x){
                            alert("bad");
                        }
                    });
                } 
                if(check==1) {
                    $.ajax({
                        type : "POST",
                        url :"${root}/restaurant/table/book" ,
                        data :{
                            bookName:bookName,
                            bookPhone:bookPhone,
                            bookpp:bookpp,
                            tableNo:tableNo,
                            date:date,
                            bookTime:bookTime

                        } ,
                        success :function(x){ 
                            if(x==1){
                                alert("예약완료");
                                location.reload();
                            }else{
                                alert("다시 이용하세요 ")
                            }

                        } ,
                        error : function(x){
                            alert("bad");
                        }
                    });

                }

                modals[index].style.display = 'none';
                overlay.style.display = "none";
                
            });
        });
    }
    
    getBook();

</script>

        


</body>
</html>