
$(document).ready(function() {
    $('.ndetail').on('click', function() {
        var noti_no = $(this).closest('tr').find('input[name=noti_no]').val();
        location.href = '/noticeDetail?noti_no=' + noti_no;
    });

});
$().ready(function(){
  //클래스 notisubmit 클리이되면 	chkValidate form 해주고
  $('.notisubmit').on('click', function(){
     if(chkValidate('form1')){
       $('form[name=form1]').submit();
	 }
  })
  $('.notiupdate').on('click',function(){
  var nm = this.name;
  if(nm=='update'){
    $('form[name=form1]').attr('action',"notiUpForm")
    $('form[name=form1]').submit();
  }else if(nm=='delete'){
    if(confirm('정말삭제하시겠습니까?')){
    $('form[name=form1]').attr('action',"notiDelete")
    $('form[name=form1]').submit();
    }else{
      return false;
    }
  }
  })
})
function chkValidate(forNm){
	var flen = $("form[name="+forNm+"] .chk").length;
	for(var i=0; i<flen; i++){
		if($("form[name="+forNm+"] .chk").eq(i).val()==""
		  ||$("form[name="+forNm+"] .chk").eq(i).val()==null
		  ||$("form[name="+forNm+"] .chk").eq(i).val().trim()==""){
		 alert($("form[name="+forNm+"] .chk").eq(i).attr('title')+'은/는 필수입력입니다.');
	      $("form[name="+forNm+"] .chk").eq(i).focus();
			 return false; 
		  }
	 }
	 return true;
 }
    if(validate()){
       //
       $('.inNum, .num').each(function(){
            var valWithoutCommas = $(this).val().replace(/[,]/g, '');
            $(this).val(valWithoutCommas);
            });
           // 
      $('form[name=form1]').submit();
    }

 
 