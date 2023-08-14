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
        position: relative;
        height: 84vh;
        width: 69vw;
        left: 27%;
        top: 4.2%;
    
    }

    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #currentTime{
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
        position: relative;

        width: 100%;
        height: 100%;
    }
    .btn-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 3px;
        height: 15%;
        position: relative;
        bottom: 2px;
    }
    .bb{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    #table-area{
        width: 95%;
        height: 83%;
        display: grid;
        grid-template-rows: 1fr 1fr 1fr;
        grid-template-columns: repeat(7,1fr);
        margin: auto;
        grid-gap: 10px;
    }
    .t-bold{
        font-weight: bold;
    }
    .iii{
        width: 100%;
        height: 60%;
        top: 15%;
        opacity : 0.4;
        position: absolute;
    }
    .table-price{
        z-index: 1;
    }
    .model{
        position: fixed;
        background-color: white;
        z-index: 999;
        width: 50%;
        display: flex;
        flex-direction: column;
        align-items: center;
        /* justify-content: space-between; */
        display: none;
        border: 3px solid rgba(59, 68, 75, 1);
        border-radius: 10px;
        left: 35%;
        top: 15%;
        height: 80%;
    }
    .model-delete{
        position: relative;
        left: 48%;
    }
    .int{
        width: 90%;
        display: grid;
        grid-template-columns: 2fr 1fr;
        justify-items: center;
        height: 80%;
        overflow-y: auto;
        grid-gap: 5%;
        padding-top: 5%;
    }
    .tt th{
        border: 1px solid black;
    }
    .ww{
       width : 100%;
    }
    .category{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
        border: 1px solid black;
        background-color: rgba(217, 217, 217, 1);
    }
    .list{
        height: 80%;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        background-color: rgba(217, 217, 217, 1);
        justify-items: center;
        align-items: center;
        font-size: 0.8em;
        margin: auto;
        grid-gap: 5%;
        padding: 5%;
        grid-template-rows: 1fr 1fr 1fr;
    }
    .mm{
        display: flex;
        flex-direction: column;
        background-color: white;
        justify-content: space-between;
        border-radius: 5px;
        height: 100%;
        width: 100%;
        align-items: center;
    }
    .cc{
        border: 1px solid black;
    }
    .type2,.type3,.type4,.type5{
        display: none;
    }
    .steak{
        background-color: white;
    }
    tr{
        text-align: center;
    }
    table{
        width: 100%;
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
    .bb:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
   
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
            <span id="currentTime">
                 2023-07-17  20:05:40
            </span>
     
            <div id="title">
                식당 테이블
            </div>
     
            <div id="table-area">
               	<c:forEach items="${vo}" var="vo" >
                    <div class="table-int" >
                        <div class="table-num t-bold">
                            ${vo.tableNo} 번
                        </div>
                        <img class="iii" src="${root}/resources/img/restaurant/table.avif" alt="">
                        <div class="table-price" >
                            <span id = table${vo.tableNo}>이용중이 아닙니다</span> <span id="won${vo.tableNo}"></span> 
                        </div>
                        <div class="btn-area">
                            <button class="bb order" onclick="location.href='${root}/restaurant/table/posMenu?no=${vo.tableNo}'">메뉴주문</button>
                            <button class="bb" onclick="payment('${vo.tableNo}')">결제하기</button>
                            <input type="hidden" id="useNo${vo.tableNo}">
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
     
    </div>


<script>

    function payment(num){

        const result = confirm( num+" 번 테이블 결제 하시겠습니까?");
        const useNo = document.querySelector("#useNo"+num).value;

        if (result === true) {
            $.ajax({
                type : "POST",
                url :"${root}/restaurant/table/payment" ,
                data :{
                    useNo:useNo
                } ,
                success :function(x){ 
                    if(x===1){
                        location.reload();
                    }else{
                        alert("결제 실패 ");
                    }

                } ,
                error : function(x){
                    alert("bad");
                }
            });
        console.log("good");
        } else {
            console.log("취소 ");
        }
    }
    


    //시계
    function updateCurrentTime() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');

        const currentTimeString = year+"-"+month+"-"+day+"  "+ hours+":"+minutes+":"+seconds;

        const currentTimeElement = document.getElementById('currentTime');
        currentTimeElement.innerText = currentTimeString;
    }

    updateCurrentTime();
    setInterval(updateCurrentTime, 1000);


    //현재 이용중인 테이블 가져와서 각각 total price 넣어주기 
    function getPrice(){

        const totalPrices = document.querySelectorAll(".table-price");

        //우선 리스트 지우기
        totalPrices.forEach((element) => {
            const childDivs = element.querySelectorAll("div");
            childDivs.forEach((div) => {
                div.remove();
            });
        });


        $.ajax({
            type: "post",
            url: "${root}/restaurant/table/getTotalPrice",
            data: {
            },
            dataType: "json",
            success: function (dataList) {

                console.log(dataList);

                function putInt(data) {

                    const tableNo = data.tableNo;
                    const useNo = data.no;
                    const no = parseInt(tableNo);
                    const targetDiv = document.querySelector("#table" + no);
                    const won = document.querySelector("#won" + no);
                    const useInput = document.querySelector("#useNo" + no);
                    
                    if (targetDiv) {
                        let innerHTML = data.totalPrice ;
                        targetDiv.innerHTML = innerHTML;
                        useInput.value=useNo;
                        won.innerHTML = '원';
                    } 
                }

                dataList.forEach((vo) => {
                    putInt(vo);
                });

            },
            error: function (x) {
                alert("bad");
                console.log(x);
            },

        });
    }



        getPrice();




</script>
</body>
</html>