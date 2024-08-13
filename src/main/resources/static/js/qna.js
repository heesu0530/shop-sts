$(document).ready(function() {
  $('.qnasubmit1').on('click', function() {
    if (validateQnaForm('form1')) {
      $('form[name=form1]').submit();
    }
  });

  $('.qnaupdate').on('click', function() {
    var nm = this.name;
    if (nm == 'update') {
      $('form[name=form1]').attr('action', "qnaUpdateForm");
      $('form[name=form1]').submit();
    } else if (nm == 'delete') {
      if (confirm('정말 삭제하시겠습니까?')) {
        $('form[name=form1]').attr('method', 'post');
        $('form[name=form1]').attr('action', "qnaDelete");
        $('form[name=form1]').submit();
      } else {
        return false;
      }
    }
  });
});

function validateQnaForm(formName) {
  var flen = $("form[name=" + formName + "] .chk").length;
  for (var i = 0; i < flen; i++) {
    var field = $("form[name=" + formName + "] .chk").eq(i);
    if (field.val() == "" || field.val() == null || field.val().trim() == "") {
      alert(field.attr('title') + '은/는 필수입력입니다.');
      field.focus();
      return false;
    }
  }
  return true;
}
function qnaUpdate(url) {
  $('form[name=form1]').attr('method', 'POST');
  $('form[name=form1]').attr('action', url);
  $('form[name=form1]').submit();
}

$('.upProcsubmit').on('click', function() {
  var choice = this.name;
  // 팝업을 띄우고 비밀번호 확인하기
  var _left = Math.ceil((window.screen.width - 600) / 2);
  var _top = Math.ceil((window.screen.height - 200) / 2);
  if (choice == 'qnaUpdate') {
    $('form[name=form1]').attr('action', "qnaUpdateProc");
  } else if (choice == 'deleteQnas') {
    if (confirm('정말 삭제하시겠습니까? \n모든 정보가 삭제 됩니다.')) {
      $('form[name=form1]').attr('action', "qnaDelete");
    } else {
      return false;
    }
  }
  openWin = window.open("/qnaPwCheck", "pwCheck",
    "width=600,height=200,toolbar=no,menubar=no,left=" + _left
    + ",top=" + _top + ",resizable=no,scrollbars=no,location=no,status=no")
})
$('.pwck').on('click', function() {
  var pw1 = $('#pwck').val();
  if (pw1 == null || pw1.trim().length == 0) {
    alert('패스워드를 입력하시오')
    $('#pwck').focus();
    return false;
  }
  if ($("input[name=adminPass]", opener.document).val() != null) {
    var pw2 = $("input[name=adminPass]", opener.document).val();
  } else {
    var pw2 = $("input[name=passwd]", opener.document).val();
  }
  if (pw1 == pw2) {
    $("form[name=form1]", opener.document).submit();
    window.close();
  } else {
    alert('비밀번호 오류')
    window.close();
  }
})

// 비밀번호 확인 콜백 함수
function passwordCheckCallback(result) {
  if (result) {
    $('form[name=form1]').submit();
  } else {
    alert('비밀번호가 틀렸습니다.');
  }
}

// qnaUpdate와 qnaDelete 함수도 밖으로 이동
window.qnaUpdate = qnaUpdate;

