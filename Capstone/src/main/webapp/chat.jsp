<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä�� ���� ������</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

	function sendMessage(form){

			// ���� ��ȿ�� �˻�
			form.body.value = form.body.value.trim();

			if(form.body.value.length == 0) {

				alert('�޽��� ������ �Է��ϼ���');
				form.body.focus();
				return false;
					
			}

			// AJAX -> doAddMessage ���� �� ��°� ��������
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
	
	<h1> ü�� �޽��� �Է� </h1>

	<!--  ��� �Է���, Submit Ŭ���� JS�Լ� ���� -->
	<form onsubmit="sendMessage(this); return false;"> 
		${Session_User}
		<input type="text" name="msg" placeholder="����">
		<input type="submit" value="����">
	</form>
	
</body>
</html>