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
    table{
        
    }
</style>
<body>

	<main>


        <div id="title">
            룸 서비스 주문내역
        </div>
        <div>
            <div>
                <div>제목</div>
                <div>
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
            </div>
            <div>
                주문 상세서?
            </div>         
        </div>

    </main>

</body>
</html>