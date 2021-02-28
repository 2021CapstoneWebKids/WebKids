<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅 메인 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

	function sendMessage(form){

			// 내용 유효성 검사
			form.body.value = form.body.value.trim();

			if(form.body.value.length == 0) {

				alert('메시지 내용을 입력하세요');
				form.body.focus();
				return false;
					
			}

			// AJAX -> doAddMessage 실행 및 출력값 가져오기
			$.post('./doAddMessage',{
				writer : form.writer.value,
				body : form.body.value
			}, function(data) {
				
			},'json');
			
			form.body.value = '';
			form.body.focus();

		}

	

		var Chat__lastReceivedMessageId = -1;
		function Chat__loadNewMessages() {
			$.get('./getMessages',{
				
				from : Chat__lastReceivedMessageId + 1
			
			}, function(data) {
				for ( var i = 0; i < data.length; i++ ) {
					var message = data[i];
					Chat__lastReceivedMessageId = message.id;
					Chat__drawMessages(message);
				}
				setTimeout(Chat__loadNewMessages,100);
				
			}, 'json');
		
		}
		
		function Chat__drawMessages(message) {
			var html = '[' +message.id + '] (' + message.writer + ') : ' + message.body;
			$('.chat-list').prepend('<div>' + html + '</div>')
		}
		
		$(function() {
			Chat__loadNewMessages();
			
		});
	
</script>
</head>
<body>
	
	<h1> 체팅 메시지 입력 </h1>

	<!--  양식 입력후, Submit 클릭시 JS함수 실행 -->
	<form onsubmit="sendMessage(this); return false;"> 
		${Session_User}
		<input type="text" name="msg" placeholder="내용">
		<input type="submit" value="전송">
	</form>
	
</body>
</html>