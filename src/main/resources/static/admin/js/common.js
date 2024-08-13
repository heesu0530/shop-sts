String.prototype.replaceAll = function (regex, replacement) {
	return this.split(regex).join(replacement);
}

String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

Array.prototype.indexOf = function (item, from) {
	var len = this.length;
	for (var i = (from < 0) ? Math.max(0, len + from) : from || 0; i < len; i++) {
		if (this[i] === item) return i;
	}
	return -1;
}

function $id(id) {

	return document.getElementById(id);

}

function submit_msg( id ) {

	if (!id) id = regi_area;
	
	if ($("#" + id).length > 0) {

		$("#" + id).children().css("visibility", "hidden");
		$("#" + id).append("<span>등록중입니다. 잠시만 기다려주세요...</span>");

	}

}
	

function list_check(seq, option_name) {

	var option = this[option_name];
	var seq_name = option.seq_name;		//시퀀스 명
	var page = option.page;						//페이지 번호

	//검색 항목 설정
	var search_arr = [];
	for (var key in option.search) {

		search_arr.push(key + "=" + option.search[key]);

	}
	var search_str = search_arr.join("&");
	if (search_str.trim()) {

		search_str = "&" + search_str;

	}

	var browser = navigator.userAgent.toLowerCase();
	
	if (-1 != browser.indexOf('msie')) {
		seq = seq.replace("&reg", "&amp;reg");
	} else if (-1 != browser.indexOf('rv')) {
		seq = seq.replace("&reg", "&amp;reg");
	}
	location.href = option.read_url + "?" + seq_name + "=" + seq + "&page=" + page + search_str;

}

function check_restr(restr, id) { //제한타입, id

    var num = /[0123456789]/;   //숫자
    var han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;  //한글
    var re = /[~!@\#$%<>^&*\-=+_\',.`";:<>/?\[\]\-\+_=|\\]/gi;   //특수문자
    var eng = /[abcdefghijklmnopqrstuvwxyz]/;   //영어

    var check_num = "num";
    var check_han = "han";
    var check_re = "re";
    var check_eng = "eng";

    if (restr == check_num) {    //숫자제한

        var obj = $("#" + id).val();

        if (num.test(obj)) {

        return true;

        }



    }

    if (restr == check_han) {    //한글제한

        var obj = $("#" + id).val();

        if (han.test(obj)) {

        return true;

        }


    }

    if (restr == "re") {     //특수문자제한

        var obj = $("#" + id).val();

        if (re.test(obj)) {

        return true;

        }


    }

    if (restr == check_eng) {    //영어제한

        var obj = $("#" + id).val();

        if (eng.test(obj)) {

        return true;

        }

    }

}

function send_check(page_name, del_chk) {

	var del_str = "";
	if (del_chk == true) {

	  del_str = "page_gubun=DELETE&";
		if (!confirm("정말 삭제하시겠습니까?")) return;

	}

	var now_url = location.href;
	var sp_url = "";
	var qstr = "";
	if (now_url.indexOf("?") != -1) {

		sp_url = now_url.split("?")[0];
		qstr = "?" + del_str + now_url.split("?")[1];

	} else {

		sp_url = now_url + "?" + del_str;

	}

	var sp_url_arr = sp_url.split("/");
	sp_url_arr[sp_url_arr.length - 1] = page_name;

	location.href = sp_url_arr.join("/") + qstr;

}

function send_check_change(page_name, del_chk) {

  var del_str = "";
  if (del_chk == true) {

    del_str = "page_gubun=CHANGE&";
    if (!confirm("정말 변경하시겠습니까?")) return;

  }

  var now_url = location.href;
  var sp_url = "";
  var qstr = "";
  if (now_url.indexOf("?") != -1) {

    sp_url = now_url.split("?")[0];
    qstr = "?" + del_str + now_url.split("?")[1];

  } else {

    sp_url = now_url + "?" + del_str;

  }

  var sp_url_arr = sp_url.split("/");
  sp_url_arr[sp_url_arr.length - 1] = page_name;

  location.href = sp_url_arr.join("/") + qstr;

}

$(document).ready(function () {
	$(".notHangul").keyup(function (event) {
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
		}
	});

});

function onlyNumber() {
	if (!((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode == 8) || (event.keyCode == 9) || (event.keyCode == 110) || (event.keyCode == 190))) {
		if (event.preventDefault) {
			event.preventDefault();
		} else {
			event.returnValue = false;
		}
	}
}

$(document).ready(function () {
	$(".onlyNumber").on("keyup", function (event) {
		if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9.]/gi, ''));
		}
	});
});

//체크 박스 체크
function comm_all_check(oThis, chk_name) {

  $(":checkbox[name='" + chk_name + "']").prop("checked", oThis.checked);

}