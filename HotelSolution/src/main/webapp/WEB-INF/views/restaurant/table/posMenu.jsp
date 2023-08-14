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
        left: 85%;
    }
    
    .bb{
        border:0;
        background-color: rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
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
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        border: 3px solid rgba(59, 68, 75, 1);
        border-radius: 10px;
        height: 80%;
        width: 90%;
        margin: auto;
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
    .tt th , .tt td ,.tt tfoot,.tt tbody{
        border: 1px solid black;
        vertical-align: middle;
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
        justify-content: space-evenly;
        border-radius: 5px;
        height: 100%;
        width: 100%;
        align-items: center;
    }
    .cc{
        border: 1px solid black;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .type2,.type3,.type4,.type5{
        display: none;
    }
    .steak{
        background-color: white;
    }
    tr,.tt{
        text-align: center;
        vertical-align: middle;
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
   
   .tt input{
        width: 50%;
        border: 0;
   }
   #back{
        position: relative;
        bottom: 180%;
   }
   .table-num{
        font-size: 1.5em;
        font-weight: normal;
        color: darkslategray;
   }
   .tt tr{
        height: 30px;
   }
   
   #order{
        width: 20%;
        height: 5%;
        font-size: 1.3em;
        border: 0;
        color: white;
        border-radius: 10px;
        position: relative;
        top: 2%;
        left: 40%;
        background-color: rgba(59, 68, 75, 1);
   }
   #order:hover{
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
     

                <div class="model">
                    <div class="model-delete">
                        <a id="back" href="#" onclick="goBack();">돌아가기</a>
                    </div>
                    <div class="logo">
                        <img class="logoImg" src="${root}/resources/img/호텔솔루션.png" style="width:98%">
                    </div>
                    <div class="table-num">
                        ${vo.tableNo}번 테이블 메뉴 주문
                        <div class="wrn"></div>
                    </div>
                    <div class="int">
                        <div class="ww">
                            <table class="tt">
                                <thead>
                                    <tr>
                                        <th style="width:20% ;">메뉴종류</th>
                                        <th style="width:30% ;">메뉴명</th>
                                        <th style="width:30% ;">가격</th>
                                        <th style="width:20% ;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5">총금액 : <span id="totalPrice">0</span> 원</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="menuList">
                            <div class="category">
                                <div class="steak cc">스테이크</div>
                                <div class="pasta cc">파스타</div>
                                <div class="salad cc">샐러드</div>
                                <div class="drink cc">주류 / 음류</div>
                                <div class="dessert cc">디저트</div>
                            </div>
                            <div class="list">
                                <c:forEach  items="${menuList}" var="menu">
                                    <div class="mm type${menu.foodType}" >
                                        <div class="name">${menu.name}</div>
                                        <div class="pay">${menu.pay} 원</div>
                                        <span class="plus" data-typeName="${menu.typeName}" data-foodNo="${menu.foodNo}" data-name="${menu.name}" data-pay="${menu.pay}">+</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <button id="order"  onclick="order()">주문하기 </button>
        
        </div>
     
    </div>


<script>
    function goBack() {
         window.history.back();
    }

    function order(){

        const menuLists =  document.querySelectorAll(".tt>tbody>tr>.foodNo");
        const totalPrice = document.querySelector("#totalPrice").textContent;
        const menuList = [];

        console.log(totalPrice);

        menuLists.forEach(element => {
            menuList.push(element.dataset.foodno);
            });

        const obj = {
                menuNo:menuList,
                useNo:"${vo.no}",
                totalPrice:totalPrice
            };

    $.ajax({
                type: "post",
                url: "${root}/restaurant/table/posOrder",
                data: {
                    str:JSON.stringify(obj)
                },
                dataType: "json",
                success: function (x) {
                    alert('주문완료');
                    window.location.href = "${root}/restaurant/table/pos";
                }, 
                error: function (x) {
                    alert("bad");
                    console.log(x);
                },

            });

    }




function plus(){
    const pluss = document.querySelectorAll('.plus');
    const table = document.querySelector('.tt > tbody');

    pluss.forEach(function(plus, index) {
        plus.addEventListener('click', function() {

            console.log(plus);

            const foodNo = plus.dataset.foodno;
            const name = plus.dataset.name;
            const pay = plus.dataset.pay;
            const typeName = plus.dataset.typename;
            console.log(typeName);

            let div = document.createElement("tr");
                div.className = "plus-menu";
                let innerHTML = "<td class='foodNo' data-foodno='"+foodNo+"'>"+typeName+"</td>"
                    + "<td >"+name+"</td>"
                    + "<td class='price'>"+pay+"</td>"
                    + "<td class='minus'>X</td>"
                    ;
            div.innerHTML = innerHTML;

            table.appendChild(div);
            totalPrice();
            minusAtt();

            function minusAtt(){
                const minuss = document.querySelectorAll('.minus');
                const plusLists = document.querySelectorAll('.plus-menu');
                
                minuss.forEach(function(minus, index) {
                    minus.addEventListener('click', function() {
                        const list = plusLists[index];
                        list.remove();
                        totalPrice();
                    })
                })

            }


            function totalPrice(){
                const totalPrice = document.querySelector("#totalPrice");
                let menuTotalPrice = 0;
                const prices = document.querySelectorAll(".price");

                for (const price of prices) {
                    const text = price.textContent;
                    menuTotalPrice = menuTotalPrice+parseInt(text);
                }

                totalPrice.innerHTML = menuTotalPrice;
            }
        });
    });
}

plus();
    


    const steak = document.querySelector(".steak");
    const pasta = document.querySelector(".pasta");
    const salad = document.querySelector(".salad");
    const drink = document.querySelector(".drink");
    const dessert = document.querySelector(".dessert");
    const type1 = document.querySelectorAll(".type1");
    const type2 = document.querySelectorAll(".type2");
    const type3 = document.querySelectorAll(".type3");
    const type4 = document.querySelectorAll(".type4");
    const type5 = document.querySelectorAll(".type5");

    

    steak.addEventListener('click',function(){

        dessert.style.backgroundColor='rgba(217, 217, 217, 1)';
        pasta.style.backgroundColor='rgba(217, 217, 217, 1)';
        salad.style.backgroundColor='rgba(217, 217, 217, 1)';
        drink.style.backgroundColor='rgba(217, 217, 217, 1)';

        type1.forEach(function(type, index) {
            type.style.display = 'flex';
            steak.style.backgroundColor = 'white';
        })
        type2.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type3.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type4.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type5.forEach(function(type, index) {
            type.style.display = 'none';
        
        })
    })

    pasta.addEventListener('click',function(){

        steak.style.backgroundColor='rgba(217, 217, 217, 1)';
        dessert.style.backgroundColor='rgba(217, 217, 217, 1)';
        salad.style.backgroundColor='rgba(217, 217, 217, 1)';
        drink.style.backgroundColor='rgba(217, 217, 217, 1)';


        type1.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type2.forEach(function(type, index) {
            type.style.display = 'flex';
            pasta.style.backgroundColor = 'white';
        })
        type3.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type4.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type5.forEach(function(type, index) {
            type.style.display = 'none';
        
        })
    })

    salad.addEventListener('click',function(){

        steak.style.backgroundColor='rgba(217, 217, 217, 1)';
        pasta.style.backgroundColor='rgba(217, 217, 217, 1)';
        dessert.style.backgroundColor='rgba(217, 217, 217, 1)';
        drink.style.backgroundColor='rgba(217, 217, 217, 1)';


        type1.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type2.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type3.forEach(function(type, index) {
            type.style.display = 'flex';
            salad.style.backgroundColor = 'white';
        })
        type4.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type5.forEach(function(type, index) {
            type.style.display = 'none';
        
        })
    })

    drink.addEventListener('click',function(){

        steak.style.backgroundColor='rgba(217, 217, 217, 1)';
        pasta.style.backgroundColor='rgba(217, 217, 217, 1)';
        salad.style.backgroundColor='rgba(217, 217, 217, 1)';
        dessert.style.backgroundColor='rgba(217, 217, 217, 1)';


        type1.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type2.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type3.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type4.forEach(function(type, index) {
            type.style.display = 'flex';
            drink.style.backgroundColor = 'white';
        })
        type5.forEach(function(type, index) {
            type.style.display = 'none';
        
        })
    })

    dessert.addEventListener('click',function(){

        steak.style.backgroundColor='rgba(217, 217, 217, 1)';
        pasta.style.backgroundColor='rgba(217, 217, 217, 1)';
        salad.style.backgroundColor='rgba(217, 217, 217, 1)';
        drink.style.backgroundColor='rgba(217, 217, 217, 1)';


        type1.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type2.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type3.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type4.forEach(function(type, index) {
            type.style.display = 'none';
        })
        type5.forEach(function(type, index) {
            type.style.display = 'flex';
            dessert.style.backgroundColor = 'white';
        
        })
    })


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



</script>
</body>
</html>