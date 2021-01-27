<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="Index_Asset/css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="Index_Asset/css/login.css">
  <title>광성 로그인</title>
  
</head>

<body>
  <div class="main">
  
    <p class="sign" align="center">로 그 인</p>
    <p align="center">${fail_message}</p>
    <form class="form1" method="post" action="login.do">
      <input class="un "  name="ID" id="ID" type="text" placeholder="ID"/>
      <input class="pass" name="Password" id="Password" type="password" placeholder="Password"/>
      <input type="submit" value="Login" class="submit" />
      <p class="forgot" align="center"><a href="./Create_Account.do">계정생성 요청</p>
    </form>        
                
    </div>
     
</body>

</html>