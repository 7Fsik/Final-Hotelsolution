<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #mainboard{
        border-radius: 10px;
        background-color: white;
    }
    

    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #search-area{
        display: flex;
        flex-direction: row;
        justify-content: space-around;
    }
    #list-area{
        width: 76%;
        height: 75%;
        margin: 0 auto;
        padding: 10px;
        overflow-y: auto;
    }
    #ttt{
        width: 100%;
        text-align: center;
        border-collapse: collapse;
        
    }
    .bl{
        border: 1px solid black;
    }
    #hhh{
        background-color: rgba(59, 68, 75, 1);
        color: white;
        height: 50px;
    }
    #bbb{
        height: 30px;
    }
    .count{
        width: 50%;
        border: 0px;
        text-align: end;
    }
    .edit{
        background-color:  rgba(59, 68, 75, 1);
        color: white;
        border-radius: 5px;
    }
    .mi{
        vertical-align: middle;
        text-align: center;
    }
    #searchValueSelect{
        display: none;
    }
    #bb-area{
        height: 10%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #go{
        border: 0;
        border-radius: 5px;
        width: 25%;
        height: 50%;
        background-color:  rgba(59, 68, 75, 1);
        color: white;
    }
    .edit:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
    #go:hover{
        cursor: pointer;
        background-color: rgb(86 93 98);
    }
    
</style>
<body>

	<div id ="wrap">
	
	   <%@ include file="/WEB-INF/views/common/main.jsp" %>
	
	   <div id="mainboard">
	
	      <div id="title">
	            물품 재고관리
	        </div>
	        <div id="search-area">
	            <div id="search">
                    <select name="searchType" id="searchType">
                        <option value="1">메뉴 이름</option>
                        <option value="2">메뉴 종류</option>
                    </select>
                    <input type="text" name="searchValueInput" id="searchValueInput">
                    <select name="searchValueSelect" id="searchValueSelect" >
                        <option value="1">공산품</option>
                        <option value="2">식자재</option>
                        <option value="3">해산물</option>
                        <option value="4">고기</option>
                    </select>
                    <input type="submit" value="검색" onclick="getItemList();">
	            </div>
	
	            <div>
	                * 수량만 수정할 수 있습니다 
	            </div>
	        </div>
	
	        <div id="list-area">
	            <table id="ttt">
	                <thead id="hhh">
	                    <tr style="vertical-align: middle;">
	                        <th class="bl mi" style="width: 12.5%;">물품 번호</th>
	                        <th class="bl mi" style="width: 25%;">물품 종류</th>
	                        <th class="bl mi" style="width: 25%;">물품 이름</th>
	                        <th class="bl mi" style="width: 12.5%;">가격</th>
	                        <th class="bl mi" style="width: 12.5%;">수량</th>
	                        <th class="bl mi" style="width: 12.5%;"></th>
	                    </tr>
	                </thead>
	                <tbody id="bbb">
	                	<c:forEach items="${itemList}" var="item">
		                    <tr>
		                        <td class="bl itemNo">${item.itemNo}</td>
		                        <td class="bl">${item.typeName}</td>
		                        <td class="bl"> ${item.name}</td>
		                        <td class="bl">${item.price } 원</td>
		                        <td class="bl count">
	                                <input type="text" class="count" value="100">개
	                            </td>
		                        <td class="bl">
	                                <input type="button" class="edit" value="수정">
	                            </td>
		                    </tr>
	                	</c:forEach>
	                </tbody>
	            </table>
	        </div>
	
	        <div id="bb-area">
	            <button id="go" onclick="location.href='${root}/approval/expenditure'">발주하러가기</button>
	        </div>
	   
	   </div>
	
	</div>

<script>
    // 검색 타입 선택 요소
    const searchTypeSelect = document.getElementById("searchType");

    // 검색 값 입력 필드와 검색 값 선택(select) 요소
    const searchValueInput = document.getElementById("searchValueInput");
    const searchValueSelect = document.getElementById("searchValueSelect");

    // searchType 값이 변경될 때마다 요소들의 표시 여부를 조정하는 이벤트 리스너
    searchTypeSelect.addEventListener("change", function() {
        const selectedValue = searchTypeSelect.value;

        if (selectedValue === "2") {
            searchValueInput.style.display = "none";
            searchValueSelect.style.display = "inline-block";
        } else if (selectedValue === "1") {
            searchValueInput.style.display = "inline-block";
            searchValueSelect.style.display = "none";
        } else {
            searchValueInput.style.display = "none";
            searchValueSelect.style.display = "none";
        }
    });

    getItemList();

    function getItemList(){

         // 검색 타입 선택 요소
        const searchTypeSelect = document.getElementById("searchType").value;

        // 검색 값 입력 필드와 검색 값 선택(select) 요소
        const searchValueInput = document.getElementById("searchValueInput").value;
        const searchValueSelect = document.getElementById("searchValueSelect").value;

        $.ajax({
                type: "get",
                url: "${root}/front/articleManage/getItemList",
                data: {
                    searchTypeSelect:searchTypeSelect,
                    searchValueInput:searchValueInput,
                    searchValueSelect:searchValueSelect
                },
                success: function(x) {
                    console.log(x);
                    // 받아온 정보로 table 채우기
                    const tbody = document.querySelector("#bbb");
                    let str = "";
                
                    for(let i = 0; i < x.length; i++){
                        str +=		  "<tr>"
                                    + "<td class='bl itemNo'>"+x[i].itemNo +"</td>"
                                    + "<td class='bl'>"+x[i].typeName +"</td>"
                                    + "<td class='bl'>"+ x[i].name+"</td>"
                                    + "<td class='bl'>"+x[i].price +" 원</td>"
                                    + "<td class='bl'><input type='text' class='count' value='"+x[i].count +"'>개</td>"
                                    + "<td class='bl'><input type='button' class='edit' value='수정'></td>"
                                    + "</tr>";
                    }
                    tbody.innerHTML = str;

                    //수정버튼 활성화
                    const edits = document.querySelectorAll(".edit");
                    const itemNos = document.querySelectorAll(".itemNo");
                    const counts = document.querySelectorAll(".count");
                    //클릭하면 itemNo,count 가져와서 ajax 돌리기
                    edits.forEach(function(edit, index) {
                        edit.addEventListener('click', function() {

                            const itemNo = itemNos[index].textContent;
                            const count = counts[index].value;

                            $.ajax({
                                type : "get" ,
                                url : "${root}/front/articleManage/edit" ,
                                data : {
                                    itemNo:itemNo,
                                    count:count
                                } ,
                                success : function(x){
                                    getItemList();
                                    alert("수정완료");
                                } ,
                                error : function(x){
                                    alert("bad");
                                    console.log(x);
                                    } ,
                                
                            });


                        })
                    })
    




                    
                },
                error: function(error) {
                    // 에러 처리
                    // ...
                    console.log(error);
                }
        });

    }
    

</script>
    

</body>
</html>