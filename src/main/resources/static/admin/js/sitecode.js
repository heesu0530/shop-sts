var siteCode = {

  select: function (oThis, pt_code, depth) {

    //선택버튼이 존재한다면,
    if (oThis != null) {

      //해당 테이블 내의 아이콘을 정상화 한다.
      $("#sitecode_" + (Number(depth) - 1) + " .select_icon").each(function (idx, obj) {
        $(obj).attr("src", "/images/sub_common/icon_accept.gif");
      });

      //해당 버튼만 아이콘을 변경한다.
      $(oThis).find("img").attr("src", "/images/sub_common/action_forward.gif");

    }

    //마지막 Depth일때
    if (Number(depth) == 4) {

      return;

    } else {

      //하위 테이블 초기화
      var real_depth = Number(depth) - 1;
      for (var i = 3, j = real_depth; i > j; i--) {

        $("#sitecode_" + i).attr("pt_code", "");
        $("#sitecode_" + i + " tbody").html("");

      }

      //해당 테이블에 코드 설정
      $("#sitecode_" + depth).attr("pt_code", pt_code);

      //조회 Ajax
      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "./site_code.aspx/Select",
        data: "{ 'pt_code': '" + pt_code + "', 'depth': '" + depth + "' }",
        success: function (data) {

          siteCode.selectResult(data, depth);

        },
        error: function (request, status, error) {

          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

        }
      });

    }

  },

  selectResult: function (data, depth) {

    //선택시 다음 Table에 값을 할당하기 위해 +1을 해준다.
    var select_depth = depth + 1;

    //TR html
    var html = "<tr code='{CODE}'>";
    html += "<td class='tx_a_left'><span onclick='siteCode.modifyClick( this );'>{CODE_NAME}</span></td>";		                                                //코드명

    if (depth == 3) {
      html += "<td><img src='/images/sub_common/cog.gif' alt='설정' onclick='FrameLayer.open( \"./regiForm.aspx?code={CODE}\", 500, 580, \"no\" );' /></td>";	//설정
    }

    html += "<td><img src='/images/sub_common/action_stop.gif' onclick='siteCode.remove( this );' alt='삭제' /></td>";											                  //삭제
    html += "<td onclick='siteCode.select( this, \"{CODE}\"," + select_depth + " );'><img src='/images/sub_common/icon_accept.gif' class='select_icon' alt='선택' /></td>";	 //선택
    html += "</tr>";

    var data_arr = $.parseJSON(data.d);
    var cache_html = "";
    for (var i = 0, j = data_arr.length; i < j; i++) {

      var json = data_arr[i];
      var new_html = html.replace("{CODE_NAME}", json.code_name).replace(/{CODE}/gi, json.code); //replaceAll 사용하기 (replace(/{CODE}/gi,)
      cache_html += new_html;

    }

    //콘솔
    //console.log(cache_html);
    //console.log(depth);

    //해당 테이블에 Append한다.
    $("#sitecode_" + depth + " tbody").append(cache_html);

  },

  add: function (oThis) {

    var table = $(oThis).parents("table");							//테이블 개체
    var depth = Number(table.attr("id").split('_')[1]);	//단계 // _사이로 sitecode_1인 sitecode과 1을 _빼고 DB에 저장
    var code_name = oThis.value;											  //코드 명
    var pt_code = table.attr("pt_code");								//상위 코드

    console.log("sdfsdf");

    //유효성
    if (!pt_code.trim()) {

      alert("상위메뉴를 선택해주세요.");
      return;

    }

    if (!code_name.trim()) {

      alert("코드를 입력해주세요.");
      return;

    }

    console.log("{ 'code_name': '" + code_name + "', 'pt_code': '" + pt_code + "', 'depth': '" + depth + "' }");

    //등록 Ajax
    $.ajax({
      type: "POST",
      contentType: "application/json; charset=utf-8",
      url: "./site_code.aspx/Add",
      data: "{ 'code_name': '" + code_name + "', 'pt_code': '" + pt_code + "', 'depth': '" + depth + "' }",
      success: function (data) {
        siteCode.selectResult(data, depth);
      },
      error: function (request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      }
    });

    //input을 text로 변경
    oThis.blur();

  },

  addClick: function (oThis) {

    var input_html = "<input type='text' htip='Enter키: 등록, ESC키: 취소' onkeydown='siteCode.keyCheck( event, \"add\" )' /> ";
    var txt_html = "<span onclick='siteCode.addClick( this );'>이곳을 클릭하여 새로운 코드를 등록하세요.</span>";

    //Add
    $(oThis).parent().html(input_html).find("input").eq(0).
      htip("show").
      focus().
      bind("blur", function (evt) {

        //텍스트 처리
        var td = $(evt.currentTarget).parent();
        $(td).html(txt_html);

      });

  },

  remove: function (oThis) {

    if (!confirm("정말 삭제하시겠습니까?")) return;

    var tr = $(oThis).parents("tr");
    var code = tr.attr("code");


    //삭제 Ajax
    $.ajax({
      type: "POST",
      contentType: "application/json; charset=utf-8",
      url: "./site_code.aspx/Remove",
      data: "{ 'code': '" + code + "' }",
      success: function (data) {

        //선택 유무
        var choice = (tr.find("td:last img").eq(0).attr("src").indexOf("icon_accept") == -1) ? "Y" : "N";

        //하위 테이블 초기화
        if (choice == "Y") {

          //하위 테이블 초기화
          var depth = Number(tr.parents("table").attr("id").split("_")[1]);
          for (var i = 3, j = depth; i > j; i--) {

            $("#sitecode_" + i).attr("pt_code", "");
            $("#sitecode_" + i + " tbody").html("");

          }

        }

        //TR삭제						
        tr.remove();

      },
      error: function (request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      }
    });

  },

  modifyClick: function (oThis) {

    var tr = $(oThis).parents("tr"); //Tr 개체
    var code = tr.attr("code");			 //코드
    var code_name = $(oThis).text(); //코드 명

    //TD html
    var html = "<td class='bd_line_right bd_line_left' colspan='4'>";
    html += "<input type='text' htip='Enter키: 수정, ESC키: 취소' onkeydown='siteCode.keyCheck( event, \"modify\" )' value='" + code_name + "' />";
    html += "</td>";

    //해당 TR선택 유무
    var choice = (tr.find("td:last img").eq(0).attr("src").indexOf("icon_accept") == -1) ? "Y" : "N";
    tr.attr("choice", choice);

    //TD변경
    tr.html(html).find("input").eq(0).
      htip("show").
      focus().
      bind("blur", function (evt) {

        var data = { "d": { "code": code, "code_name": code_name } };
        var input = evt.currentTarget;

        siteCode.modifyResult(input, data);

      });

  },

  modify: function (oThis) {

    var tr = $(oThis).parents("tr"); //Tr 개체
    var code = tr.attr("code");			 //코드
    var code_name = oThis.value;		 //코드 명

    if (!code_name) {

      alert("수정할 코드명을 입력해주세요.");
      return;

    }

    //수정 Ajax
    $.ajax({
      type: "POST",
      contentType: "application/json; charset=utf-8",
      url: "./site_code.aspx/Modify",
      data: "{ 'code': '" + code + "', 'code_name': '" + code_name + "' }",
      success: function (data) { siteCode.modifyResult(oThis, data); },
      error: function (request, status, error) {
        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      }
    });

  },

  modifyResult: function (oThis, data) {

    var tr = $(oThis).parents("tr");						//Tr 개체
    var table = $(tr).parents("table");					//Table 개체
    var depth = table.attr("id").split("_")[1];	//Depth
    var select_depth = Number(depth) + 1;				//선택되었을때 전달할 Depth
    var choice = tr.attr("choice");							//선택 유무
    var icon_src = (choice == "Y") ? "action_forward" : "icon_accept";
    tr.removeAttr("choice");

    var json = null;
    if ($.type(data.d) == "string") json = $.parseJSON(data.d);
    else json = data.d;

    //TR html
    var html = "<td class='tx_a_left'><span onclick='siteCode.modifyClick( this );'>{CODE_NAME}</span></td>";				                                          //코드명

    if (depth == 3) {
      html += "<td><img src='/images/sub_common/cog.gif' alt='설정' onclick='FrameLayer.open( \"./regiForm.aspx?code={CODE}\", 500, 580, \"no\" );' /></td>";	//설정
    }

    html += "<td><img src='/images/sub_common/action_stop.gif' onclick='siteCode.remove( this );' alt='삭제' /></td>";				                                //삭제
    html += "<td onclick='siteCode.select( this, \"{CODE}\", {DEPTH} );'><img src='/images/sub_common/" + icon_src + ".gif' class='select_icon' alt='선택' /></td>";	  //선택

    //html replace
    var new_html = html.replace("{CODE_NAME}", json.code_name).replaceAll("{CODE}", json.code).replace("{DEPTH}", select_depth);

    //html 변경
    tr.html(new_html);

  },

  keyCheck: function (evt, type) {

    var keyCode = evt.keyCode; //$(evt).keyCode();
    var target = evt.currentTarget || evt.target || evt.srcElement;
            
    if (keyCode == "13") {

      console.log("1111");

      //ToolTip 사라지기
      $(target).htip("hide");

      //등록
      if (type == "add") {

        siteCode.add(target);

        //수정
      } else if (type == "modify") {

        siteCode.modify(target);

      }

    } else if (keyCode == "27") {

      //취소
      target.blur();

    }

  },

  move: function (type, depth) {

    $("#sitecode_" + depth + " img.select_icon").each(function (idx, obj) {

      if ($(obj).attr("src").indexOf("icon_accept") == -1) {

        //Up
        if (type == "up") siteCode.up(obj, depth);

        //Down
        else siteCode.down(obj, depth);

      }

    });

  },

  up: function (obj, depth) {

    var tr = $(obj).parents("tr");
    if (tr.index() == 0) {

      alert("더이상, 상단으로 이동할 수 없습니다.");

    } else {

      var code = tr.attr("code");

      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "./site_code.aspx/Move",
        data: "{ 'code': '" + code + "', 'depth': '" + depth + "', 'type': 'up' }",
        success: function () {

          tr.insertBefore(tr.prev());

        },
        error: function (request, status, error) {
          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
      });

    }

  },

  down: function (obj, depth) {

    var tr = $(obj).parents("tr");
    var table = $(tr).parents("table");
    var rowLength = $(table).rowLength();

    if (tr.index() >= rowLength - 3) {

      alert("더이상, 하단으로 이동할 수 없습니다.");

    } else {

      var code = tr.attr("code");

      $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "./site_code.aspx/Move",
        data: "{ 'code': '" + code + "', 'depth': '" + depth + "', 'type': 'down' }",
        success: function () {

          tr.insertAfter(tr.next());

        },
        error: function (request, status, error) {
          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
      });

    }

  }
   
}