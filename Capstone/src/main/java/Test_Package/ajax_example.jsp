<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1>Spring Demo Ajax - Test Case</h1>


<p><button onclick="ajaxList();">ajaxList[GET]</button></p>
<p><button onclick="ajaxMap();">ajaxMap[PUT, @RequestBody를 지정할 경우]</button></p>
<p><button onclick="ajaxEntity();">ajaxEntity[POST, ResponseEntity]</button></p>
<p><button onclick="ajaxEntityNobody();">ajaxEntityNobody[POST, ResponseEntity]</button></p>
<p><button onclick="ajaxEntityNobodyParam();">ajaxEntityNobodyParam[POST, ResponseEntity+Param]</button></p>

<p></p>

<div>
<h3>Response-</h3>
<div id="response-panel"></div>
</div>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var _response = $('#response-panel');
function ajaxList(){
	var dataSet = new Object();
	dataSet.username = "kdevkr";
	dataSet.password = "kdevpass";
	    $.ajax({
	        type    : 'GET', // method
	        url     : 'list',
	        //url       : 'list?username=kdevkr&password=kdevpass', // GET 요청은 데이터가 URL 파라미터로 포함되어 전송됩니다.
	        async   : 'true', // true
	        data    : dataSet, // GET 요청은 지원되지 않습니다.
	        processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로 추가해서 전송해줍니다.
	        contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
	        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
	        success : function(data, status, xhr){
	        	responseJson(data);
	        },
	        error   : function(error){
	            console.log("error", error);
	            responseError(error);
	        }
	        });
	}
function ajaxMap(){
    var dataSet = new Object();
    dataSet.username = "kdevkr";
    dataSet.password = "kdevpass";
    $.ajax({
        type    : 'PUT', // method
        url     : 'map', // PUT 요청은 데이터가 요청 바디에 포함됩니다.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	responseJson(data);
        },
        error   : function(error){
            console.log("error", error);
            responseError(error);
        }
        });
}
function ajaxEntity(){
    var dataSet = new Object();
    dataSet.username = "kdevkr";
    dataSet.password = "kdevpass";
    $.ajax({
        type    : 'POST', // method
        url     : 'entity', // POST 요청은 데이터가 요청 바디에 포함됩니다.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	responseJson(data);
        },
        error   : function(error){
            console.log("error", error);
            responseError(error);
        }
        });
}
function ajaxEntityNobody(){
    var dataSet = new Object();
    dataSet.username = "kdevkr";
    dataSet.password = "kdevpass";
    $.ajax({
        type    : 'POST', // method
        url     : 'entity_nobody', // POST 요청은 데이터가 요청 바디에 포함됩니다.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	responseJson(data);
        },
        error   : function(error){
            console.log("error", error);
            responseError(error);
        }
        });
}
function ajaxEntityNobodyParam(){
    var dataSet = new Object();
    dataSet.username = "kdevkr";
    dataSet.password = "kdevpass";
    $.ajax({
        type    : 'POST', // method
        url     : 'entity_nobody_param?param=kdevkr@gmail.com', // POST 요청은 데이터가 요청 바디에 포함됩니다.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
        success : function(data, status, xhr){
        	responseJson(data);
        },
        error   : function(error){
            console.log("error", error);
            responseError(error);
        }
        });
}

function convertJson(data){
	return JSON.stringify(data, true, 2);
}

function responseJson(data){
	_response.html(convertJson(data));
}

function responseError(data){
	_response.html(data.responseText);
}
</script>
</body>
</html>
</html>