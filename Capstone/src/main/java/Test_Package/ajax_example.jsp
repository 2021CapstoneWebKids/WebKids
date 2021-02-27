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
<p><button onclick="ajaxMap();">ajaxMap[PUT, @RequestBody�� ������ ���]</button></p>
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
	        //url       : 'list?username=kdevkr&password=kdevpass', // GET ��û�� �����Ͱ� URL �Ķ���ͷ� ���ԵǾ� ���۵˴ϴ�.
	        async   : 'true', // true
	        data    : dataSet, // GET ��û�� �������� �ʽ��ϴ�.
	        processData : true, // GET ��û�� �����Ͱ� �ٵ� ���ԵǴ� ���� �ƴϱ� ������ URL�� �Ķ���� �������� �߰��ؼ� �������ݴϴ�.
	        contentType : 'application/json', // List ��Ʈ�ѷ��� application/json �������θ� ó���ϱ� ������ ����Ʈ Ÿ���� �����ؾ� �մϴ�.
	        //dataType  : [���� ������ ����], // ������� ���� ��� �ڵ����� ����
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
        url     : 'map', // PUT ��û�� �����Ͱ� ��û �ٵ� ���Ե˴ϴ�.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [���� ������ ����], // ������� ���� ��� �ڵ����� ����
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
        url     : 'entity', // POST ��û�� �����Ͱ� ��û �ٵ� ���Ե˴ϴ�.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [���� ������ ����], // ������� ���� ��� �ڵ����� ����
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
        url     : 'entity_nobody', // POST ��û�� �����Ͱ� ��û �ٵ� ���Ե˴ϴ�.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [���� ������ ����], // ������� ���� ��� �ڵ����� ����
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
        url     : 'entity_nobody_param?param=kdevkr@gmail.com', // POST ��û�� �����Ͱ� ��û �ٵ� ���Ե˴ϴ�.
        async   : 'true', // true
        data    : JSON.stringify(dataSet),
        contentType : 'application/json',
        //dataType  : [���� ������ ����], // ������� ���� ��� �ڵ����� ����
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