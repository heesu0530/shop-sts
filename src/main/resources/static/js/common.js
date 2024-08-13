$().ready(function(){
	//Todo 최종적으로 주석풀기
	/*  history.pushState(null, document.title, location.href); 
	  history.replaceState(null, document.title, '/');
	  window.addEventListener('popstate', function(event) {
        location.replace('/');
    });*/
    
	$('.submit2').on('click', function(){
		var choice = this.name;
		// 팝업을 띄우고 비밀번호 확인하기
		 var _left = Math.ceil((window.screen.width - 600 )/2);
         var _top = Math.ceil((window.screen.height - 200 )/2);
		openWin = window.open("/pwCheck", "pwCheck",
		     "width=600,height=200,toolbar=no,menubar=no,left=" + _left
              + ",top=" + _top + ",resizable=no,scrollbars=no,location=no,status=no")
		if(choice =='memUpdate'){
			$('form[name=form1]').attr('action',"memUpdateForm");
		}else if(choice=='memDelete'){
			if(confirm('정말 탈퇴하십니까? \n모든 정보가 삭제 됩니다.')){
			 $('form[name=form1]').attr('action',"memUpdateForm");
			}else{
			  return false;
			} 
		}
	})
	
	    
	$('.memUpsubmit').on('click', function(){
		var choice = this.name;
		// 팝업을 띄우고 비밀번호 확인하기
		 var _left = Math.ceil((window.screen.width - 600 )/2);
         var _top = Math.ceil((window.screen.height - 200 )/2);
		if(choice =='memUpdate'){
			$('form[name=form1]').attr('action',"memUpdateForm");
		}else if(choice=='memDelete'){
			if(confirm('정말 탈퇴하십니까? \n모든 정보가 삭제 됩니다.')){
			 $('form[name=form1]').attr('action',"memDelete");
			}else{
			  return false;
			} 
		}
		openWin = window.open("/pwCheck", "pwCheck",
		     "width=600,height=200,toolbar=no,menubar=no,left=" + _left
              + ",top=" + _top + ",resizable=no,scrollbars=no,location=no,status=no")
	})
	
	$('.pwck').on('click',function(){
		var pw1 = $('#pwck').val();
		if(pw1==null || pw1.trim().length==0){
		 alert('패스워드를 입력하시오')
		 $('#pwck').focus();
		 return false;
		}
		var pw2 = $("input[name='mem_passwd']", opener.document).val();
		if(pw1==pw2){
			$("form[name='form1']", opener.document).submit();
   		    window.close();
		}else{
		 alert('비밀번호 오류')
		    window.close();
		}
	})
	
	$('#cancel').on('click',function(){
		location.href="/"
	})
})//ready끝








