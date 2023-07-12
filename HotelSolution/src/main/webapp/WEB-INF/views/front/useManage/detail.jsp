<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .line{
        display: inline-block;
        border-bottom: 3px solid rgba(59, 68, 75, 1);
        margin-bottom: 5px;
    }
    .text-left{
        text-align: left;
    }
    .font-25{
        font-size: 25px;
        font-weight: bold;
        margin: 8px;
    }
    .font-20{
        font-size: 20px;
    }
    #ch{
        height: 70px;
    }
    button{
        position: relative;
        top: 10px;
        width: 120px;
        height: 35px;
        border-radius: 5px;
        color: white;
        border: 0px;
        background-color: rgba(59, 68, 75, 1) ;
        font-weight: bold;
    }
    #re{
        display: flex;
        flex-direction: row-reverse;
    }
    #re>a{
        position: relative;
        right: 20px;
    }
    #int-area{
        height: 75%;
        width: 80%;
        position: relative;
        top: 5%;
        margin: auto;
        border: 3px  solid rgba(59, 68, 75, 1) ;
        border-radius: 10px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #history-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        width: 95%;
        height: 65%;
        align-items: start;
        justify-items: center;
    }
    #minibar{
        display: grid;
        grid-template-rows: 1fr 5fr 1fr;
        grid-gap: 5px;
    }
    table{
        border-collapse: collapse;
    }
    td,th{
        border: 1px solid rgba(59, 68, 75, 1) ;
    }
    
    tr{
        font-size: 0.8em;
    }
    .order-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    .order{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #price-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        justify-items: start;
    }
</style>
<body>

<main>

        <div id="title">
            객실 이용내역
        </div>
        <div id="re">
            <a href="">돌아가기</a>
        </div>

        <div id="int-area">
            <div class="font-25">
                방이름
            </div>
            <div class="font-20">
                호수
            </div>

            
            <div id="history-area">
                <div class="service-list">
                    <div class="line">객실 비품 분출내역</div>
                    <div style="height: 100px;">
                        <table >
                            <thead>
                                <tr>
                                    <th style="width: 40px;"></th>
                                    <th style="width: 100px;;" >비품명</th>
                                    <th style="width: 40px;">수량</th>
                                    <th style="width: 100px;">금액</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td style="height: 19px;">1</td>
                                    <td style="height: 19px;">콜라</td>
                                    <td style="height: 19px;">2</td>
                                    <td style="height: 19px;">6000 원</td>
                                </tr>
                        </table>
                    </div>
                    <div>금액 19000 원</div>
                </div>

                <div class="service-list">
                    <div class="line">음식 주문내역</div>
                    <div style="height: 100px;">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 40px;"></th>
                                    <th style="width: 100px;">음식명</th>
                                    <th style="width: 40px;">수량</th>
                                    <th style="width: 100px;">금액</th>
                                    <th style="width: 40px;">완료</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td>1</td>
                                    <td>콜라</td>
                                    <td>2</td>
                                    <td>6000 원</td>
                                    <td>Y</td>
                                </tr>
                        </table>
                    </div>
                    <div>금액 19000 원</div>
                </div>

                <div>
                    <div class="line">객실 비품 주문</div>
                    <div class="order-grid">
                        <div>
                            <div>
                                <input style="width: 130px;" type="text" placeholder="비품명을 입력하시오">
                                <input type="submit" value="검색">
                            </div>
                            <div>
                                <table style="width: 200px;">
                                    <tr>
                                        <th>이름</th>
                                        <th>금액</th>
                                        <th>수량</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>콜라</td>
                                        <td>3000 원</td>
                                        <td>1</td>
                                        <td>+</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div>
                            장바구니
                            <table style="width: 200px;">
                                <tr>
                                    <td>콜라</td>
                                    <td>3000 원</td>
                                    <td>1</td>
                                </tr>
                            </table>
                            총 금액 : 3000 원
                        </div>
                    </div>
                    <div>
                        <button>주문하기</button>
                    </div>
                    
                </div>
                <div>
                    <div class="line">음식 주문</div>
                    <div class="order-grid">
                        <div>
                            <div>
                                <input style="width: 130px;" type="text" placeholder="비품명을 입력하시오">
                                <input type="submit" value="검색">
                            </div>
                            <div>
                                <table style="width: 200px;">
                                    <tr>
                                        <th>이름</th>
                                        <th>금액</th>
                                        <th>수량</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>콜라</td>
                                        <td>3000 원</td>
                                        <td>1</td>
                                        <td>+</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div>
                            장바구니
                            <table style="width: 200px;">
                                <tr>
                                    <td>콜라</td>
                                    <td>3000 원</td>
                                    <td>1</td>
                                </tr>
                            </table>
                            총 금액 : 3000 원
                        </div>
                    </div>
                    <div>
                        <button>주문하기</button>
                    </div>
                </div>
            </div>
            <div id="price-area">
                <div>시작일 : 2023-07-12</div>
                <div>종료일 : 2023-07-12</div>
                <div>객실금액 : 100000 원</div>
                <div>총 결제 금액 : 150000 원</div>
            </div>
            <div><button style="width: 200px;">체크아웃 / 결제하기</button></div>
        </div>

    </main>

</body>
</html>