<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
 <style type="text/css">
	.dataroomBody{
		width : 1300px;
		height : 820px;
		margin-top: 50px;
		margin-left :20px;
		margin-right: 40px;
		overflow: scroll;
		
		
		
	}
	.dataroomWrap{
        display:grid;
		width:100%;
		height : 800px;
        border: 0px solid #3B444B;
        border-radius: 20px;
        background-color: white;
        grid-template-rows: 2fr 11fr;
	}
	.writeDataroomWrap{
		margin-top:1vh;
		margin-bottom:1vh;
        margin-left: 1vw;
        margin-right: 1vw;
		width:97%;
		height : 680px;
        border: 1px solid #3B444B;
        border-radius: 20px;
        gap:20px;
	}
    .writeDataroomForm{
        width: 100%;
		height : 100%;
        display: grid;
        grid-template-rows: 2fr 3fr 6fr 1fr;
    }
  
  
    
    input{
        border: 0px;
    }
   
    .button{
    	margin: 0px auto;
    	margin-top: 10px;
        width: 100px;
        height: 50%;
        
        border: #3B444B;
        background-color: #3B444B;
        color: white;
        border-radius: 20px;
    }
    textarea{
     	padding-top: 20px; 
     	padding-left: 20px; 
     	width: 1050px; 
     	height: 340px;
        border: 0px solid #3B444B;
        border-radius: 20px;
        resize: none;
        
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
	 a{
   	width: 50px;
   }
	.topName {
		display: grid;
		border-bottom: 1px solid #3b444b;
		text-align: left;
		grid-template-columns: 2fr 2fr 2fr 2fr ; 
	}
	.fileUploadContainerWrap{
		margin-top : 10px;
		display: grid;
		grid-template-columns: 4fr 4fr 2fr;
		align-items: center;
		border-bottom: 1px solid #3b444b;
	}
	.fileUpload > input{
		width: 500px;
	}
	.addFile{
		display:grid;
		font-size: 25px; 
		margin-left: 10px;
		grid-template-rows: 1fr 1fr 1fr;
		text-align: center;
	}
	.addFile>button{
		margin: 0px auto;
		font-size: 15px; 
		width: 50px;
		height: 30px;
		color: white;
		background-color:  #3b444b;
	}
	select{
		width: 100px;
		height: 30px;
	}
	.fileContent{
		display: grid;
		grid-template-columns: 1fr 9fr;
		grid-template-rows: 1fr 9fr;
		font-size: 25px; 
		margin-left: 10px;
		margin-top: 20px;
		text-align: center;
	}
	.topNameText{
		margin-left: 60px; 
		margin-top: 35px;  
		text-align: left; 
		font-size: 40px;
	}
	.topNameSelect{
		margin: auto; 
		text-align: right; 
		font-size: 20px;
	}
	.fileVo1{
		margin-left:20px;
		width: 500px; /* 원하는 너비로 설정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
	}
	.fileVo2{
		margin-left:20px;
		width: 500px; /* 원하는 너비로 설정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
	}
	.fileVo3{
		margin-left:20px;
		width: 200px; /* 원하는 너비로 설정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
	}
	
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<%@ include file="/WEB-INF/views/common/aside.jsp" %>
		
<body>
		<div class="main-container">
			<aside class="main-aside">
				<div class="profile-box"></div>
				<div class="main-aside-empty"></div>
				<div class="team-menu-bar"></div>
			</aside>
			<div class="dataroomBody">
		
			    <div class="dataroomWrap">
			    	
	           			<div class= "topNameText" >${drvo.title} (${drvo.categoryName}자료실)</div>
			        <div class="writeDataroomWrap">
			           <form action="${root}/dataroom/write" method="post" enctype="multipart/form-data" class="writeDataroomForm" data-file-count="1" >
							<input type="hidden" name="writerNo" value="1">
			           		<div class="topName" >
							   <div class="topNameSelect">
							   		작성자 :(${drvo.writerTeam}팀) ${drvo.writerName}
							   </div>
							   <div class="topNameSelect">
									보안등급 : ${drvo.securityLevelName} 이상	           				
			           			</div>
								 <div class="topNameSelect">
									작성날짜 : ${drvo.enrollDate} 			           				
			           			</div>
							   <div class="topNameSelect">
									조회수 : ${drvo.hit}			           				
			           			</div>
			           			
			           		</div>
						    <div class="fileUploadContainerWrap">
						    	 <c:forEach items="${drfvoList}" var="drfvo" varStatus="status">
								    <div class="fileVo1" >
								    	파일 이름 : ${drfvo.fileName }
								    
							       	
							       	</div>
							       	<div class="fileVo2" >
								    
							       		파일 설명 : ${drfvo.fileExplain }
							       	
							       	</div>
							       	<div class="fileVo3">
								    
							       	
							       		<a href="${root}/dataroom/download?changeName=${drfvo.changeName}&fileName=${drfvo.fileName}">다운로드</a>
							       	</div>
						       	</c:forEach>
						    </div>
						    <div>
							    <div class="fileContent">
								    <div>내용 :</div>
								    <div></div>
								    <div></div>
								    <textarea name="content" placeholder="" readonly="readonly"> ${drvo.content}</textarea>
								</div>
						    </div>

						    
						    <input class="button"  type="button" value="목록으로" onclick="goList(${drvo.categoryNo})">
						</form>
			        </div>
			    </div>
		    </div>
		</div>
       
        
</body>
<script type="text/javascript">
	function goList(categoryNo) {
		window.location.href = '${root}/dataroom/list?categoryNo=' + categoryNo;
		
	}
</script>
 
</html>
