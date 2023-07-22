<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
 <style type="text/css">
	.memberListBody{
		width : 100%;
		height : 100%;
		margin-right: 40px;
		overflow: scroll;
		
		
		
	}
	.memberListWrap{
        display:grid;
		width : 100%;
		height : 100%;
        border: 0px solid #3B444B;
        border-radius: 20px;
        background-color: white;
        grid-template-rows: 2fr 11fr;	
	}
	.writememberListWrap{
		display:grid;
		grid-template-columns: 4fr 1fr;	
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width:1200px;
		height : 680px;
       
		
	}
   	.listWrap{
   		
   		
   		display:grid;
        grid-template-rows: 1fr 1fr 10fr 1fr ;
        margin-left : 20px ;
        width: 900px;
   		height:645px;
   		border: 1px solid #3B444B;
        border-radius: 20px;
        padding:20px;
   	}
   	.newMemberListWrap{
   		display:grid;
        grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
        margin-left: 20px;
        width: 350px;
   		height:645px;
   		border: 1px solid #3B444B;
        border-radius: 20px;
        padding:20px;
        overflow: auto;
   	}
  
    .main-container{
	    width: 100%;
	    height: 100%;
	    background-color: #dedede;
	    display: grid;
    	grid-template-columns: 1fr 3fr;
	}
	
	
	.main-aside{
	    width: 276px;
	    height: 900px ;
	    display: flex;
	    flex-direction: column;
	    margin-left: 150px;
	    margin-top: 50px;
	}
	
	.profile-box{
	    width: 100%;
	    height: 360px ;
	    background-color: #3b444b;
	}
	
	.main-aside-empty{
	    width: 100%;
	    height: 40px;
	}
	
	.team-menu-bar{
	    width: 100%;
	    height: 360px;
	    background-color: #ffffff;
	}
	.memberListTop{
		display:grid;
		grid-template-columns: 2fr 3fr 2fr 4fr 4fr 5fr;
		border: 1px solid #3b444b;	
		box-sizing: border-box;
		background-color: #3b444b;
		font-weight:bold;
		font-size: 20px;
		color: white;
	}
	.memberListTop > div{
		width:100%;
		height:100%;
		
		text-align: center;
		padding-top: 15px;
		box-sizing: border-box;
	}
	
	.bbr{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    cursor: pointer;
	}
	.bbrt{
		/*border-right: 1px solid #3b444b;*/
		white-space: nowrap; /* 한 줄로 텍스트 표시 */
	    overflow: hidden; /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
	    margin-left: 10px;
	}
	#page-area{
   		margin :auto;
   	 	width: 400px;
    	text-align: center;
    	display: flex;
    	justify-content: space-around;
        }
      .tt{
      	padding-left: 40px;
        }
        #img1{
        	height: 20px;
        }
        .ac{
        	font-size: 30px;
        	
        }
     .ttt{
        margin-left: 60px; 
		margin-top: 35px;  
		text-align: left; 
		font-size: 40px;
        }
     .ttc{
     	cursor: pointer;
     	padding-top: 20px;	
     }
  
    .accept{
    	margin-top: 10px;
    	padding-top:2px;
    	width:40px;
    	height : 25px;
    	border:1px solid black;
    	cursor: pointer;
    	border-radius: 10px;	
    	text-align: center;
    	font-size: 15px;
    }
    .accept:hover{
    	  background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
    }
    .newMemberListTop{
    	
	    border: 1px solid #3b444b;
	    box-sizing: border-box;
	    background-color: #3b444b;
	    font-weight: bold;
	    font-size: 20px;
	    color: white;
    	
    	
		text-align: center;
		padding-top: 12px;
		box-sizing: border-box;
    }
    .newMemberList{
        border: 1px solid #3b444b;
	    box-sizing: border-box;
	    font-size: 20px;
    	display: grid;
    	grid-template-columns: 6fr 1fr;
    	
		text-align: center;
		box-sizing: border-box;
    	overflow: auto;
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
.memberVoList{
	    display: grid;
    grid-template-columns: 2fr 3fr 2fr 4fr 4fr 4fr;
    border: 1px solid #3b444b;
    box-sizing: border-box;
    padding-top:10px;
   
}
.memberVoList:hover{
	 background-color: rgba(59, 68, 75, 0.5); /* #3b444b 색상의 투명도 50% */
    
}
.ac{
	text-align: center;
}
.acNamediv{
	padding-top:10px;
	font-size: 15px;
}
.aj{
	display: grid;
	 grid-template-rows: repeat(10,1fr);
}
</style>
</head>
<body>

	<div id ="wrap">
	
	   <%@ include file="/WEB-INF/views/common/main.jsp" %>
	
	   <div id="mainboard">
			<div class="memberListBody">
			    <div class="memberListWrap">
					<div class="ttt">	${dataVoList.get(0).categoryName } 사원 목록</div>
			    	
			        <div class="writememberListWrap">
			        	<div class="listWrap">
			        		<div class="tt">
		        				 <form action="${root}/hr/em/list" method="get" style="margin-left: 500px;">
						                <input type="hidden" value="1" name="page">
						                    <select name="searchType" id="opt" >
						                        <option value="teamName" >부서</option>
						                        <option value="positionName" >직책</option>
						                        <option value="name" >이름</option>
						                        <option value="id">전화번호</option>
						                        <option value="email">이메일</option>
						                        
						                    </select>
						                    
						               
						                    <input class = "searchValueElem " id="searchValue" type = "text" name = "searchValue" value = "${searchVo.searchValue}" placeholder="검색할 내용">
						                    
						                     <input type="image" id="img1" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Submit" />
						            </form>
	               						
			        		</div>
			        		
				        	<div class="memberListTop">
								<div class="bbrt">부서</div>
								<div class="bbrt">직책</div>
								<div class="bbrt">이름</div>
								<div class="bbrt">전화번호</div>
								<div class="bbrt">이메일</div>
								<div>가입일</div>
							</div>
							
							<div class="aj">
							</div>
							 <div id="page-area">
				            	<c:if test="${pv.currentPage > 1}">
					            	<a  href="${root}/hr/em/list?memberListpagee=${pv.currentPage - 1}">이전</a>
				            	</c:if>
					            	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
					            		<c:if test="${pv.currentPage != i}">
							            	<a  href="${root}/hr/em/list?memberListpage=${i}">${i}</a>
					            		</c:if>
					            		<c:if test="${pv.currentPage == i}">
							            	<a >${i}</a>
					            		</c:if>
					            	</c:forEach>
					            <c:if test="${pv.currentPage < pv.endPage}">
					            	<a  href="${root}/hr/em/list?memberListpage=${pv.currentPage + 1}">다음</a>
					            </c:if>
					            <div class="searchType" hidden="">${searchType}</div>
					            <div class="searchValue" hidden="">${searchValue}</div>
				            </div>


						</div>
						
						<div class="newMemberListWrap">
							
							
						</div>
			        </div>
			    </div>
		    </div>
	   
	   </div>
	
	</div>
			
</body>
<script type="text/javascript">
	function getNewMember() {
		$.ajax({
		    url: "${root}/hr/em/new",
		    method: "GET",
		    data: {},
		    dataType: "json",
		    success: function (x) {
		        console.log(x);
		
		        const tbody = document.querySelector(".newMemberListWrap");
		        let str = `
		            <div class="ac">신규 직원 등록</div>
		            <div class="newMemberListTop">
		                <div>직원 등록</div>
		                
		            </div>
		        `;

		        for (let i = 0; i < x.length; i++) {
		
		            str += '<div class="newMemberList">' +
		                '<div class="acNamediv">' +'('+ x[i].teamName+')'+ x[i].name +' ' + x[i].positionName+ '</div>' +
		                '<div class="accept" onclick="acceptMember(' + x[i].no + ')">승인</div>' +
		                '</div>';
		        }
		
		        tbody.innerHTML = str;
		        getMember();
		    },
		    error: function (e) {
		        console.log(e);
		    },
		});
	}
		
	function getMember(memberListpage){
		const searchValue = document.querySelector(".searchValue").innerText;
	    const searchType = document.querySelector(".searchType").innerText;
		$.ajax({
			url: "${root}/hr/em/list",
		    method: "POST",
		    data: {
	            searchType: searchType,
	            searchValue: searchValue
	        },
		    dataType: "json",
		    success: function (x) {
		        console.log(x);
		
		        const otbody = document.querySelector(".aj");
		        let ostr = "";

		        for (let i = 0; i < x.length; i++) {
		        	ostr += '<div class="memberVoList" onclick="goDetail('+x[i].no +')">'+
	                ' <div class="bbr" style="padding-left: 10px;">'+ x[i].teamName + '</div>'+
	                ' <div class="bbr" style="padding-left: 20px;">'+ x[i].positionName + '</div>' +
	                ' <div class="bbr">'+ x[i].name + '</div>' +
	                ' <div class="bbr" style="padding-left: 30px;">0'+x[i].id + '</div>' +
	                ' <div class="bbr">'+x[i].email + '</div>' +
	                ' <div>'+x[i].enrollDate + '</div>'
	                +'</div>'
	                ;
				   
		        }
					ostr +='</div>';
		
		        otbody.innerHTML = ostr;
		    },
		    error: function (e) {
		        console.log(e);
		    },
		});
		
	}
	
	
	function acceptMember(memberNo) {
		$.ajax({
		    url: "${root}/hr/em/new",
		    method: "POST",
		    data: {memberNo : memberNo},
		    dataType: "json",
		    success: function (x) {
				getNewMember();
		    },
		    error: function (e) {
		        console.log(e);
		    },
		});
	}

	getNewMember();
	getMember();
	
	function goDetail(memberNo) {
		 window.location.href = '${root}/hr/em/getDetail?memberNo=' + memberNo ;
		
	}
</script>
 
</html>
