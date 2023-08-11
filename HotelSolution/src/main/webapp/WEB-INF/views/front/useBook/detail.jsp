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
    }
    .img{
        width: 70%;
        height: 40%;
        background-color: antiquewhite;
    }
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        
    }
    #user-area{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
    }
    #user-area2{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
    }
    #userdate-area{
        width: 70%;
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
        top: 90%;
        left: 70%;
        position: absolute;
    }
    button{
        position: relative;
        top: 10px;
        width: 120px;
        height: 35px;
        border-radius: 5px;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
    }
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    #price{
        margin: 5px;
        font-weight: bold;
    }
    input{
        width: 120px;
    }
    .small-input{
        width: 50px;
    }
</style>
<body>

    <div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
    
        <div id="mainboard">
            <div id="title">
                객실 이용 / 예약
            </div>
            <div id="re">
                <a href="#" onclick="goBack();">돌아가기</a>
            </div>
    
            <div id="int-area">
                <div class="font-25">
                    ${vo.typeName}
                </div>
                <div class="font-20">
                    ${vo.roomNo} 호
                </div>
    
                <div class="img">
                    <img src="" alt="">
                </div>
                <div id="userdate-area">
                    <div class="line font-25">손님 정보</div>
                    <div id="user-area" class="text-left">
                        <div>
                            손님이름 : <input type="text" id="name">
                        </div>
                        <div>
                            국적 : <input type="text" id="country">
                        </div>
                        <div>
                            이용 : 
                            <select name="checkUse" id="checkUse">
                                <option value="1">첫 이용자 </option>
                                <option value="2">회원</option>
                            </select>
                        </div>
                    </div>
                    <div id="user-area2" class="text-left">
                        <div>
                            전화번호 : <input type="text" id="phone"  maxlength="11">
                        </div>
                        <div>
                            성별 : 
                            <select id="sex">
                                <option value="M">남자</option>    
                                <option value="F">여자</option>    
                            </select>
                        </div>
                        <div>
                            연령 : <input class="small-input" type="text" id="age"> 살
                        </div>
                    </div>
                    <div class="line font-25">이용날짜</div>
                    <div>
                        시작일 : <span id="startDate">${paramMap.startDate}</span>
                    </div>
                    <div>
                        종료일 : <span id="endDate">${paramMap.endDate}</span>
                    </div>
                    <div id="price">총 객실 금액 : <span id="totalPrice">${vo.totalPrice}</span> 원</div>
                </div>
                <div id="ch">
                    <button id="book" data-roomIntNo="${paramMap.no}" onclick="book()">예약하기</button>
                    <button id="use" data-roomIntNo="${paramMap.no}" onclick="use()">이용하기</button>
                </div>
    
            </div>
        </div>
    
    </div>
<script>
    function goBack() {
        window.history.back();
    }

    function book(){
        const name = document.querySelector("#name").value;
        const country = document.querySelector("#country").value;
        const phone = document.querySelector("#phone").value;
        const sex = document.querySelector("#sex").value;
        const age = document.querySelector("#age").value;
        const checkUse = document.querySelector("#checkUse").value;

        const startDate = document.querySelector("#startDate").textContent;
        const endDate = document.querySelector("#endDate").textContent;
        const totalPrice = document.querySelector("#totalPrice").textContent;

        const roomIntNo = document.querySelector("#book").dataset.roomintno;

        $.ajax({
            type : "post",
            url :"${root}/front/useBook/detail/book" ,
            dataType :"json", 
            data :{
                name:name,
                country:country,
                phone:phone,
                sex:sex,
                age:age,
                startDate:startDate,
                endDate:endDate,
                totalPrice:totalPrice,
                roomIntNo:roomIntNo,
                checkUse:checkUse
            } ,
            success :function(x){   
                if(x==1){
                    alert("예약완료");
                    window.location.href = "${root}/front/useBook/list";
                }else{
                    alert("다시 이용해주세요");
                }
            } ,
            error : function(x){
                alert("값을 전부 다 입력해주세요");
            },
        });
    }

    function use(){
        const name = document.querySelector("#name").value;
        const country = document.querySelector("#country").value;
        const phone = document.querySelector("#phone").value;
        const sex = document.querySelector("#sex").value;
        const age = document.querySelector("#age").value;
        const checkUse = document.querySelector("#checkUse").value;

        const startDate = document.querySelector("#startDate").textContent;
        const endDate = document.querySelector("#endDate").textContent;
        const totalPrice = document.querySelector("#totalPrice").textContent;

        const roomIntNo = document.querySelector("#book").dataset.roomintno;

        $.ajax({
            type : "post",
            url :"${root}/front/useBook/detail/use" ,
            dataType :"json", 
            data :{
                name:name,
                country:country,
                phone:phone,
                sex:sex,
                age:age,
                startDate:startDate,
                endDate:endDate,
                totalPrice:totalPrice,
                roomIntNo:roomIntNo,
                checkUse:checkUse
            } ,
            success :function(x){   
                if(x==1){
                    alert("방 안내 해드리면 됩니다 ");
                    window.location.href = "${root}/front/useBook/list";
                }else if(x==100){
                    alert("회원이 아닙니다...첫 이용으로 다시 이용해주세요");
                }else{
                    alert("꼼꼼하게 입력후 다시 이용해주세요");
                }
            },
            error : function(x){
                alert("꼼꼼하게 입력후 다시 이용해주세요");
            },
        });
    }


</script>
</body>
</html>