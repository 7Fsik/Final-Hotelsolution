<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
    <!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- context root set -->
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- google font  -->
<%--<link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">--%>

<!-- Bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${root}/resources/css/common/setup.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    /*헤더*/
    .header {
        width: 100%;
        height: 72px;
        position: sticky;
        top: 0;
        z-index: 90;
        background-color: white;
        /*border-bottom: 1px solid rgb(175, 175, 175);*/
    }

    .header-area {
        width: 100%;
        margin: 0 auto; /* 변경: auto 값 수정 */
        height: 100%;
    }

    .header-logo{
        width: 80%;
        height: 100%;
        margin-left: 120px;
    }

    .header-detail-area {
        height: 100%;
        display: flex;
        justify-content: space-between; /* 변경: 중앙 정렬을 위해 space-between으로 수정 */
        align-items: center;
        box-sizing: border-box;
    }

    .header-flex-space {
        flex-grow: 1; /* 변경: 중앙 공간을 채우기 위해 flex-grow 속성 추가 */
    }

    .header-logoimg.img{
        width: 80%;
    }

    .header-chatimg.header-notification-img.header-profile-img.img{
        width: 45px;
        height: 45px;
    }

    /*어사이드*/

    .aside {
        width: 90px; /* 변경: 고정 너비 192px 설정 */
        height: 100%; /* 변경: 세로 전체 높이로 설정 */
        position: fixed; /* 변경: 고정 위치로 설정 */
        top: 0;
        left: 0;
        z-index: 100;
        background-color: #3B444B;
        display: flex;
        flex-direction: column;
        justify-content: center; /* 변경: 세로 가운데 정렬 */
        align-items: center;
        padding-top: 20px; /* 변경: 상단 여백 추가 */
        box-sizing: border-box;
    }

    .aside-icons {
        height: 100%;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-evenly;
    }

    .aside-icon {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .aside-icon img {
        width: 30px;
        height: 30px;
    }

    .aside-icon span {
        font-size: 12px; /* 변경: 글자 크기 설정 */
        margin-top: 20px; /* 변경: 글자와 아이콘 간격 추가 */
        color: #ffffff;
    }

    .header-logo{
        display: flex;
        width: 100%;
        height: 100%;
        align-items: center;
        justify-content: flex-start;
    }

    

    /*배경*/

    #wrap{
        background-color: B9B9B9;
        height: 100%;
        width: 100%;
    }

    /*메인 사이드*/
    #main-side{
        width: 16vw;
        height: 93vh;
        position: fixed;
        left: 8%;
        display: grid;
        align-content: space-around;
    }
    .profile-box{
        width: 16vw;
        height: 38vh;
        background-color: #3B444B;
        border-radius: 10px;
        color: white;
        display: grid;
        grid-template-rows: 1.3fr 1fr;
        justify-items: center;
    }
    .team-menu-bar{
        width: 16vw;
        height: 38vh;
        background-color: #3B444B;
        border-radius: 10px;
    }
    .employee-container{
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .header-profile-img-2{
        width: 100;
    }

    .fontbb{
        font-weight: bold;
        font-size: 1.3em;
    }
    #profile-int{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
    .pp{
        padding: 10px;
    }
    #profile-menu{
        display: flex;
        flex-direction: column;
        width: 70%;
        justify-content: space-around;
    }
    #mainboard{
        position: relative;
        height: 84vh;
        width: 69vw;
        left: 27%;
        top: 4.2%;

    }

    








</style>
<body>
	
    <div id="wrap">

        <!--헤더-->
        <div class="header">
            <div class="header-area">
                <div class="header-detail-area">
                    <div class="header-logo">
                        <a href="/fire/">
                            <img class="header-logoimg" src="${root}/resources/img/호텔솔루션.png" alt="로고이미지">
                        </a>
                    </div>
                    <div class="header-flex-space"></div>
                    <div class="header-chat">
                        <a href="/fire/" >
                            <img class="header-chatimg" src="${root}/resources/img/일단넣음.png" alt="채팅이미지">
                        </a>
                    </div>
                    <div class="header-chat">
                        <a href="/fire/">
                            <img class="header-notification-img" src="${root}/resources/img/종모양아이콘.png" alt="채팅이미지">
                        </a>
                    </div>
                    <div class="header-chat">
                        <a href="/fire/" >
                            <img class="header-profile-img" src="${root}/resources/img/증명사진.png" alt="채팅이미지">
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <!--어사이드바-->
        <aside class="aside">
            <div class="aside-icons">
                <div class="aside-icon">
                    <img src="${root}/resources/img/메일.png" alt="아이콘1">
                    <span>메일</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/주소록.png" alt="아이콘2">
                    <span>주소록</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/자료실.png" alt="아이콘3">
                    <span>자료실</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/게시판.png" alt="아이콘4">
                    <span>게시판</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/채팅.png" alt="아이콘5">
                    <span>채팅</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/결재.png" alt="아이콘6">
                    <span>결재</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/일정.png" alt="아이콘7">
                    <span>일정</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/근태관리.png" alt="아이콘8">
                    <span>근태관리</span>
                </div>
            </div>
        </aside>

        <div id="main-side">
            <div class="profile-box">
                <div id="profile-int">
                    <div >
                        <img class="header-profile-img-2" src="${root}/resources/img/증명사진.png" >
                    </div>
                    <div>
                        <div class="fontbb pp">홍길동 사원</div>
                        <div >프론트팀</div>
                    </div>
                </div>
                <div id="profile-menu" class="fontbb">
                    <div>내 정보 수정</div>
                    <div>요청한 결재              3</div>
                    <div>남은 결재              1</div>
                </div>
            </div>

            <div class="team-menu-bar">
                <div class="team-title">프론트팀</div>
                <div class="mail-box">
                    <div class="sub-menu">
                        <div class="sub-menu-title">메일함</div>
                        <ul>
                            <li><a href="#">보낸메일함</a></li>
                            <li><a href="#">받은메일함</a></li>
                            <li><a href="#">휴지통</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <div id="mainboard"></div>


    </div>
   


    
</body>
</html>