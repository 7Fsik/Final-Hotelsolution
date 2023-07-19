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
<style>
    body{
        margin: 0;
        background-color: lightgray;
    }
    #approval{
        border: 1px solid white;
        width: 1200px;
        height: 800px;
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
    	top:50px;
    	right:40px;
    }
    
   #head-right > table tr{
    	border:1px solid lightgray;
    	width:20%;
    	padding:10px;
    	height:40px;
    }
    
    #head-right > table td{
    	letter-spacing:2px;
    	border:1px solid lightgray;
    	padding:7px;
    	width:1%;
    	font-size:12px;
    }
    
    #head{
    	display:grid;
    	grid-template-columns:1.5fr 1fr;
    }
    
    #head-left{
    	position:relative;
    	top:20px;
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
    
    .completed{
    	height:30px;
    }

    #document > table > tbody > tr:last-child{

        height: 200px;

    }
    
    textarea{
    	resize:none;
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
		margin-top:20px;
		width:600px;
		height:600px;
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
						<h2>호텔 솔루션 업무보고서</h2>        
						<span class="date">보고일자</span> 
					 	 : <input type="date" class="myDate">
        			</div>
					
					<div id="head-right">
						
						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>슈퍼바이저</td>
                                    <td>팀장</td>
                                    <td>경영지원팀<br>팀장</td>
                                    <td>호텔지배인</td>
                                </tr>
                            </thead>
                                
                                <tbody>
	                                <tr>
	                                	<td>1</td>
	                                	<td>1</td>
	                                	<td>1</td>
	                                	<td>1</td>
	                                	<td>1</td>
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
                                <td class="info">보고자</td>
                                <td><input class="input" type="text" name="name" value="이승권"></td>
                            </tr>
                            
                            <tr>
                                <td class="reason">진행상황</td>
                               <td><textarea name="progress"></textarea></td>
                            </tr>

                            <tr>
                                <td class="completed">안료예정일</td>
                                <td><input class="input" type="text" name="completed"></td>
                            </tr>
                            
                           	<tr>
                           		<td>건의사항</td>
                                <td colspan="2"><textarea style="height:170px;" name=""></textarea>
                                
						                <div class="submitBtn">
							                <input type="submit" value="제출하기">
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

	
	</script>
	

</body>
</html>