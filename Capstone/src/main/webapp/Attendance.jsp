<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>출근부</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="Index_Asset/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="Index_Asset/assets/css/noscript.css" /></noscript>
	<script type="text/javascript">
    function showClock()
    {
        var currentDate=new Date();
        var divClock=document.getElementById("divClock");
        var apm=currentDate.getHours();
        if(apm<12)
        {
            apm="오전";
        }
        else
        {
            apm="오후";
        }
        
        var msg = "현재시간 : "+apm +(currentDate.getHours())+"시";
        msg += currentDate.getMinutes() + "분";
        msg += currentDate.getSeconds() + "초";
        
        divClock.innerText=msg;
        
        setTimeout(showClock,1000);
    }
	</script>
</head>
<body>
	<%
 		String strReferer = request.getHeader("referer");
 	
 		if(strReferer == null){
		%>
 		<script language="javascript">
  		alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
  		document.location.href="./Main_Login.jsp";
 		</script>
		<%
 		 return;
 		}
	%>
	
	<h3>${Session_User}님</h3>
	<h4> 현재시각   </h4>
	<div id="divClock" class="clock"></div>
	
</body>
</html>