<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메일쓰기화면</title>
  <style>

  </style>
</head>

<body>

<div id="wrap">

  <%@ include file="/WEB-INF/views/common/main.jsp" %>
    <link rel="stylesheet" href="${root}/resources/css/mail/post.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.11/themes/default/style.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.11/jstree.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" crossorigin="anonymous">
    <div id="mainboard">
    <div class="main-container">
      <div class="main-content">
        <hr class="mail-horizion">
        <form action="${root}/mail/post" method="post">
          <div class="mail-write-container">
            <div class="write-btn">
              <input type="hidden" name="receivers">
              <input type="hidden" name="ccList">
              <button class="btn btn-primary" onclick="getMailInfo();">보내기 </button>
            </div>
            <div class="receiver">
              <label class="mailReceiver"> 받는사람
                <input id="mailReceiver" class="mailReceiver" type="text" name="mailReceiverNo" required>
              </label>
              <button class="btn btn-primary" onclick="openContractModal();">주소록 </button>
            </div>
            <div class="cc">
              <label class="mailCc"> 참조
                <input id="mailCc" class="mailCc" type="text" name="mailCcNo">
              </label>
            </div>
            <div class="mail-title">
              <label> 제목
                <input type="text" name="title" required>
              </label>
            </div>
            <div class="mail-file-btn">
              <input type="file" accept="image/*,.txt" multiple capture='user' onchange='aaa'/>          </div>
            <div class="file-list">
            </div>
            <div class="mail-write-content">
              <label> 내용
                <textarea name="content" class="mail-write-area"></textarea>
              </label>
            </div>
          </div>
        </form>
      </div>
    </div>
</div>

</body>
</html>

<script>
  function getMailInfo(){
    event.preventDefault();

    const receiverInput = document.querySelector(".MailCatcher");
    console.log(receiverInput);
    const ccInput = document.querySelector(".mailCc");


    // 수신자와 참조 값을 배열로 처리 (','에 의해 구분)
    const receivers = receiverInput.value.split(",");
    const ccList = ccInput.value.split(",");

    // 값 처리할 경우 직렬화 (예: 쉼표로 구분)
    document.querySelector('input[name="receivers"]').value = receivers.join(",");
    document.querySelector('input[name="ccList"]').value = ccList.join(",");

    // 처리된 값으로 폼 제출
    document.querySelector("#mailForm").submit();

  }

  function openContractModal() {
    fetch("${root}/mail/contact")
            .then((res) => res.json())
            .then((data) => {
              console.log(data);
              buildModalTree(data);
            })
            .catch((error) => console.error(error));
  }

  function buildModalTree(data) {
    var treeData = [];

    data.forEach(item => {
      treeData.push({
        id: 'member-' + item.positionNo,
        parent: item.teamNo === 0 ? '#' : 'team-' + item.teamNo,
        text: `${item.memberName} (${item.email})`,
        icon: 'fa fa-user',
        type: 'member',
        data: {
          email: item.email,
          memberName: item.memberName,
          positionName: item.position,
          positionNo: item.positionNo
        }
      });

      let found = treeData.find(el => el.id === 'team-' + item.teamNo);
      if (!found) {
        treeData.push({
          id: 'team-' + item.teamNo,
          parent: '#',
          text: item.teamName,
          icon: 'fa fa-users',
          type: 'team'
        });
      }
    });

    const modal = `
      <div class="modal" id="contractModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">주소록</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div id="jstree"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="saveButton">Save changes</button>
            </div>
          </div>
        </div>
      </div>`;

    $('body').append(modal);

    $('#jstree')
            .on("check_node.jstree", function (e, data) {
              if (data.node.type === 'member') {
                const selectedItem = data.node.text;

                $('#inputId').val(function (_, currentValue) {
                  return currentValue + (currentValue ? ', ' : '') + selectedItem;
                });
              }
            })
            .jstree({
              'core': {
                'data': treeData,
                'themes': {
                  'name': 'metro', // metro 테마로 변경
                  'responsive': true
                }
              },
              'checkbox': {
                'keep_selected_style': false,
                'tie_selection': false
              },
              'types' : {
                '#' : { 'valid_children': ['team'] },
                'team': { 'valid_children': ['member'] },
                'member': { 'icon': 'fa fa-user' }
              },
              'plugins': ['checkbox', 'types']
            });

    $("#contractModal").on("hidden.bs.modal", function () {
      $(this).remove();
    });

    $("#saveButton").on("click", function () {
      const selectedNodes = $('#jstree').jstree('get_checked');
      console.log('Selected nodes:', selectedNodes);
    });

    $("#contractModal").modal('show');
  }




</script>


