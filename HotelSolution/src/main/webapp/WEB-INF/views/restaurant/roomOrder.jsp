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
        vertical-align: middle;
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
    .trs{
        height: 40px;
    }
    #backa{
        padding: 10px;
    }
    #back{
        position: relative;
        left: 90%;
    }
    
    
    
</style>
<body>

	<div id ="wrap">

        <%@ include file="/WEB-INF/views/common/main.jsp" %>
     
        <div id="mainboard">
            <div id="backa">
                <a id="back" href="#" onclick="goBack();">돌아가기</a>
            </div>
     
            <div id="title">
                 룸 서비스 주문 내역
            </div>
            <div id="search-area">
                <div>
                </div>
                <div>* 음식이 전달이 완료되었으면 전달여부 버튼을 클릭하여 상태를 바꾸세요</div>
            </div>
    
            <div id="list-area">
                <table id="ttt">
                    <thead id="hhh">
                        <tr>
                            <th class="bl mi" style="width: 12.5%;">주문 번호</th>
                            <th class="bl mi" style="width: 25%;">메뉴 이름</th>
                            <th class="bl mi" style="width: 12.5%;">수량</th>
                            <th class="bl mi" style="width: 25%;">금액</th>
                            <th class="bl mi" style="width: 12.5%;">방 번호</th>
                            <th class="bl mi" style="width: 12.5%;">전달 여부</th>
                        </tr>
                    </thead>
                    <tbody id="menuList">
                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    

<script>
    function goBack() {
            window.history.back();
    }

    function roomOrderList(){

        $.ajax({
            type : "post" ,
            url : "${root}/restaurant/roomOrderList" ,
            dataType: "json",
            data : {
            } ,
            success : function(x){

                console.log(x);

                const tbody = document.querySelector("#menuList");
                    let str = "";
                
                for(let i = 0; i < x.length; i++){

                    const pay = parseInt(x[i].pay);
                    const count = parseInt(x[i].count);

                    str +=		  "<tr class='trs'>"
                                + "<td class='bl listNo'>"+x[i].listNo+"</td>"
                                + "<td class='bl'>"+x[i].name+"</td>"
                                + "<td class='bl'>"+x[i].count+"</td>"
                                + "<td class='bl'>"+x[i].pay+" 원</td>"
                                + "<td class='bl'>"+x[i].roomNo+"호 </td>"
                                + "<td class='bl'>"
                                + (x[i].finishYn === 'Y' ? "<button class='blue remove bts'>완료</button>" : "<button class='red change bts' data-no='"+ x[i].listNo +"'>미완</button>")
                                + "</td>"
                                + "</tr>";
                }
                                    
                tbody.innerHTML = str;

                change();

            } ,
            error : function(x){
                alert("리스트 가져오기 실패 ");
                 console.log(x);
                } ,
            
        });
    }

    roomOrderList();

    function change() {

        const changes =  document.querySelectorAll(".change");

        changes.forEach(function(change, index) {
            change.addEventListener('click', function() {

                const listNo = change.dataset.no;

                const result = confirm("음식 전달이 완료됬습니까?");
                if (result === true) {
                    $.ajax({
                    type : "POST",
                    url :"${root}/restaurant/finishChange" ,
                    data :{
                        listNo:listNo
                    } ,
                    success :function(x){ 

                        roomOrderList();

                    } ,
                    error : function(x){
                        alert("bad");
                    }

                });
                } else {
                    console.log("취소 ");
                }
            });
        });
    }


</script>

</body>
</html>