<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        margin: 0px;
    }

    #wrap{
    	width:100vw;
    	height:100vh;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    }
    
    #box{
        width: 1000px;
        height: 800px;
        border: 1px solid #3B444B;
        border-radius: 10px;
        margin: 0 auto;
    }
    
    #logo{
        display: flex;
        justify-content: center;
        margin-top : 30px;
    }
    
    .lineText{
    	margin-left:25px;
    }
    
    #search-area{
    	display:flex;
    	flex-direction: column;
    	width:270px;
    }

	#search-area > div:first-child{
		font-size:20px;
		font-weight:bold;
		margin-top:10px;
		color: #86C8DB;
	}
	
	#search-bar{
		margin-top:15px;
		margin-left:25px;
	}
	
	#employee{
		height:550px;
		width: 350px;
		border:1px solid lightgray;
		margin-top:20px;
	}
	
	.team{
		height:30px;
		background-color:#e9ecef;
		border:1px solid #e9ecef;
		box-sizing:border-box;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	
	.teamName{
		padding:7px 0px;
		margin-left :7px;
		font-size:14px;
	}
	
	.position{
		font-size:13px;
		font-weight:bold;
	}

	.iii{
		font-size: 14px;
	}

	.position{
		position: relative;
		left: 17px;
	}

	.bi-plus-circle{
		font-size: 13px;
	}
	
	#employeeList{
		width:200px;
		height:200px;
		border: 1px solid gray;
	}
	
	.teamName-con {
   		display: flex;
    	align-items: center;
	}

	.x {
	    height: 20px; 
	    margin-left: 10px; 
	    font-size:13px;
	    font-weight:bold;
	}
	
	.x-container{
		position:relative;
		left: 50px;
		width:200px;
		height:300px;
		border : 1px solid black;
		overflow: auto;
	}

	.team-container{
		position: relative;
	}

	#btn-area{
		position: relative;
		left: 400px;
		bottom: 350px;
		display: grid;
		grid-template-rows: 1fr 1fr;
		grid-gap: 30px;
		width: 70px;
		height: 100px;

	}

	#btn-area button{
		border: 1px solid black;
		background-color: white;
		cursor: pointer;
	}

	.search-btn{
		display:flex;
	}
	
	.search-btn > button{
		width:50px;
		background-color:white;
		border:1px solid black;
		box-sizing:border-box;
		margin-left:10px;
		cursor: pointer;
	}
	
	#select-approval{
		position:relative;
		left:550px;
		bottom:454px;
	}
	
	.td2{
		width:50px;
		text-align:center
	}

	#select-approval > table{
		border-collapse: collapse;
	}
	
	#select-approval > table > tbody > tr > td{
		height:50px;
	}
	
	#select-approval > table > tbody > tr > td:first-child{
		width:30px;
		text-align:center;
		color: lightgray;
	}

	#select-approval > table > tbody > tr > td:last-child{

		width: 300px;

	}
	
	#reference-div{
	
		margin-top:150px;
	}
	
	.reference-list{
		border : 1px solid gray;
		width:390px;
		height:68px;
		margin-top:5px;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		place-items: center;
	}

	.submit-btn{
		position: relative;
		right: 150px;
		top: 40px;
		display:flex;
		justify-content:space-evenly;
		width:200px;
	}

	.submit-btn > button{
		width: 50px;
		height: 30px;
		border: 1px solid black;
		background-color: white;
		cursor: pointer;
	}
	
	#approval-table tr > td{
		text-align: center;
	}

	/* .reference-name{
		border : 1px solid black;
		width: 30px;
		height:30px;
		background-color: whitesmoke;
	} */
	
	
	
   
	
	
    
</style>
</head>
<body>

	<div id="wrap">

    <form action="${root}/approval/vaction" method="get">
        <div id="box">
            <div id="logo">
                <img style="width: 300px;" src="${root}/resources/img/호텔솔루션.png" alt="">
            </div>
            <div id="search-area">
            	<div class="lineText">결재선 설정</div>
            	<div id="search-bar">
					<div class="search-btn">
						<input type="text" name="search" placeholder="이름 검색">
						<button>검색</button>
					</div>
	            	<div id="employee">
	            		<div class="team-container">
			            	<div class="team">조직도</div>
			            	<c:forEach items="${teamList}" var="teamList">
								<div class="teamName-con">
									<div onclick="openDiv('${teamList.teamNo}');" class="teamName"><i id="iconHr${teamList.teamNo}" class="bi bi-plus-circle-fill iii"></i>${teamList.teamName}</div>
									
										<div class="x">
										</div>


								</div>
								<div class="teams" id="teams" style="display:none">
									<div class="position">
										<c:forEach items="${positionList}" var="pList">
											<div onclick="openList('${teamList.teamNo}' , '${pList.no}' ,'${teamList.teamName}' , '${pList.name}');"><i class="bi bi-plus-circle"></i>${pList.name }</div>
										</c:forEach>
									</div>
								</div>

			            	</c:forEach>
							
	            		</div>
	            	</div>
						<div id="btn-area">
							<button type="button" onclick="handleTable();">결재&nbsp;&nbsp;></button>
							<button type="button" onclick="handleReference();">참조&nbsp;&nbsp;></button>
									
						</div>
	            	</div>
            </div>
				<div id="select-approval">
							<c:if test="${documentType.documentTypeNo == '1'}">
								<table border="1" id="approval-table">
									<tbody>
										<tr>
											<td>1</td>
											<td class="td2">결재</td>
											<td class="employee-name"></td>
										</tr>
			
										
										
										<tr>
											<td>2</td>
											<td class="td2">결재</td>
											<c:forEach items="${list}" var = "member">
												<c:if test="${member.approvalPower eq '1' }">
													<td>${member.name}(${member.teamName} ${member.positionName})</td>
												</c:if>
											</c:forEach>
										</tr>
			
									</tbody>
								</table>
							</c:if>

							<c:if test="${documentType.documentTypeNo == '2'}">
								<table border="1" id="approval-table">
									<tbody>
										<tr>
											<td>1</td>
											<td class="td2">결재</td>
											<td class="employee-name"></td>
										</tr>
			
											
										<tr>
											<td>2</td>
											<td class="td2">결재</td>
											<c:forEach items="${list}" var = "member">
												<c:if test="${member.approvalPower eq '2' }">
													<td>${member.name}(${member.teamName} ${member.positionName})</td>
												</c:if>
											</c:forEach>
										</tr>
			
									</tbody>
								</table>
							</c:if>

							<c:if test="${documentType.documentTypeNo == '3'}">
								<table border="1" id="approval-table">
									<tbody>
										<tr>
											<td>1</td>
											<td class="td2">결재</td>
											<td class="employee-name"></td>
										</tr>
			
										<tr>
											<td>2</td>
											<td class="td2">결재</td>
											<c:forEach items="${list}" var = "member">
												<c:if test="${member.approvalPower eq '3' }">
													<td>${member.name}(${member.teamName} ${member.positionName})</td>
												</c:if>
											</c:forEach>
										</tr>
			
									</tbody>
								</table>
							</c:if>
					
	
					<div id="reference-div">
						<div class="reference">참조</div>
						<div class="reference-list">
							<div class="reference-name"></div>
							<div class="reference-name"></div>
							<div class="reference-name"></div>
						</div>
					</div>
				
				<div class="submit-btn">
					<button type="submit">확인</button>
					<button onclick="pageClose();">닫기</button>
				</div>
			</div>


        </div>
		
     </form>
    </div>

    <script>

		//직책 보여주기
		function openDiv(index) {
			const teams = document.querySelectorAll('.teams')
			const teamDiv = teams[index-1];
			const allIcon = document.querySelectorAll('.iii');
			const icon = allIcon[index-1]; 
			console.log(teamDiv);
			console.log(icon);
			if(teamDiv.style.display == 'none' || teamDiv.style.display == ''){
				teamDiv.style.display = 'block';
				icon.classList.remove("bi-plus-circle-fill");
				icon.classList.add('bi-dash-circle-fill');
			}else{
				teamDiv.style.display = 'none';
				icon.classList.remove('bi-dash-circle-fill');
				icon.classList.add("bi-plus-circle-fill");
			}
			
		}
		
		//사원 정보 가져오기
		function openList(teamNo , positionNo ,teamName , positionName) {
			let x = document.querySelector('.x');
			let str = "";
			$.ajax({
				url : '${root}/approval/getEmployee',
				method : 'get',
				data : {
					teamNo : teamNo,
					positionNo : positionNo,
					teamName : teamName,
					positionName : positionName,
				},
				dataType: 'json',
				contentType: 'application/json; charset=utf-8',  
				success : (data)=>{
						str += '<div class="x-container">'
					for(let i=0; i<data.length; i++){
						str += '<input type="checkbox" class="employee-checkbox" name="checkbox-" value=" ' + data[i].name + ' ' + '('+data[i].teamName+' '+data[i].positionName+')'+'">'+
						data[i].name +" " +"("+data[i].teamName + " "+data[i].positionName+")" + "<br>";
						str += '<input type="hidden" name="positionNo" value="'+data[i].positionNo+'">'
					}
						str += "</div>"
					x.innerHTML = str;
				},
				
				error :  (e)=>{
					alert('통신실패');
					console.log(e);
				}
			})
			
		}

		//창닫기
		function pageClose(params) {
				window.close();
		}

		function handleTable() {
			
			const employee = document.querySelector('input[name=checkbox-]:checked');
			const td = document.querySelector('table .employee-name');
			const position = document.querySelector('input[name=positionNo]').value;
			const em =employee.value;
			td.innerHTML = em;


		}
			
		

		function handleReference() {
			const employee = document.querySelectorAll('input[name=checkbox-]:checked');
			const reference = document.querySelectorAll('.reference-name');
			console.log(employee);
			console.log(reference[0]);
			console.log(reference[1]);
			console.log(reference[2]);
			const em = employee.value;
			
			reference[0].innerHTML = employee[0].value;
			reference[1].innerHTML = employee[1].value;
			reference[2].innerHTML = employee[2].value;

		};


		
		

    </script>

</body>
</html>