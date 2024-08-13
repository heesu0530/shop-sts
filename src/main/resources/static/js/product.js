/**
 * 
 */
$().ready(function() {
	var nlen = $('.num').length;
	for (var i = 0; i < nlen; i++) {
		var n = $('.num').eq(i).val();
		var to_n = n.toString()
			.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$('.num').eq(i).val(to_n);
	}
	$('.psubmit').on('click', function() {
		var nm = this.name;
		if (nm == 'insert') {
			$('form[name=form1]').attr("action", "productMgtProc?flag=insert")
		} else if (nm == 'update') {
			$('form[name=form1]').attr("action", "productMgtProc?flag=update")
		} else if (nm == 'stateUpdate') {
			$('.inNum, .num').each(function() {
				var valWithoutCommas = $(this).val().replace(/[,]/g, '');
				$(this).val(valWithoutCommas);
			});
			$('form[name=form1]').submit();
			return true;
		} else if (nm == 'orderDelete') {
			$('.inNum, .num').each(function() {
				var valWithoutCommas = $(this).val().replace(/[,]/g, '');
				$(this).val(valWithoutCommas);
			});
			$('form[name=form1]').attr('action', 'orderDelete');
			$('form[name=form1]').submit();
			return true;
		}
		if (validate()) {
			//
			$('.inNum, .num').each(function() {
				var valWithoutCommas = $(this).val().replace(/[,]/g, '');
				$(this).val(valWithoutCommas);
			});
			// 
			$('form[name=form1]').submit();
		}
	})
	$('button[name=update]').on('click', function() {
		var pno = $('input[name=p_no]').val()
		location.href = '/productUpdateForm?p_no=' + pno;
	});

	$('button[name=delete]').on('click', function() {
		var pno = $('input[name=p_no]').val()
		if (confirm('정말삭제하시겠습니까?'))
			location.href = '/productDelete?p_no=' + pno;
		else return false;
	});

	$('.pdetail').on('click', function() {
		var pno = $(this).closest('tr').find('input[name=p_no]').val();
		location.href = '/productDetail?p_no=' + pno;
	});

	$('.userdetail').on('click', function() {
		var p_no  = $(this).closest('a').find('input[name="p_no"]').val();
		var p_name= $(this).closest('a').find('input[name="p_name"]').val();
		var price = $(this).closest('a').find('input[name="price"]').val();
		var stock = $(this).closest('a').find('input[name="stock"]').val();
		var image = $(this).closest('a').find('input[name="image"]').val();

		var imageUrl = "/upload/" + image;
		//alert("안녕"+imageUrl);

		$('#quick-view-modal').find('.aa-product-view-content h3').text(p_name);
		$('#quick-view-modal').find('.aa-product-view-price').text('가격: ' + price);
		$('#quick-view-modal').find('.aa-product-avilability span').text(stock);
		$('#quick-view-modal').find('.simpleLens-lens-image img').attr('src',imageUrl);
	});

	$('.orderDetail').on('click', function() {
		var pno = $(this).closest('tr').find('input[name=p_no]').val();
		var memid = $(this).closest('tr').find('input[name=mem_id]').val();
		var ono = $(this).closest('tr').find('input[name=o_no]').val();
		//	alert(pno+"::"+memid+"::"+ono);
		$('form[name=form1] input[name=p_no]').val(pno);
		$('form[name=form1] input[name=mem_id]').val(memid);
		$('form[name=form1] input[name=o_no]').val(ono);
		$('form[name=form1]').submit();
	});


	$('.inNum').on('keyup change propertychange input paste', function() {
		var nlen = $('.inNum').length;
		for (var i = 0; i < nlen; i++) {
			var n = $('.inNum').eq(i).val().replace(/[^0-9,]/g, '');// (1)1,300,000
			var tmpn = n.replace(/[,]/g, '');	// (2)   1300000 제거함
			$('.inNum').eq(i).val(numberWithCommas(tmpn));
		}
	});

	$('.cartAdd').on('click', function() {
		var productItem = $(this).closest('.product-item');
        var productId = productItem.data('product-id');
        var productName = productItem.data('product-name');
        var productStock = productItem.data('product-stock');
        var productPrice = productItem.data('product-price');
        var productImage = productItem.data('product-image');
        var productQuantity = $('input[name=quantity]').val();
        var quantity = $('input[name=quantity]').val();
        if(quantity==null || quantity.length==0) quantity=1;
		if (quantity > productStock) {
			alert('재고가 부족합니다.')
			return false;
		  }
		  
        $('input[name=p_no]').val(productId)
        $('input[name=p_name]').val(productName)
        $('input[name=stock]').val(productStock)
        $('input[name=price]').val(productPrice)
        $('input[name=image]').val(productImage)
        $('input[name=quantity]').val(productQuantity)
       /* var quantity = $('input[name=quantity]').val();
		var q = $('input[name=quantity]').val();
		var s = $('input[name=stock]').val();*/
		$('form[name=form1]').submit();
	});
	
	//전체 선택을 하면 모두 참 해제하면 모두 해제
	$('#checkAll').on('click', function() {
		if ($('#checkAll').prop("checked") == true) {
			$('input[name=ck]').prop("checked", true);
		} else if ($('#checkAll').prop("checked") == false) {
			$('input[name=ck]').prop("checked", false);
		}
	});
	//전체가 다 체크그되면 전체채크가 참이고, 그중에 하나만이라도 취소하면 전체가 false
	$('input[name=ck]').on('click', function() {
		var l = $('input[name=ck]').length;
		if ($('input[name=ck]:checked').length == l) {
			$('#checkAll').prop("checked", true);
		} else {
			$('#checkAll').prop("checked", false);
		}
	});
	//수동으로 select 변경시 자동 check 
	$('select[name=state]').on('change', function() {
		var tr = $(this).parent().parent();
		var td = tr.children();
		tr.find(td).find("input[name=ck]").prop("checked", true);
	})

	$('.orderChange').on('click', function() {
		var tdArr = new Array(); //체크박스가 체크되어 있는 애들을 받기위해 td 배열
		//체크박스 값 가져오기(모두)
		var ckbox = $('input[name=ck]:checked');
		//한줄씩 꺼내서 값을 저장하기
		ckbox.each(function(i) {//i번째
			var tr = ckbox.parent().parent().eq(i);
			var th = tr.children();//모든 컬럼을 가져오기
			var pno = tr.find(th).find("input[name=p_no]").val();
			var ono = tr.find(th).find("input[name=o_no]").val();
			var memid = tr.find(th).find("input[name=mem_id]").val();
			var state = tr.find(th).find("select[name=state]").val();
			//가져온 값을 배열에 저장           
			tdArr.push("o_no:" + ono);
			tdArr.push("p_no:" + pno);
			tdArr.push("mem_id:" + memid);
			tdArr.push("state:" + state);
		})//each의 끝
		// 비동기통신(ajax)
		$.ajax({
			async: false,
			type: 'post',
			data: { tdArr },
			url: '/orderMgtProc',
			dataType: 'json',
			success: setInterval()/*콜백함수: 성공하면 처리되어야 할 일을 지정한 함수*/
		});
		//콜백함수 정의
		function setInterval() {
			//check박스 지우기
			alert('처리완료했습니다.')
			var tr = $("select[name='state']").parent().parent();
			var td = tr.children();
			tr.find(td).find("input[name=ck]").prop("checked", false);
		}
	})//orderChange의 끝

})//ready 끝
function numberWithCommas(num) {
	var parts = num.toString().split(".");
	return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		+ (parts[1] ? "." + parts[1] : "");
}

function validate() {
	var flen = $("form[name=form1] .chk").length;
	for (var i = 0; i < flen; i++) {
		if ($("form[name=form1] .chk").eq(i).val() == ""
			|| $("form[name=form1] .chk").eq(i).val() == null
			|| $("form[name=form1] .chk").eq(i).val().trim() == "") {
			alert($("form[name=form1] .chk").eq(i).attr('title') + '은/는 필수입력입니다.');
			$("form[name=form1] .chk").eq(i).focus();
			return false;
		}
	}
	return true;
}

function orderDetail(obj) {
	var ono = $(obj).closest('tr').find('input[name=o_no]').val();
	var pno = $(obj).closest('tr').find('input[name=p_no]').val();
	var memId = $(obj).closest('tr').find('input[name=mem_id]').val();
	$('form[name=form1] input[name=o_no]').val(ono);
	$('form[name=form1] input[name=p_no]').val(pno);
	$('form[name=form1] input[name=mem_id]').val(memId);
	$('form[name=form1]').submit();
}



