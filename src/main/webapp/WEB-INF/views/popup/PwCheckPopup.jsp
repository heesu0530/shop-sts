<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=400, height=200, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/common.js"></script>
    <style>
        body.popupBody {
            margin: 10;
            width: 600px;
            height: 200px;
            overflow: hidden;  
            box-sizing: border-box; 
        }
        
        table.popupTable{
        margin: 0 auto;
        width: 500px;
        height: 190px;
/*         border: 1px solid #eeeeee; */
        border-collapse: collapse;
        }
        table.popupTable tr, td, th{
/*         border: 1px solid #eeeeee; */
        border-collapse: collapse;
        font-style: 20px;
        }
        table.popupTable .col1{
          width: 30%;
          padding: 5px;
        }
    </style>
    <title>비밀번호 확인</title>
</head>
<body class="popupBody">
    <form name="popForm" >
      <table class="popupTable">
          <tr>
             <th class="form-lavel" 
                style="text-align: right;padding-right: 10px;">비밀번호 입력</th>
             <td><input type="password" class="form-control" id="pwck"></td>
          </tr>
          <tr>
             <td colspan="2" style="text-align: center">
             <input type="button" class="btn btn btn-outline-primary pwck" value="학인" >
             <input type="button" class="btn btn btn-outline-secondary"
              style="margin-left: 20px;" value="닫기"
               onclick="window.close();">
             </td>
          </tr>
      </table>
    </form>
</body>
</html>




