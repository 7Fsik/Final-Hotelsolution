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
        grid-template-rows: 2fr 2fr 6fr 1fr;
    }
  
  
    
    input{
        border: 0px;
    }
   
    .button{
    	margin	: 0px auto;
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
		grid-template-columns: 8fr 2fr; 
	}
	.fileUploadContainerWrap{
		margin-top : 10px;
		display: grid;
		grid-template-columns: 1fr 9fr;
	}
	.fileUpload > input{
		margin-left: 20px;
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
		font-size: 15px;
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
			    	
	           			<div class= "topNameText" >자료실 등록하기</div>
			        <div class="writeDataroomWrap">
			           <form action="${root}/dataroom/write" method="post" enctype="multipart/form-data" class="writeDataroomForm" data-file-count="1" >
							<input type="hidden" name="writerNo" value="1">
			           		<div class="topName" >
							   <div style="font-size: 30px; padding-left:20px; margin-top: 20px;">
							 	 제목 : <input type="text" name="title" placeholder="제목을 입력하세요"style="margin-left: 20px; border-bottom: 1px solid #3b444b; width: 800px;">
							   </div>
							   <div class="topNameSelect">
			           				<select name="securityLevel" id="securityLevelSelect" style="display: none;">
									    <option value="1">전부</option>
									    <option value="2">슈퍼바이저이상</option>
									    <option value="3">팀장이상</option>
									    <option value="4">지배인이상</option>
									</select>

			           				<select name="categoryNo" id="categorySelect">
									    <option value="0" selected>카테고리</option>
									    <option value="0">공용</option>
									    <option value="${loginMember.teamNo}">부서</option>
									    <option value="100">개인</option>
									</select>

			           			</div>
			           		</div>
						    <div class="fileUploadContainerWrap">
							    <div class="addFile">
							    	<div style="padding-top: 10px;">
									    첨부파일 :
							    	</div>
								    
								    <button type="button" onclick="addFileUpload()">추가</button>
								    <div style="font-size: 15px;">
								    	(최대 5개)
								    </div>
							    </div>
						       	<div id="fileUploadContainer">
						       		<div class="fileUpload">
						       			<input type="file" name="files" accept="*">
						       			<input type="text" name="fileExplain" placeholder="파일 설명 작성하기" >
						       		</div>
						       	</div>
						    </div>
						    <div>
						       	<hr>
							    <div class="fileContent">
								    <div>내용 :</div>
								    <div></div>
								    <div></div>
								    <textarea name="content" placeholder=""></textarea>
								</div>
						    </div>

						    
						    <input class="button"  type="submit" value="등록하기" onclick="submitForm()"style="height: 30px;">
						</form>
			        </div>
			    </div>
		    </div>
		</div>
       
        
</body>

  <script>
  
	  // 카테고리 선택 변경 시 이벤트 처리
	  const categorySelect = document.querySelector('#categorySelect');
	  const securityLevelSelect = document.querySelector('#securityLevelSelect');
	
	  categorySelect.addEventListener("change", function() {
	      const selectedValue = categorySelect.value;
	      if (selectedValue === "100") {
	          securityLevelSelect.value = "1";
	          securityLevelSelect.style.display = "none";
	      } else {
	          securityLevelSelect.style.display = "inline-block";
	      }
	  });

    function addFileUpload() {
        let container = document.querySelector("#fileUploadContainer");
        let fileCount = container.getAttribute("data-file-count");

        if (fileCount < 4) {
            let fileUploadDiv = document.createElement("div");
            fileUploadDiv.classList.add("fileUpload");

            let fileInput = document.createElement("input");
            fileInput.type = "file";
            fileInput.name = "files";
            fileInput.accept = "*";
            fileInput.addEventListener("change", function() {
                if (this.files.length > 0) {
                    descriptionInput.disabled = false;
                } else {
                    descriptionInput.disabled = true;
                }
            });

            let descriptionInput = document.createElement("input");
            descriptionInput.type = "text";
            descriptionInput.name = "fileExplain";
            descriptionInput.placeholder = "파일 설명 작성하기";
            descriptionInput.disabled = true;

            fileUploadDiv.appendChild(fileInput);
            fileUploadDiv.appendChild(descriptionInput);

            container.appendChild(fileUploadDiv);
            
            let removeButton = document.createElement("button");
            removeButton.type = "button";
            removeButton.textContent = "삭제";
            removeButton.addEventListener("click", function() {
                removeFileUpload(this.parentNode);
            });

            fileUploadDiv.appendChild(removeButton);

            // 파일 업로드 카운트 증가
            fileCount++;
            container.setAttribute("data-file-count", fileCount);
        } else {
            alert("5개의 파일까지만 업로드 할 수 있습니다.");
        }
    }

    function validateForm() {
        let fileInputs = document.querySelectorAll('input[name="files"]');
        let descriptionInputs = document.querySelectorAll('input[name="fileExplain"]');
        let title = document.querySelector('input[name="title"]');
        let isValid = true;
        let fileUploaded = false;

        if (title.value.trim() === "") {
          alert("제목을 입력하세요");
          isValid = false;
        } else {
          for (let i = 0; i < fileInputs.length; i++) {
            if (fileInputs[i].files.length == 0) {
              alert("파일을 전부 선택해주세요.");
              isValid = false;
              break;
              
            } else if (fileInputs[i].files.length > 0 && descriptionInputs[i].value.trim() === "") {
              alert("파일 정보를 전부 작성해야 합니다.");
              isValid = false;
              break;
            } else if (fileInputs[i].files.length > 0 && descriptionInputs[i].value.length > 0) {
              fileUploaded = true;
            }
          }
        }
        if(fileUploaded){
       		 return isValid;
        }else{
        	return false;
        }
    }

    function removeFileUpload(input) {
        let container = document.querySelector("#fileUploadContainer");
        let fileCount = container.getAttribute("data-file-count");

        container.removeChild(input);
        fileCount--;
        container.setAttribute("data-file-count", fileCount);
    }

    // 등록하기 버튼 클릭 시 폼 유효성 검사 수행
	  function submitForm() {
	 	 if (!validateForm()) {
		    event.preventDefault();
		   
	
		    
		  }
		}








    </script>
</html>
