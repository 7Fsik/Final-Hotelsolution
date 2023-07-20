<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}">
    </c:set>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/common/home.css">
<style>
    body{
        margin: 0;
        background-color: lightgray;
    }
    #approval{
        border: 1px solid white;
        width: 1200px;
        height: 850px;
        background-color:white;
        margin:auto;
        border-radius:10px;
    }
    
    .myDate{
    	color:#949494;
    	border:none;
        outline: none;
    }
    
    .title , .date{
    	color:#949494;
    }
    
    #head-right > table{
    	border: 1px solid lightgray;
    	text-align:center;
    	border-collapse:collapse;
    	table-layout:fixed;
    	width:100;
    	position:relative;
    	top:20px;
    	right:40px;
    }
    
   #head-right > table tr{
    	border:1px solid lightgray;
    	width:20%;
    	padding:10px;
    	height:30px;
    }
    
    #head-right > table td{
    	letter-spacing:2px;
    	border:1px solid lightgray;
    	padding:7px;
    	width:1%;
    	font-size:12px;
    	font-weight:bold;
    }
    
    #head{
    	display:grid;
    	grid-template-columns:1.5fr 1fr;
    }
    
    #head-left{
    	position:relative;
    	top:40px;
    	left:30px;
    }
    
    #document{
    	position:relative;
    	top:40px;
    }
    
    #document > table{
    	border-collapse:collapse;
    }
    
    #document > table > thead > tr > td:not(:first-child){
        width: 500px;
    }
    
    #document > table > thead > tr > td:first-child{
    	text-align:center;
    }
    
    #document > table > tbody > tr > td:first-child{
    	text-align:center;
    }
    
    #document > table > thead > tr > td{
    	border: 1px solid black;
    }
    
     #document > table > tbody > tr > td{
     	border: 1px solid black;
     }

    #document td .input{
    	width:500px;
    	border:none;
    	text-align:center;
    	outline:none;
    }
    
    .document-title{
    	height:30px;
    }
    
    .info{
    	height:50px;
    }
    
    .reason{
    	height:90px;
    }
    
    .replace{
    	height:30px;
    }

    #document > table > tbody > tr:last-child{

        height: 200px;

    }
    
    textarea{
    	resize:none;
    	overflow:hidden;
    	height:90px;
    	width:500px;
    	border:none;
    	outline:none;
    	
    }
    
    .end-input{
    	border:none;
    	outline:none;
    	font-size:16px;
    	font-weight:bold;
    }
    
    #last-td{
    	font-weight:bold;
    }
    
    .end-div{
    	display:flex;
    	justify-content:flex-end;
    	margin-top:15px;
    }
    
    .submitBtn{
    	display:flex;
    	align-items:center;
    	justify-content:center;
    }
    
    input[type=submit]{
        background-color: #d9d9d9ed;
        border: 1px solid lightgray;
        border-radius:5px;
    }

	.table{
		margin:auto;
		width:600px;
		height:600px;
		margin-top:20px;
	}
	
	.setup-btn{
		background-color:white;
		border : 1px solid white;
        cursor: pointer;
	}

    .setup-btn:hover{
        background-color: lightgray;
    }

   
    
</style>
</head>
<body>

    <div id="wrap">
    
    	

        <div id="approval">
        
        	<form action="">
        	
        		<div id ="head">
        		
        			<div id="head-left">
						<div class="title">기안문서</div>
						<h2>호텔 솔루션 휴가 신청서</h2>        
						<span class="date">기간</span> : 
						<input type="date" class="myDate"> ~ <input type="date" class="myDate">
        			</div>
					
					<div id="head-right">
						
						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>슈퍼바이저</td>
                                    <td>팀장</td>
                                    <td>인사팀<br>슈퍼바이저</td>
                                    <td>인사팀<br>팀장</td>
                                </tr>
                            </thead>
                                
                               <tbody>
	                                <tr>
	                                	<td>1</td>
	                                	<td></td>
	                                	<td></td>
	                                	<td></td>
	                                	<td></td>
	                                </tr>
	                                
	                                <tr>
	                                	<td style="font-weight:bold;" colspan="5">참조자</td>
	                                </tr>
	                                
	                                <tr>
	                                	<td></td>
	                                	<td></td>
	                                	<td></td>
	                                	<td colspan="2" onclick="approvalLineWindow(); return false;">결재선 만들기</td>
	                                </tr>
                                </tbody>
                        </table>
					</div>
					
        		</div>
        		
        		<div id="document">
        			<table class="table">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td class="document-title"><input class="input" type="text" name="title"></td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="info">소속</td>
                                <td><input class="input" type="text" name="team"></td>
                            </tr>

                            <tr>
                                <td class="info">직책</td>
                                <td><input class="input" type="text" name="position"></td>
                            </tr>

                            <tr>
                                <td class="info">성명</td>
                                <td><input class="input" type="text" name="name" value="이승권"></td>
                            </tr>
                            
                            <tr>
                                <td class="reason">사유</td>
                               <td><textarea name="content"></textarea></td>
                            </tr>

                            <tr>
                                <td class="replace">대체 업무자</td>
                                <td><input class="input" type="text" name="replaceName"></td>
                            </tr>
                            
                            <tr>
                                <td class="replace">비상 연락망</td>
                                <td><input class="input" type="text" name="phone"></td>
                            </tr>
                            
                           	<tr>
                           		<td colspan="2">
                           			<div id="last-td">
	                           			<div style="margin-top:10px;">위의 사유로 휴가신청서를 제출합니다.</div>
	                           			<div class="end-div"><input class="end-input" type="text" name="date" value="2023년 07월 18일" readonly></div>
	                           			<div class="end-div">작성인 : <input style="width: 105px;" class="end-input" type="text" name="name" value="이승권"></div>
						                <div class="submitBtn">
							                <input type="submit" value="제출하기">
						                </div>
                           			</div>
                           		</td>
                           	</tr>

                        </tbody>
                    </table>
        		</div>


        	</form>
        		
	    </div>

    </div>
    
	<script>

        function approvalLineWindow(){
            const width = 730;
            const height = 600;
            const left = (screen.width/2) - (width/2);
			const top = 0;
            const newWindow = window.open('${root}/approval/approvalLine', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', noopener');
             newWindow.focus();
        }
	</script>
	

</body>
</html>