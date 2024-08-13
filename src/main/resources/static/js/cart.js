/**
 * 
 */
$(document).ready(function() {
/*    $('.upQuantity').on('click propertychange change input paste', function() {
        // 현재 클릭된 요소의 행과 열 인덱스를 가져옵니다.
        var $currentRow = $(this).closest('tr');
        var cellIndex = $(this).closest('td').index(); // 현재 셀의 인덱스

        // 가격과 수량을 가져옵니다.
        var price = $currentRow.find("td:eq(" + (cellIndex - 1) + ")").find("input[name=price]").val();
        var tmpn = price.replace(/[,]/g, '');
        var quantity = $(this).closest('td').find("input").val();
        
        // 가격과 수량을 곱하여 결과를 계산합니다.
        var total = parseInt(tmpn) * parseInt(quantity);
        // 계산된 결과를 다음 셀에 설정합니다.
        $currentRow.find("td:eq(" + (cellIndex + 1) + ")").find("input").val(total);
    });*/
   
});

function cartUpdate(f, obj) {
	var url1;
	var quantity = $(obj).closest('tr').find('input[name=quantity]').val();
	var price = $(obj).closest('tr').find('input[name=price]').val();
	var pno = $(obj).closest('tr').find('input[name=p_no]').val();
	var stock = $(obj).closest('tr').find('input[name=stock]').val();
	var q = quantity.replace(/[,]/g, '')
	var p = price.replace(/[,]/g, '')
	var s = stock.replace(/[,]/g, '')
	if (f == 'D') {
		url1 = 'cartProc?flag=delete'
		$(obj).closest('tr').remove();
	} else if (f == 'U') {
		if (parseInt(q) > parseInt(s)) {
			alert('재고가 부족합니다.')
			return false;
		}
		var a = parseInt(q) * parseInt(p);
		$(obj).closest('tr').find('input[name=amount]').val(numberWithCommas(a));
		url1 = 'cartProc?flag=update';
	}
	$.ajax({
		async: true,
		type: 'post',
		data: {
			"quantity": q,
			"amount": a,
			"price": p,
			"p_no": pno
		},
		url: url1,
		dataType: "json",
		success: msgAler()
	});
	/*function msgAler() {
		alert('처리완료하였습니다.');
	}*/
}





