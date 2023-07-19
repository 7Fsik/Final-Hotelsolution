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

    /* #document > table > tbody > tr:last-child{

        height: 100px;

    } */
    
    .first-table , .second-table{
    	border-collapse: collapse;
        border: 1px solid lightgray;
        border-top: 1px solid black;
    }
    
    .first-table > thead > tr > td{
    	width:90px;
    	height:50px;
    	text-align:center;
    }

    .first-table > thead > tr > td > input{
    	
    	width: 500px;
    
    }
    
     .first-table > tbody > tr > td{
    	width:125px;
    	height:50px;
    	text-align:center;
    }
    
	.input{
		border:none;
		outline:none;
		text-align:center;
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

	.first-table{
		margin:auto;
		margin-top:20px;
		width:600px;
	}
	
	.second-table{
		margin:auto;
		margin-top:20px;
		width:600px;
		height:300px;
	}
	
	.second-table > thead > tr > td:first-child{
		width:250px;
	}
	
	.second-table > thead > tr > td:last-child{
		width:190px;
	}
	
	tbody input[name="product"]{
		width:250px;
		box-sizing:border-box;
	}

    tbody input[name="price"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="totalPrice"]{
		width:150px;
		box-sizing:border-box;
	}
	
	tbody input[name="note"]{
		width:190px;
		box-sizing:border-box;
	}
	
	.second-table input{
		border:none;
		outline:none;
		text-align:center;
	}
	
	.last-td-content{
		margin-top:20px;
		display:flex;
		justify-content:center;
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
						<h2>호텔 솔루션 지출결의서</h2>        
						<span class="date">요청일자</span> 
					 	 : <input type="date" class="myDate">
        			</div>
					
					<div id="head-right">
						
						<table>
                            <thead>
                                <tr>
                                    <td>기안자</td>
                                    <td>슈퍼바이저</td>
                                    <td>팀장</td>
                                    <td>구매/재무팀<br>슈퍼바이저</td>
                                    <td>구매/재무팀<br>팀장</td>
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
        			<table class="first-table" border="1">
                        <thead>
                            <tr>
                                <td>제목</td>
                                <td colspan="5" class="document-title"><input class="input" type="text" name="title"></td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="info">소속</td>
                                <td><input class="input" type="text" name="team"></td>
                                <td class="info">직책</td>
                                <td><input class="input" type="text" name="position"></td>
                                <td class="info">성명</td>
                                <td><input class="input" type="text" name="name" value="이승권"></td>
                            </tr>

                        </tbody>
                    </table>
                    

                    <table border="1" class="second-table">
                        <thead>
                            <tr>
                                <th>품명</th>
                                <th>금액</th>
                                <th>비고</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>
                           
                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>
                           
                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                           
                            </tr>
                           
                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>

                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>

                            <tr>
                               <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>

                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>

                            <tr>
                                <td><input type="text" name="product"></td>
                                <td><input type="text" name="price"></td>
                                <td><input type="text" name="note"></td>
                            </tr>

                            <tr>
                                <th>합계</th>
                                <td><input type="text" name="totalPrice"></td>
                                <td></td>
                            </tr>
                            
                            <tr style="height:180px;">
                           		<td colspan="3">
                           			<div id="last-td">
	                           			<div class="last-td-content">지출결의서를 제출합니다.</div>
	                           			<div class="end-div"><input class="end-input" type="text" name="date" value="2023년 07월 18일" readonly></div>
	                           			<div class="end-div">작성인 : <input style="width: 100px;" class="end-input" type="text" name="name" value="이승권"></div>
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

	
	</script>
	

</body>
</html>