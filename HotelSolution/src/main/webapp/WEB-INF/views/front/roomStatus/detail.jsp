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
    main{
        width: 73vw;
        height: 86vh;
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
    button{
        position: relative;
        top: 10px;
        width: 150px;
        height: 35px;
        border-radius: 5px;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
        font-size: 1.2em;
    }
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    #room-int{
        position: relative;
        width: 100%;
        height: 6vh;
        background-color: rgba(217, 217, 217, 1);
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 10px;
    }
    #room-int>div{
        width: 70%;
    }
    #img-file{
        position: absolute;
        top: 55%;
        left: 60%;
    }
</style>
<body>

<main>

        <div id="title">
            객실상태 상세조회
        </div>
        <div id="re">
            <a href="">돌아가기</a>
        </div>

        <div id="int-area">
            <div class="font-25">
                방이름
            </div>
            <div class="font-20">
                호수
            </div>

            <div class="img">
                <img src="" alt="">
            </div>
            <div id="img-file">
                <input type="file" value="사진 수정하기">
            </div>
            <div id="userdate-area">
                <div class="line font-25">객실 소개</div>
                <div id="room-int">
                    <div>객실은 시티뷰가 보이는 저희 호텔에서 가장 깔끔한 방입니다. 연인과 머물기 좋고 힐링 하기 좋은방입니다.</div>
                </div>
                <div class="line font-25">가본 가격 : 100000원</div>
            </div>
            <div id="ch">
                <button>수정하기</button>
            </div>

        </div>

    </main>

</body>
</html>