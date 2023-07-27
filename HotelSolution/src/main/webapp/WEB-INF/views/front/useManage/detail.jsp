<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        margin-bottom: 5px;
    }
    .text-left{
        text-align: left;
    }
    .font-25{
        font-size: 25px;
        font-weight: bold;
        margin: 8px;
    }
    .font-20{
        font-size: 20px;
    }
    #ch{
        height: 70px;
    }
    
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    #int-area{
        height: 75%;
        width: 80%;
        position: relative;
        top: 5%;
        margin: auto;
        border: 3px  solid rgba(59, 68, 75, 1) ;
        border-radius: 10px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-evenly;
    }
    #history-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        width: 95%;
        height: 50%;
        align-items: start;
        justify-items: center;
    }
    #minibar{
        display: grid;
        grid-template-rows: 1fr 5fr 1fr;
        grid-gap: 5px;
    }
    .ttt{
        border-collapse: collapse;
    }
    .ttt td,.ttt th{
        border: 1px solid rgba(59, 68, 75, 1) ;
    }
    
    .title{
        font-weight: bold;
        font-size: 1.5em;
        
    }
    .order-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    .order{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #price-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        justify-items: start;
        grid-gap : 20px;
    }
    .order-btn{
        border-radius: 5px;
        height: 60%;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
    }
    #order-area{
        width: 100%;
        height: 8%;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    .modal{
        width: 60%;
        height: 50%;
        background-color: brown;
        position: absolute;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 10px;
    }
    .room-modal{
        z-index: 99;
        width: 60%;
        height: 60%;
        background-color: white;
        position: absolute;
        display: none;
        flex-direction: column;
        justify-content: space-between;
        padding: 10px;
        border: 3px solid  rgba(59, 68, 75, 1);
        border-radius: 10px;
    }
    .room-x{
        display: flex;
        flex-direction: row-reverse;
    }
    .modal-area{
        height: 70%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-items: center;
        padding: 10px;
        grid-gap: 10px;
    }
    .modal-search{
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-y: auto;
    }
    .searchaaa{
        height: 80%;
        width: 60%;
        border-radius: 5px;
    }
    .search-btn{
        border: 0;
        height: 80%;
        border-radius: 5px;
        background-color: rgba(59, 68, 75, 1) ;
        color: white;
    }
    .result{
        height: 80%;
        width: 100%;
    }
    .m-table{
        width: 100%;
    }
    .modal-list{
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        height: 100%;
        overflow-y: auto;
    }
    .list-title{
        height: 15%;
        font-size: 20px;
        font-weight: bold;

    }
    .list-table{
        width: 100%;
        
    }
    .ml-area{
        width: 100%;
        height: 100%;
    }
    
    .or-btn{
        height: 15%;
    }
    .la-btn{
        border: 0;
        width: 40%;
        height: 70%;
        background-color: rgba(59, 68, 75, 1) ;
        color: white;
        border-radius: 5px;
    }
    #last-btn{
        border: 0;
        background-color: rgba(59, 68, 75, 1) ;
        color: white;
        border-radius: 5px;
        font-weight: bold;
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
    input[type='number']{
        width: 50px;
        border: 0px;
    }
    tbody{
        height: 50%;
        overflow-y: auto;
    }
    .over{
        height: 180px;
        overflow-y: auto;
    }
</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            
            <div id="title">
                객실 이용내역
            </div>
            <div id="re">
                <a href="">돌아가기</a>
            </div>
    
            <div id="int-area">
                <div class="font-25">
                    ${vo.typeName}
                </div>
                <div class="font-20">
                    ${vo.roomNo} 호
                </div>
    
                
                <div id="history-area">
                    <div class="service-list">
                        <div class="line font-25">객실 비품 분출내역</div>
                        <div class="over" >
                            <table class="ttt" >
                                <thead>
                                    <tr>
                                        <th style="width: 40px;"></th>
                                        <th style="width: 100px;;" >비품명</th>
                                        <th style="width: 40px;">수량</th>
                                        <th style="width: 100px;">금액</th>
                                    </tr>
                                </thead>
                                <tbody id="roomList">


                                </tbody>
                            </table>
                        </div>
                        <div>총 금액 : <span id="room-price"></span> 원</div>
                    </div>
    
                    <div class="service-list">
                        <div class="line font-25">음식 주문내역</div>
                        <div class="over" >
                            <table class="ttt">
                                <thead >
                                    <tr>
                                        <th style="width: 30px;"></th>
                                        <th style="width: 150px;">음식명</th>
                                        <th style="width: 40px;">수량</th>
                                        <th style="width: 100px;">금액</th>
                                        <th style="width: 40px;">완료</th>
                                    </tr>
                                </thead>
                                <tbody id="foodList">
                                </tbody>
                            </table>
                        </div>
                        <div>총 금액 : <span id="food-price"></span> 원</div>
                    </div>
    
                </div>
                
                <div id="order-area">
                    <button id="room-order" class="order-btn">객실 비품 주문하기</button>
            
                    <button id="food-order" class="order-btn">음식 주문하기</button>
                </div>
                
                <div id="price-area">
                    <div>시작일 : ${vo.startDate}</div>
                    <div>종료일 : ${vo.endDate}</div>
                    <div>객실금액 : <span id="common-price">${vo.commonPrice}</span> 원</div>
                    <div>총 결제 금액 : <span id="total-price"></span> 원</div>
                </div>
                <div><button style="width: 200px;" id="last-btn">체크아웃 / 결제하기</button></div>

                <div class="room-modal">
                    <div class="room-x"><i class="close">X</i></div>
                    <div class="title font-20 ">객실 비품 주문</div>
                    <div class="modal-area">
                        <div class="modal-search">
                            <div>
                                <input type="text" class="searchaaa" id="room-search">
                                <button class="search-btn" onclick="getRoomList();">검색</button>
                            </div>
                            <div class="result">
                                <table class="m-table ttt">
                                    <tr>
                                        <th style="width: 30%;">이름</th>
                                        <th style="width: 30%;">금액</th>
                                        <th style="width: 30%;">수량</th>
                                        <th style="width: 10%;"></th>
                                    </tr>
                                    <tbody id="search-list">
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                        <div class="modal-list">
                            
                            <div class="list-title">장바구니</div>
                            <div class="ml-area">
                                <table class="ttt list-table" id="room-list">
                                </table>
                                
                                <div>총 금액 <span id="room-total-price"></span> 원</div>
                            </div>
                        </di>
                    </div>
                </div>
                <div class="or-btn">
                    <button class="la-btn" onclick="roomOrder();">주문하기</button>
                </div>
            </div>

                <div class="room-modal">
                    <div class="room-x"><i class="close">X</i></div>
                    <div class="title font-20 ">음식 주문</div>
                    <div class="modal-area">
                        <div class="modal-search">
                            <div>
                                <input type="text" class="searchaaa" id="food-search">
                                <button class="search-btn" onclick="getFoodList();"> 검색</button>
                            </div>
                            <div class="result">
                                <table class="m-table ttt">
                                    <tr>
                                        <th style="width: 30%;">이름</th>
                                        <th style="width: 30%;">금액</th>
                                        <th style="width: 30%;">수량</th>
                                        <th style="width: 10%;"></th>
                                    </tr>
                                    <tbody id="search-list2">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-list">
                            
                            <div class="list-title">장바구니</div>
                            <div class="ml-area">
                                <table class="ttt list-table" id="food-list">
                                    
                                </table>
                                
                                <div >총 금액 <span id="food-total-price"></span> 원</div>
                            </div>
                        </di>
                    </div>
                </div>
                <div class="or-btn">
                    <button class="la-btn" id="food-order-btn" onclick="foodOrder();">주문하기</button>
                </div>
            </div>
            <div id="overlay"></div>
        </div>

    
    </div>

    

    <script>
        const openModals = document.querySelectorAll('.order-btn');
        const closeModals = document.querySelectorAll('.close');
        const modals = document.querySelectorAll('.room-modal');
        const overlay = document.querySelector("#overlay");

        roomOrderList();
        foodOrderList();

        openModals.forEach(function(openModal, index) {
            openModal.addEventListener('click', function() {
                modals[index].style.display = 'flex';
                overlay.style.display = "block";
                getRoomList();
                getFoodList();
            });
        });
                
        closeModals.forEach(function(closeModal, index) {
            closeModal.addEventListener('click', function() {
                modals[index].style.display = 'none';
                overlay.style.display = "none";
            });
        });


        function roomOrderList(){
            //객실 비품 주문 내역
            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/roomOrderList" ,
                data : {
                    no:"${vo.roomUseNo}"
                } ,
                dataType : "json" ,
                success : function(x){
    
                    // 받아온 정보로 table 채우기 , 금액채우기
                    const tbody = document.querySelector("#roomList");
                    const price = document.querySelector("#room-price");
                    
                    let str = "";
                    let total = 0;
                    
                    for(let i = 0; i < x.length; i++){
                        str +=		  "<tr>"
                                    + "<td>" + (i+1)+ "</td>"
                                    + "<td>" + x[i].name + "</td>"
                                    + "<td>" + x[i].count + "</td>"
                                    + "<td>" + parseInt(x[i].pay)* parseInt(x[i].count)  + " 원 </td>"
                                    + "</tr>";
    
                                total = total + parseInt(x[i].pay)* parseInt(x[i].count);
                    }
                                        
                    tbody.innerHTML = str;
                    price.innerHTML = total;

                    totalPrice();
                    
                    } ,
                error : function(x){
                    alert("bad");
                    console.log(x);
                    } ,
                
            });


        }
        
        function foodOrderList(){
            //음식주문내역
            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/foodOrderList" ,
                data : {
                    no:"${vo.roomUseNo}"
                } ,
                dataType : "json" ,
                success : function(x){
                    
                    // 받아온 정보로 table 채우기
                    const tbody = document.querySelector("#foodList");
                    const price = document.querySelector("#food-price");
                    let str = "";
                    let total = 0 ;
                
                for(let i = 0; i < x.length; i++){
                    str +=		  "<tr>"
                                + "<td>" + (i+1)+ "</td>"
                                + "<td>" + x[i].name + "</td>"
                                + "<td>" + x[i].count + "</td>"
                                + "<td>" +parseInt(x[i].pay)* parseInt(x[i].count)  + " 원 </td>"
                                + "<td>" + x[i].finishYn  + "</td>"
                                + "</tr>";
                        total = total + parseInt(x[i].pay)* parseInt(x[i].count);
                }
                                    
                tbody.innerHTML = str;
                price.innerHTML = total;

                totalPrice();
                
                } ,
            error : function(x){
                alert("bad");
                console.log(x);
                } ,
            
            });

        }






        ////////////////////////////////////////
        //객실 주문 검색 내역 , 장바구니 담기 
        function getRoomList(){
            const searchValue = document.querySelector("#room-search").value;

            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/roomSearch" ,
                data : {
                    searchValue:searchValue
                } ,
                dataType : "json" ,
                success : function(x){
                    
                    // 받아온 정보로 table 채우기
                    const tbody = document.querySelector("#search-list");
                    let str = "";
                
                for(let i = 0; i < x.length; i++){
                    str +=		  "<tr class='room-list'>"
                                + "<input type='hidden' value='"+x[i].productNo+"' class='no'>"
                                + "<td>" + x[i].name + "</td>"
                                + "<td>" + x[i].pay + " 원 </td>"
                                + "<td><input type='number' value='1'></td>"
                                + "<td><i class='plus-room'>+</i></td>"
                                + "</tr>";
                }
                                    
                tbody.innerHTML = str;

                plusAtt();
                
                } ,
                error : function(x){
                    alert("bad");
                    console.log(x);
                    } ,
                
                });
            }
            
    
        //ajax 때문에 
        function plusAtt(){
            const pluss = document.querySelectorAll('.plus-room');
            const trs = document.querySelectorAll('.room-list');
            const table = document.querySelector('#room-list');
    
            pluss.forEach(function(plus, index) {
                plus.addEventListener('click', function() {
    
                    // 클릭한 plus 버튼이 속한 tr 요소를 찾습니다.
                    const tr = trs[index];
    
                    // tr 안의 각 요소들의 값을 가져옵니다.
                    const name = tr.querySelectorAll('td')[0].textContent;
                    const pay = tr.querySelectorAll('td')[1].textContent;
                    const num = tr.querySelector('input').value;
                    const no = tr.querySelector('.no').value;
    
                    // 가져온 값을 목적지 테이블에 추가합니다.
                    let newRow = "<tr class='plus-list'>";
                    newRow += "<input type='hidden' value='"+no+"' class='room-order-no'>"
                    newRow += "<td style='width: 30%;'>" + name + "</td>";
                    newRow += "<td class='roomp' style='width: 30%;'>" + parseInt(pay)*parseInt(num)  + "</td>";
                    newRow += "<td class ='room-order-num' style='width: 30%;'>" + num + "</td>";
                    newRow += "<td style='width: 10%;'><i class='minus'>-</i></td>";
                    newRow += "</tr>";
    
                    table.innerHTML += newRow;

                    roomPrice();
                    minusAtt();

                    function minusAtt(){
                        const minuss = document.querySelectorAll('.minus');
                        const plusLists = document.querySelectorAll('.plus-list');
                        
                        minuss.forEach(function(minus, index) {
                            minus.addEventListener('click', function() {
                                alert("zz");
                                const list = plusLists[index];
                                list.remove();
                                roomPrice();
                            })
                        })

                    }


                    function roomPrice(){
                        const rtp = document.querySelector("#room-total-price");
                        let roomTotalPrice = 0;
                        const roomps = document.querySelectorAll(".roomp");
    
                        for (const roomp of roomps) {
                            const text = roomp.textContent;
                            roomTotalPrice = roomTotalPrice+parseInt(text);
                        }
    
                        rtp.innerHTML = roomTotalPrice;
                    }

                    


                });
            });

        }



         // 객실주문하기
        function  roomOrder() {
         
            const nos = document.querySelectorAll(".room-order-no");
            const noArray = [];

            nos.forEach(element => {
            noArray.push(element.value);
            });

            const nums = document.querySelectorAll(".room-order-num");
            const numArray = [];

            nums.forEach(element => {
            numArray.push(element.textContent);
            });

            console.log(noArray);
            console.log(numArray);

            const obj = {
                    no:noArray,
                    num:numArray,
                    useNo:"${vo.roomUseNo}"
                    
                };
            

            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/roomOrder" ,
                data : {str:JSON.stringify(obj)} ,
                success : function(x){
                    if(x==='ok'){
                        modals[0].style.display = 'none';
                        overlay.style.display = 'none';
                        roomOrderList();
                        const lists = document.querySelectorAll(".plus-list") ;
                        lists.forEach(function(list, index) {
                            const delist = lists[index];
                            delist.remove();
                        })
                    }else{
                        alert("주문 실패,,,")
                        modals[1].style.display = 'none';
                        overlay.style.display = 'none';
                    }
            
                } ,
                error : function(x){
                    alert("bad");
                    console.log(x);
                    } ,
                
            });
     
        }



        ////////////////////////////////////////////////
        //음식 주문내역 , 검색 , 장바구니 담기 , 마이너스

        function getFoodList(){
            const searchValue = document.querySelector("#food-search").value;

            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/foodSearch" ,
                data : {
                    searchValue:searchValue
                } ,
                dataType : "json" ,
                success : function(x){

                    // 받아온 정보로 table 채우기
                    const tbody = document.querySelector("#search-list2");
                    let str = "";
                
                    for(let i = 0; i < x.length; i++){
                        str +=		  "<tr class='food-list'>"
                                    + "<input type='hidden' value='"+x[i].foodNo+"' class='no'>"
                                    + "<td>" + x[i].name + "</td>"
                                    + "<td>" + x[i].pay + " 원 </td>"
                                    + "<td><input type='number' class='num' value='1'></td>"
                                    + "<td><i class='plus-food'>+</i></td>"
                                    + "</tr>";
                    }
                                        
                    tbody.innerHTML = str;

                    plusAtt2();
                
                } ,
                error : function(x){
                    alert("bad");
                    console.log(x);
                    } ,
                
            });
        }
            
    
        //ajax 때문에 
        function plusAtt2(){
            const pluss = document.querySelectorAll('.plus-food');
            const trs = document.querySelectorAll('.food-list');
            const table = document.querySelector('#food-list');
    
            pluss.forEach(function(plus, index) {
                plus.addEventListener('click', function() {
    
                    // 클릭한 plus 버튼이 속한 tr 요소를 찾습니다.
                    const tr = trs[index];
    
                    // tr 안의 각 요소들의 값을 가져옵니다.
                    const name = tr.querySelectorAll('td')[0].textContent;
                    const pay = tr.querySelectorAll('td')[1].textContent;
                    const num = tr.querySelector('.num').value;
                    const no = tr.querySelector('.no').value;
    
                    // 가져온 값을 목적지 테이블에 추가합니다.
                    let newRow = "<tr class='plus-list2'>";
                    newRow += "<input type='hidden' value='"+no+"' class='food-order-no'>"
                    newRow += "<td style='width: 30%;'>" + name + "</td>";
                    newRow += "<td class='foodp' style='width: 30%;'>" + parseInt(pay)*parseInt(num)  + "</td>";
                    newRow += "<td class ='food-order-num' style='width: 30%;'>" + num + "</td>";
                    newRow += "<td style='width: 10%;'><i class='minus2'>-</i></td>";
                    newRow += "</tr>";
    
                    table.innerHTML += newRow;

                    foodPrice();
                    minusAtt2();

                    


                    function minusAtt2(){
                        const minuss2 = document.querySelectorAll('.minus2');
                        const plusLists2 = document.querySelectorAll('.plus-list2');
                        
                        minuss2.forEach(function(minus, index) {
                            minus.addEventListener('click', function() {
                                alert("zz");
                                const list = plusLists2[index];
                                list.remove();
                                foodPrice();
                            })
                        })

                    }


                    function foodPrice(){
                        const rtp = document.querySelector("#food-total-price");
                        let foodTotalPrice = 0;
                        const foodps = document.querySelectorAll(".foodp");
    
                        for (const foodp of foodps) {
                            const text = foodp.textContent;
                            foodTotalPrice = foodTotalPrice+parseInt(text);
                        }
    
                        rtp.innerHTML = foodTotalPrice;
                    }



                });
            });

        }

       




       



         //주문하기
         function foodOrder() {
         
            const nos = document.querySelectorAll(".food-order-no");
            const noArray = [];

            nos.forEach(element => {
            noArray.push(element.value);
            });

            const nums = document.querySelectorAll(".food-order-num");
            const numArray = [];

            nums.forEach(element => {
            numArray.push(element.textContent);
            });

            console.log(noArray);
            console.log(numArray);

            const obj = {
                    no:noArray,
                    num:numArray,
                    useNo:"${vo.roomUseNo}"
                    
                };
            

            $.ajax({
                type : "get" ,
                url : "${root}/front/useManage/foodOrder" ,
                data : {str:JSON.stringify(obj)} ,
                success : function(x){
                    if(x==='ok'){
                        modals[1].style.display = 'none';
                        overlay.style.display = 'none';
                        foodOrderList();
                        const lists = document.querySelectorAll(".plus-list2") ;
                        lists.forEach(function(list, index) {
                            const delist = lists[index];
                            delist.remove();
                        })
                        const foodPrice = document.querySelector("#food-total-price");
                        foodPrice.innerHTML=0;

                    }else{
                        alert("주문 실패,,,")
                        modals[1].style.display = 'none';
                        overlay.style.display = 'none';
                    }
            
                } ,
                error : function(x){
                    alert("bad");
                    console.log(x);
                    } ,
                
            });
        
        }

         //총결제 금액 구하는 함수 

        
         function totalPrice(){
            let roomPrice = document.querySelector('#room-price').textContent;
            let foodPrice = document.querySelector('#food-price').textContent;
            let commonPrice = document.querySelector("#common-price").textContent;

            let totalPrice = document.querySelector('#total-price');

            // 문자열이 숫자로 변환 가능한지 확인 후 변환
            roomPrice = parseInt(roomPrice) || 0;
            foodPrice = parseInt(foodPrice) || 0;
            commonPrice = parseInt(commonPrice) || 0;

            console.log(roomPrice);
            console.log(foodPrice);
            console.log(commonPrice);

            totalPrice.innerHTML = roomPrice + foodPrice + commonPrice;
        }

        
       

    </script>















</body>
</html>