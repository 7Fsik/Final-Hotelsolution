<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
          ,start:'title'
          ,locale: 'ko'
          ,events: [
          {
            title: '1000000원',
            start: '2023-07-15',
           
          },
          {
            title: '1000000원',
            start: '2023-07-16',
           
          },
          {
            title: '1000000원',
            start: '2023-07-17',
           
          }]

        });
        calendar.render();
      });

    </script>
<title>Insert title here</title>
</head>
<style>
     body{
        background-color: rgba(217, 217, 217, 1);
        margin: 0px;
    }
    main{
        width: 73vw;
        height: 86vh;
        background-color: white;
    }
    #title{
        font-size: 40px;
        font-weight: bold;
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    #calendar{
      height: 85%;
      border: 1px solid black;
    }
    #area{
        display: grid;
        grid-template-columns: 1fr 3fr 1fr;
        align-items: center;
    }
    .month-area{
        width: 80%;
        height: 85%;
        border: 1px solid black;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
    }
    .name{
        height: 10%;
        text-align: center;
        font-weight: bold;
    }
    .sales-area{
        width: 70%;
        margin-top: 10px;
        border-top: 3px solid black;
    }
    
</style>
<body>
   

	<main>


        <div id="title">
            매출관리 
        </div>


        <div id="area">
            <div class="month-area">
                <div class="name">월 매출</div>
                <div class="search-area">
                    <input type="date">
                    <input type="submit" value="검색">
                </div>
                <div class="sales-area">
                    <div> 2023년 1월</div>
                    <div>총 매출 :</div>
                    <div>81000000 원</div>
                </div>
            </div>

            <div id='calendar'></div>

            <div class="month-area">
                <div class="name">주 매출</div>
                <div class="search-area">
                    <input type="date">
                    <input type="submit" value="검색">
                </div>
                <div class="sales-area">
                    <div> 2023년 1월</div>
                    <div>총 매출 :</div>
                    <div>81000000 원</div>
                </div>
            </div>
        </div>
        

    </main>

    

</body>
</html>