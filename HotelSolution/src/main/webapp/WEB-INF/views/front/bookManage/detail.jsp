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
    #dis{
        width: 100%;
        height: 100%;
        background-color: white;
        border-radius: 10px;
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
        justify-content: space-evenly
    }
    .img{
        width: 70%;
        height: 40%;
    }
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        
    }
    #user-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #user-area2{
        display: grid;
        grid-template-columns: 2fr 1fr 1fr;
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
        height: 70px;
    }
    input{
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
    .main {
        width: 100%;
        height: 100%;
    }

    .main-container{
        width: 100%;
        height: 100%;
        background-color: #dedede;
        display: flex;
    }
    .img>img{
        width: 90%;
        height: 90%;
        border-radius: 5px;

    }
    
    </style>
<body>
	<div id ="wrap">

	<%@ include file="/WEB-INF/views/common/main.jsp" %>

		<div id="mainboard">
			<div id="dis">
            
                        <div id="title">
                            객실 예약 상세조회
                        </div>
                        <div id="re">
                            <a href="#" onclick="goBack()">돌아가기</a>
                        </div>
                
                        <div id="int-area">
                            <div class="font-25">
                                ${vo.typeName}
                            </div>
                            <div class="font-20">
                                ${vo.roomNo} 호
                            </div>
                
                            <div class="img">
                                <img src="${root}/resources/img/front/${vo.img}" >
                            </div>
                            <div id="userdate-area">
                                <div class="line font-25">손님 정보</div>
                                <div id="user-area" class="text-left">
                                    <div>손님이름 : ${vo.name}</div>
                                    <div>국적 : ${vo.nationallity}
                                    </div>
                                </div>
                                <div id="user-area2" class="text-left">
                                    <div>전화번호 : ${vo.phoneNumber}</div>
                                    <div>성별 : ${vo.gender}</div>
                                    <div>연령 :  ${vo.age} 살</div>
                                </div>
                                <div class="line font-25">이용날짜</div>
                                <div>시작일 : ${vo.startDate}</div>
                                <div>종료일 : ${vo.endDate}</div>
                            </div>
                            <div id="ch">
                                <input type="button" data-bookNo="${vo.no}" data-totalPrice = "${vo.totalPrice}"  id="checkIn" onclick="checkIn()" value="체크인하기">
                                <input type="button"  data-bookNo="${vo.no}" data-totalPrice = "${vo.totalPrice}" id="cencel" onclick="cencel()" value="취소하기">
                            </div>
                
                        </div>
                    </div>

		</div>

	</div>
        

    <script>
        function goBack() {
             window.history.back();
        }

        function checkIn(){
            const bookNo = document.querySelector("#checkIn").dataset.bookno;
            const totalPrice = document.querySelector("#checkIn").dataset.totalprice;

            $.ajax({
                type : "post",
                url :"${root}/front/bookManage/checkIn" ,
                dataType :"json", 
                data :{
                    bookNo:bookNo,
                    totalPrice:totalPrice
                } ,
                success :function(x){   
                    if(x==1){
                        alert("방 안내 해주세요");
                        window.location.href = "${root}/front/bookManage/list";
                    }else{
                        alert("체크인 실패 ,,");
                    }
                } ,
                error : function(x){
                    alert("내부오류 ㅜㅜ");
                },
            });
        }

        function cencel(){
            const bookNo = document.querySelector("#checkIn").dataset.bookno;
            const totalPrice = document.querySelector("#checkIn").dataset.totalprice;

            $.ajax({
                type : "post",
                url :"${root}/front/bookManage/cencel" ,
                dataType :"json", 
                data :{
                    bookNo:bookNo,
                    totalPrice:totalPrice
                } ,
                success :function(x){   
                    if(x==1){
                        alert("예약 취소 완료");
                        window.location.href = "${root}/front/bookManage/list";
                    }else{
                        alert("예약 취소 실패 ,,");
                    }
                } ,
                error : function(x){
                    alert("내부오류 ㅜㅜ");
                },
            });
        }

        
    </script>

</body>
</html>