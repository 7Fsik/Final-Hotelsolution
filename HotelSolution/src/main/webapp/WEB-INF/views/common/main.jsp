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
<script defer src="${root}/resources/js/common/main-aside.js"></script>
<script defer src="${root}/resources/js/common/aside.js"></script>

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
    .team-menu-bar {
        width: 16vw;
        height: 38vh;
        background-color: #3B444B;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        color: white;
    }

    .team-title {
        font-size: 25px;
        font-weight: bold;
        margin-top: 10px; /* 수정된 부분: 위쪽 마진으로 조절 */
        margin-bottom: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 10%; /* 수정된 부분: 높이를 10%로 설정 */
        width: 100%;
    }
    .sub-menu{
        padding-bottom: 40px;
    }
    .sub-menu-title{
        font-size: 20px;
        cursor: pointer;
        margin-bottom: 10px;
    }

    .sub-menu ul{
        display: none;
    }

    .sub-menu.active ul {
        display: block;
    }

    .sub-menu{
        padding-bottom: 20px;
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
    #wrap{
        background-color: rgba(185, 185, 185, 1);
        height: 100vh;
        width: 100vw;
    }

    .header-notification,
    .header-chat,
    .header-profile {
        margin-right: 15px; /* 헤더, 노티피케이션, 챗, 프로필 영역 사이에 10px의 오른쪽 마진을 줍니다. */
    }


    
	.aside-icon img{
		cursor: pointer;
	}


.notification-menu {
    display: none;
    position: absolute;
    top: 50px; /* 메뉴 탭이 이미지 아래에 표시되도록 조절 */
    background-color: white;
    padding: 10px;
    border: 1px solid #ccc;
}

/* 클릭 시 보여지도록 */
.header-notification.active .notification-menu {
    display: block;
}




</style>
<body>
	
    

        <!--헤더-->
        <div class="header">
            <div class="header-area">
                <div class="header-detail-area">
                    <div class="header-logo">
                        <a href="/fire/">
                            <img class="header-logoimg" src="${root}/resources/img/호텔솔루션.png" alt="로고이미지">
                        </a>
                    </div>
                    <div class="header-chat">
                        <a href="/fire/" >
                            <img class="header-chatimg" src="${root}/resources/img/일단넣음.png" alt="채팅이미지">
                        </a>
                    </div>
                   <div class="header-notification">
				        <img class="header-notification-img" src="${root}/resources/img/종모양아이콘.png" alt="채팅이미지">
					    <!-- 여러 개의 메뉴 탭 -->
					    <ul class="notification-menu">
					        <li><a href="${root}/hr/survey/write"><span class="notification-count">설문지 : </span></a></li>
					        <li><a href="#">채팅 : </a></li>
					        <!-- 추가적인 메뉴 탭들을 원하는 만큼 추가할 수 있습니다. -->
					    </ul>

					</div>
                    <div class="header-profile">
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
                <div id="mail-icon" class="aside-icon" onclick="gotoMail('${root}/mail/list')">
                    <img src="${root}/resources/img/메일.png" alt="아이콘1">
                    <span>메일</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/주소록.png" alt="아이콘2">
                    <span>주소록</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/자료실.png" alt="아이콘3" onclick="goDataroomByAside()">
                    <span>자료실</span>
                </div>
                <div id="board=icon" onclick="gotoBoard('${root}/board/list/1')" class="aside-icon">
                    <img src="${root}/resources/img/게시판.png" alt="아이콘4">
                    <span>게시판</span>
                </div>
                <div id="board-icon" class="aside-icon" onclick="goChatList()">
                    <img src="${root}/resources/img/채팅.png" alt="아이콘5">
                    <span>채팅</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/결재.png" alt="아이콘6" onclick="goApprovalByAside();">
                    <span>결재</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/일정.png" alt="아이콘7" onclick="goScheduleByAside()">
                    <span>일정</span>
                </div>
                <div class="aside-icon">
                    <img src="${root}/resources/img/근태관리.png" alt="아이콘8" onclick="goWorkOutByAside();">
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
                        <div class="fontbb pp">${sessionScope.loginMember.name} 사원</div>
                        <c:if test="${sessionScope.loginMember.teamNo == 1}" >
                            <div>경영지원팀</div>
                        </c:if>
                        <c:if test="${sessionScope.loginMember.teamNo == 2}" >
                            <div>프론트팀/시설관리팀</div>
                        </c:if>
                        <c:if test="${sessionScope.loginMember.teamNo == 3}" >
                            <div>식음팀</div>
                        </c:if>
                        <c:if test="${sessionScope.loginMember.teamNo == 4}" >
                            <div>인사팀</div>
                        </c:if>
                        <c:if test="${sessionScope.loginMember.teamNo == 5}" >
                            <div>구매/재무팀</div>
                        </c:if>
                    </div>
                </div>
                <div id="profile-menu" class="fontbb">
                    <div>내 정보 수정</div>
                    <div>요청한 결재              3</div>
                    <div>남은 결재              1</div>
                </div>
            </div>

            <div class="team-menu-bar">
                <c:if test="${sessionScope.loginMember.teamNo == 1}">
                <div class="team-title">경영지원팀</div>
                <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">메일함</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="#">보낸메일함</a></li>
                                <li><a class="custom-link" href="#">받은메일함</a></li>
                                <li><a class="custom-link" href="#">휴지통</a></li>
                            </ul>
                        </div>
                </div>
                </c:if>
                <c:if test="${sessionScope.loginMember.teamNo == 2}">
                    <div class="team-title">프론트팀/시설관리팀</div>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">객실관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/front/status/list?page=1">객실 상태 관리</a></li>
                                <li><a class="custom-link" href="${root}/front/bookManage/list?page=1">객실 예약 관리 </a></li>
                                <li><a class="custom-link" href="${root}/front/useManage/list?page=1">객실 이용 관리</a></li>
                                <li><a class="custom-link" href="${root}/front/useBook/list?page=1">객실 예약 / 이용</a></li>
                            </ul>
                            <div class="sub-menu-title">매출관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/front/sales">매출관리</a></li>
                            </ul>
                            <div class="sub-menu-title">재고관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/front/articleManage">재고 수량 관리</a></li>
                                <li><a class="custom-link" href="${root}/front/productManage">객실 비품 서비스 관리</a></li>
                            </ul>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loginMember.teamNo == 3}">
                    <div class="team-title">식음팀</div>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">룸 서비스</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/restaurant/">룸 서비스 주문 내역</a></li>
                            </ul>
                            <div class="sub-menu-title">식당관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/restaurant/useBook">식당 이용 / 예약</a></li>
                                <li><a class="custom-link" href="${root}/restaurant/table">식당 테이블</a></li>
                            </ul>
                            <div class="sub-menu-title">재고관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/restaurant/articleManage">재고 수량 관리</a></li>
                                <li><a class="custom-link" href="${root}/restaurant/menuManage">메뉴 관리</a></li>
                            </ul>
                            <div class="sub-menu-title">매출관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="${root}/restaurant/sales">매출조회</a></li>
                            </ul>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loginMember.teamNo == 4}">
                    <div class="team-title">인사팀</div>
                    <br>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title"><a class="custom-link" href="${root}/hr/survey/create">설문조사</a></div>
                            <br>
                            <div class="sub-menu-title"><a class="custom-link" href="${root}/hr/em/list">직원관리</a></div>
                            <br>
                            <div class="sub-menu-title"><a class="custom-link" href="${root}/hr/vacation/vaclist">휴가내역</a></div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loginMember.teamNo == 5}">
                    <div class="team-title">구매/재무팀</div>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">매출관리</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="#">매출관리1</a></li>
                                <li><a class="custom-link" href="#">매출관리2</a></li>
                                <li><a class="custom-link" href="#">매출관리3</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">메일함</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="#">보낸메일함</a></li>
                                <li><a class="custom-link" href="#">받은메일함</a></li>
                                <li><a class="custom-link" href="#">휴지통</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="sub-menu">
                            <div class="sub-menu-title">게시판</div>
                            <ul class="sub-menu-list">
                                <li><a class="custom-link" href="#">프론트팀게시판</a></li>
                                <li><a class="custom-link" href="#">좋은게시판</a></li>
                                <li><a class="custom-link" href="#">공지사항</a> </li>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>

        </div>



    
   


    
</body>
<script type="text/javascript">
	function goDataroomByAside() {
	    window.location.href = "${root}/dataroom/list";
	}
	function goScheduleByAside() {
	    window.location.href = "${root}/schedule/calendar";
	}
	
	//근태관리 페이지 이동
	function goWorkOutByAside(){
		window.location.href = "${root}/workout/attendance";
	}

	
	function goApprovalByAside(){
		window.location.href = "${root}/approval/approvalFirstPage"
	}
	$(document).ready(function() {
        // 문서가 준비되면 surveyAlert 함수를 호출합니다.
        surveyAlert();

        // "header-notification" 클래스를 클릭했을 때 메뉴를 전환하는 이벤트 핸들러입니다.
        $(".header-notification").on("click", function() {
            $(this).toggleClass("active");
        });
    });
	//미완료 설문지 갯수
	 function surveyAlert() {
        // 서버 측 Java 코드에 AJAX 요청 보내기
        $.ajax({
            type: "POST",
            url: "${root}/hr/survey/alert", // Java 컨트롤러의 엔드포인트 URL
            dataType: "json",
            success: function(response) {
                // 응답에는 Java 코드에서 반환한 카운트가 포함됩니다.
                var cnt = response;
				
                // HTML에서 알림 카운트를 업데이트(필요한 경우)
                $(".notification-count").text('설문지 : '+cnt);

                // 카운트에 따라 알림 요소를 표시/숨기기(필요한 경우)
                if (cnt > 0) {
                    $(".notification-count").css("display", "inline");
                } else {
                    $(".notification-count").css("display", "none");
                }
            },
            error: function(xhr, status, error) {
                console.error("설문 조사 알림 가져오기 오류: " + status);
            }
        });
    }
	
	 function goChatList() {
		 const width = 517;
		 const height = 820;
		 const left = (window.innerWidth / 2) - (width / 2);
		 const top = 100;
	  	window.open('${root}/chat/rooms', '','width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);


	};


</script>
</html>