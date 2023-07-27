<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .detailWrap {
    width: 1330px;
    height: 860px;
    border-radius: 20px;
    display: grid;
    grid-template-rows: 1fr 2fr;
    background-color: white;
  }

  .detailBody {
    display: grid;
    grid-template-columns: 1fr 1fr;
  }

  .detailBodyLeft {
    width: 550px;
    height: 470px;
    margin: auto;
    border: 1px solid black;
    border-radius: 20px;
  }

  .detailBodyRight {
    width: 550px;
    height: 470px;
    margin: auto;
    border: 1px solid black;
    border-radius: 20px;
  }

  .detailTable {
    width: 1260px;
    height: 230px;
    margin: auto;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 40px;
  }

  .dttd {
    padding-left: 20px;
    padding-top: 20px;
    border: 1px solid black;
  }

  input {
    border: 0px;
  }

  input:hover {
    background-color: rgba(59, 68, 75, 0.5);
    cursor: pointer;
  }
</style>
</head>
<body>
  <div id="wrap">
    <%@ include file="/WEB-INF/views/common/main.jsp" %>
    <div id="mainboard">
      <div class="detailWrap">
        <div class="detailTop">
          <form action="${root}/hr/em/edit" method="post" onsubmit="return totalCheck()">
            <input name="no" value="${vo.no}" hidden>
            <table class="detailTable">
              <tr>
                <td rowspan="4" style="text-align: center; border: 1px solid black;">${vo.image}</td>
                <td class="" style="text-align: center; border: 1px solid black;">이름</td>
                <td class="dttd">소속 : <input class="tn" type="text" name="teamName" value="${vo.teamName}" readonly></td>
                <td class="dttd">사번 : ${vo.no}</td>
              </tr>
              <tr>
                <td rowspan="2" style="text-align: center; border: 1px solid black;"><input class="rd" type="text" name="name" value="${vo.name}" readonly style="width: 100px; text-align: center;"></td>
                <td style="width: 350px" class="dttd">가입일 : ${vo.enrollDate}</td>
                <td class="dttd">이메일 : <input type="text" class="em" name="email" value="${vo.email}" readonly></td>
              </tr>
              <tr>
                <td style="width: 350px" class="dttd">연봉 : <input type="text" name="salary" class="sa" value="${vo.salary}" readonly>원</td>
                <td class="dttd">휴대폰번호 : <input type="text" class="ph" value="0${vo.id}" name="id" readonly></td>
              </tr>
              <tr>
                <td style="text-align: center; border: 1px solid black;"><button type="submit" class="editButton" style="display: none; border: 0px; text-align: center; width: 100px; margin: auto;">수정하기</button></td>
                <td style="width: 350px" class="dttd">직책 : <input class="pn" type="text" name="positionName" value="${vo.positionName}" readonly></td>
                <td class="dttd">부서전화번호 : ${vo.teamAddress}</td>
              </tr>
            </table>
          </form>
        </div>
        <div class="detailBody">
          <div class="detailBodyLeft">
            근태관리
          </div>
          <div class="detailBodyRight">
            휴가내역
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  
    const allInputs = document.querySelectorAll(".rd");
    const teamNameInput = document.querySelector(".tn");
    const positionNameInput = document.querySelector(".pn");
    const emailInput = document.querySelector(".em");
    const salaryInput = document.querySelector(".sa");
    const phoneInput = document.querySelector(".ph");

    const originalValues = {}; // 객체를 생성하여 원래 값들을 저장할 변수

	// 초기 원래 값들을 originalValues 객체에 저장
	
	function resetOriginalValue(inputId) {
		  const input = document.querySelector(`[name="${inputId}"]`);
		  input.value = originalValues[inputId];
		}
    function handleInputClick(event) {
      const currentInput = event.target;
      const isConfirmed = confirm("수정 하시겠습니까?");
      showEditButton(event);
      if (isConfirmed) {
        currentInput.readOnly = false;
        currentInput.focus();
      }
    }

    function validate(event) {
    	  const value = event.target.value.trim();
    	  const inputId = event.target.getAttribute("name");
    	  const isValid = validateInput(inputId, value);

    	  if (!isValid) {
    	    resetOriginalValue(inputId); // 유효성 검사 실패 시 원래 값으로 돌려놓음
    	  }
    	}

    function showEditButton(event) {
      const editButton = document.querySelector(".editButton");
      editButton.style.display = "block";
    }

    function validateInput(inputId, value) {
      if (inputId === "teamName") {
        const teamNames = ["인사팀", "호텔경영팀", "프론트팀", "식음팀", "구매팀"];
        if (!teamNames.includes(value)) {
          alert("인사팀, 호텔경영팀, 프론트팀, 식음팀, 구매팀 중 1개의 팀명을 입력하세요.");
          return false;
        }
      } else if (inputId === "positionName") {
        const positionNames = ["사원", "슈퍼바이저", "팀장", "매니저"];
        if (!positionNames.includes(value)) {
          alert("사원, 슈퍼바이저, 팀장, 매니저 중 1개의 직책명을 입력하세요.");
          return false;
        }
      } else if (inputId === "email") {
        const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        if (!emailPattern.test(value)) {
          alert("올바른 이메일 형식이 아닙니다. 영어로만 입력하세요.");
          return false;
        }
      } else if (inputId === "salary") {
        const salaryPattern = /^\d*$/;
        if (!salaryPattern.test(value)) {
          alert("연봉은 숫자만 입력 가능합니다.");
          return false;
        }
      } else if (inputId === "id") {
        const idPattern = /^\d{0,11}$/;
        if (!idPattern.test(value)) {
          alert("휴대폰번호는 숫자만 입력 가능하며 최대 11글자를 초과할 수 없습니다.");
          return false;
        }
      }

      return true;
    }

    allInputs.forEach((input) => {
    	const inputId = input.getAttribute("name");
    	  originalValues[inputId] = input.value;
      input.addEventListener("click", handleInputClick);
      input.addEventListener("change", validate);
    });
  
    teamNameInput.addEventListener("click", handleInputClick);
    teamNameInput.addEventListener("change", validate);

    positionNameInput.addEventListener("click", handleInputClick);
    positionNameInput.addEventListener("change", validate);

    emailInput.addEventListener("click", handleInputClick);
    emailInput.addEventListener("change", validate);

    salaryInput.addEventListener("click", handleInputClick);
    salaryInput.addEventListener("change", validate);

    phoneInput.addEventListener("click", handleInputClick);
    phoneInput.addEventListener("change", validate);
    
	 document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
	

	 
  </script>
</body>
</html>

