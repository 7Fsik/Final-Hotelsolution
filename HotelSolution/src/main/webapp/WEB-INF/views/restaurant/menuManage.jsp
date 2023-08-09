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
        height: 73%;
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
    tbody{
        height: 30px;
    }
    .te{
        width: 90%;
        border: 0px;
        text-align: end;
    }
    td>input[type="button"]{
        border: 0;
        color: white;
        border-radius: 5px;
    }
    .blue{
        background-color: blue;
    }
    .red{
        background-color: red;
    }
    #btn-area{
        width: 100%;
        display: flex;
        justify-content: center;
        height: 13%;
        align-items: center;
    }
    #plus{
       border: 0;
       background-color: rgba(59, 68, 75, 1);
       color: white;
       border-radius: 5px;
       height: 30%;
    }
    .mi{
        vertical-align: middle;
        text-align: center;
    }

    .model{
        position: fixed;
        background-color: white;
        z-index: 999;
        width: 280px;
        height: 300px;
        display: none;        
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        display: none;
        border: 3px solid rgba(59, 68, 75, 1);
        border-radius: 10px;
        left: 50%;
        top: 40%;
    }
    .model-delete{
        position: relative;
        left: 45%;
    }
    .model-btn{
        height: 30%;
        display: flex;
        align-items: center;
    }
    #overlay {
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        display: none;
    }
    .logo{
        height: 15%;
    }
    .int{
        height: 40%;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        width: 80%;
    }
    .line{
        border-bottom: 2px solid rgba(59, 68, 75, 1);;
    }
    .sis{
        width: 60%;
        border: 0;
    }
    #ppp{
        border: 0;
        border-radius: 5px;
        color: white;
        background-color: rgba(59, 68, 75, 1);
        height: 30%;
    }
    .bts{   
        border: 0;
        color: white;
        border-radius: 5px;
    }
    .ti{
        width: 70%;
        border: 0px;
        text-align: end;
    }
    
    
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
     
            <div id="title">
                 메뉴 관리
            </div>
            <div id="search-area">
                <div id="search">
                    <select name="searchType" id="searchType">
                        <option value="2">메뉴 이름</option>
                        <option value="1">메뉴 종류</option>
                    </select>
                    <input type="text" name="searchValue" id="searchValue">
                    <select name="selectValue" id="selectValue" style="display:none;">
                        <option value="1">스테이크</option>
                        <option value="2">파스타</option>
                        <option value="3">샐러드</option>
                        <option value="4">주류</option>
                        <option value="5">디저트</option>
                    </select>
                <button onclick="menuList();">검색</button>
                

                </div>
                <div>* 메뉴 이름 , 가격 만 수정 가능합니다.</div>
            </div>
    
            <div id="list-area">
                <table id="ttt">
                    <thead id="hhh">
                        <tr>
                            <th class="bl mi" style="width: 12.5%;">메뉴 번호</th>
                            <th class="bl mi" style="width: 25%;">메뉴 종류</th>
                            <th class="bl mi" style="width: 25%;">메뉴 이름</th>
                            <th class="bl mi" style="width: 12.5%;">가격</th>
                            <th class="bl mi" style="width: 12.5%;"></th>
                            <th class="bl mi" style="width: 12.5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="menuList">
                    
                    </tbody>
                </table>
            </div>
    
            <div id="btn-area">
                <button id="plus">메뉴 추가</button>
            </div>

            <div class="model">
                <span class="model-delete">
                    X
                </span>
                <div class="logo">
                    로고이미지
                </div>
                <div class="table-num">
                    메뉴 추가
                </div>
                <div class="int">
                    <div class="line">
                        메뉴 종류 : <select name="menuType" id="menuType">
                                        <option value="1">스테이크</option>
                                        <option value="2">파스타</option>
                                        <option value="3">샐러드</option>
                                        <option value="4">주류</option>
                                        <option value="5">디저트</option>
                                    </select>
                    </div>
                    <div class="line">
                        메뉴 이름 : <input type="text" name="menuName" id="menuName" class="sis" placeholder="">
                    </div>
                    <div class="line">
                        가격 : <input type="text" name="menuPrice" id="menuPrice" class="sis" placeholder="숫자만 입력하시오"> 원
                    </div>
                </div>
                <div class="model-btn">
                    <button id="ppp" onclick="plusMenu()" >추가하기</button>
                </div>
            </div>
        </div>
    </div>

    <div id="overlay">
    
    </div>

<script>
    const searchType = document.querySelector("#searchType");
    const searchValue = document.querySelector("#searchValue");
    const selectValue = document.querySelector("#selectValue");

    // 검색 조건이 바뀔 때 마다 표시 여부를 업데이트
    searchType.addEventListener("change", function() {
        if (searchType.value === "2") { // 메뉴 이름 선택 시
            searchValue.style.display = "inline-block";
            selectValue.style.display = "none";
        } else { // 메뉴 종류 선택 시
            searchValue.style.display = "none";
            selectValue.style.display = "inline-block";
        }
    });

    function menuList(){

        const searchType = document.querySelector("#searchType").value;
        const searchValue = document.querySelector("#searchValue").value;
        const selectValue = document.querySelector("#selectValue").value;

        $.ajax({
            type : "get" ,
            url : "${root}/restaurant/menuList" ,
            dataType: "json",
            data : {
                searchType:searchType,
                searchValue:searchValue,
                selectValue:selectValue
            } ,
            success : function(x){

                const tbody = document.querySelector("#menuList");
                    let str = "";
                
                for(let i = 0; i < x.length; i++){
                    str +=		  "<tr>"
                                + "<td class='bl foodNo'>"+x[i].foodNo+"</td>"
                                + "<td class='bl'>"+x[i].typeName+"</td>"
                                + "<td class='bl'><input type='text' class='te menuName' value='"+x[i].name+"'></td>"
                                + "<td class='bl'><input type='text' class='ti menuPay' value='"+x[i].pay+"'> 원</td>"
                                + "<td class='bl'>"
                                + " <button class='blue edit bts' > 수정</button>"
                                + "</td>"
                                + "<td class='bl'>"
                                + "<button class='red remove bts' > 삭제</button>"
                                + "</td>"
                                + "</tr>";
                }
                                    
                tbody.innerHTML = str;

                edit();
                menuRemove();
                
            } ,
            error : function(x){
                alert("bad");
                 console.log(x);
                } ,
            
        });
    }

    menuList();


    //수정
    function edit() {

        const editBtns =  document.querySelectorAll(".edit");
        const menuPays =  document.querySelectorAll(".menuPay");
        const menuNames =  document.querySelectorAll(".menuName");
        const foodNos =  document.querySelectorAll(".foodNo");

        editBtns.forEach(function(edit, index) {
            edit.addEventListener('click', function() {

                const menuName = menuNames[index].value;
                const menuPay = menuPays[index].value;
                const foodNo = foodNos[index].textContent;

                $.ajax({
                    type : "get",
                    url :"${root}/restaurant/edit" ,
                    dataType :"json", 
                    data :{
                        menuName:menuName,
                        menuPay:menuPay,
                        foodNo:foodNo

                    } ,
                    success :function(x){   
                        console.log(x);
                        alert("수정완료");
                        menuList();

                    } ,
                    error : function(x){
                        alert("bad");
                    },
                });
            });
        });
    }


    //삭제 
    function menuRemove() {

        const removes =  document.querySelectorAll(".remove");
        const foodNos =  document.querySelectorAll(".foodNo");

        removes.forEach(function(remove, index) {
            remove.addEventListener('click', function() {
                const foodNo = foodNos[index].textContent;

                $.ajax({
                    type : "get",
                    url :"${root}/restaurant/menuRemove" ,
                    dataType :"json", 
                    data :{
                        foodNo:foodNo

                    } ,
                    success :function(x){   
                        console.log(x);
                        alert("삭제완료");
                        menuList();
                        
                    } ,
                    error : function(x){
                        alert("bad");
                    },
                });


            });
        });
    }


    //모달
    const openModal = document.querySelector('#plus');
    const closeModal = document.querySelector('.model-delete');
    const modal = document.querySelector('.model');
    const overlay = document.querySelector("#overlay");

        openModal.addEventListener('click', function() {
            modal.style.display = 'flex';
            overlay.style.display = "block";
        });
            
   
        closeModal.addEventListener('click', function() {
            modal.style.display = 'none';
            overlay.style.display = "none";
        });


    //메뉴추가 
    function plusMenu(){

        const menuType = document.querySelector("#menuType").value;
        const menuName = document.querySelector("#menuName").value;
        const menuPrice = document.querySelector("#menuPrice").value;

        $.ajax({
            type : "post",
            url :"${root}/restaurant/plusMenu" ,
            dataType :"json", 
            data :{
                menuType:menuType,
                menuName:menuName,
                menuPrice:menuPrice
            } ,
            success :function(x){   
                console.log(x);
                alert("메뉴 추가 완료");
                menuList();
                
            } ,
            error : function(x){
                alert("bad");
            },
        });

        const modal = document.querySelector('.model');
        const overlay = document.querySelector("#overlay");

        modal.style.display = 'none';
        overlay.style.display = "none";


    }






</script>

</body>
</html>