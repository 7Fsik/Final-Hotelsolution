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
        border: 0;
        text-align: center;
    }
    #room-int>div{
        width: 70%;
    }
    #img-file{
        position: absolute;
        top: 55%;
        left: 60%;
    }
    form{
        display: contents;
    }
</style>
<body>

<main>

        <div id="title">
            객실상태 상세조회
        </div>
        <div id="re">
            <a href="#" onclick="goBack()">돌아가기</a>
        </div>

        <div id="int-area">
            <div class="font-25">
                ${sv.typeName}
            </div>
            <div class="font-20">
                ${sv.roomNo} 호
            </div>

            <div class="img">
                <img src="" alt="">
            </div>
            <form action="/fire/front/status/edit" method="get" enctype="multipart/form-data">
                <input type="hidden" name="roomIntNo" value="${sv.roomIntNo}">
                <div id="img-file">
                    <input type="file" name="img" value="사진 수정하기">
                </div>
                <div id="userdate-area">
                    <div class="line font-25">객실 소개</div>
                    <div >
                        <input id="room-int" type="text" name="introduce" value="${sv.introduce}" >
                        
                    </div>
                    <div class="line font-20">기본 가격 : ${sv.price} 원</div>
                    <br>
                    <div class="line font-20">
                        객실 상태 
                        <input type="radio"name="statusNo" value="1">사용가능
                        <input type="radio"name="statusNo" value="2">수리중
                    </div>
                </div>
                <div id="ch">
                    <input type="submit" value="수정하기">
                </div>
            </form>
        </div>

    </main>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>