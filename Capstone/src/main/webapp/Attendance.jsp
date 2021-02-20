<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>출근부</title>

	<style type="text/css">
		body { margin: 10; }

		table { width: 100%; box-sizing: border-box; box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.1); font-family: 'Ubuntu'; /*border-collapse: collapse;*/ border-spacing: 0; background-color: #333333; }

		th, td { border: 1px solid rgba(255,255,255,0.1); box-sizing: border-box; }

		th { text-transform: uppercase; font-size:10px; font-weight:700; padding: 10px 0; color: rgba(255,255,255,0.5); background-color: #292929; letter-spacing: 1px; }

		td { width: 14.285%; transition: all 0.3s; font-size: 14px; color: rgba(255,255,255,0.6); font-weight: 400; font-size: 14px; padding: 1.5% 1.5% 5%; vertical-align: initial; padding: 1.5% 0 ; height: 75px; }

		.day:hover { background-color: rgba(0,0,0,0.1); cursor:pointer; }

		.today { color: #FFF; background-color: rgba(0,0,0,.25) !important; }

		span.number { margin-left: 10% }

		span.event { height: 4px; background-color: rgba(0,0,0,.3); display: block; margin: 5px 10%; border-radius: 2px; background-color: #91c33b; }

		span.event-multiday { margin: 5px -2px; border-radius: 0; }
		span.event-multiday-start { margin-right: -4px;  }
		span.event-multiday-finish { margin-left: -4px;  }

		span.event-ghost { background-color:transparent; }
	</style>
	
	
	
</head>
<body bgcolor="#A4A4A4">
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
	
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700' rel='stylesheet' type='text/css'>

	<style>
		.graph-cont{
  width: calc(100% - 40px);
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
}
.bar23{
  height: 30px;
  max-width: 800px;
  margin: 0 auto 10px auto;
  line-height: 30px;
  font-size: 16px;
  color: white;
  padding: 0 0 0 10px;
  position: relative;
}

.bar23::before{
  content:'';
  width: 100%;
  position: absolute;
  left: 0;
  height: 30px;
  top: 0;
  z-index: 0;
  background: #ecf0f1;
}
.bar23::after{
  content: '';
  background: #2ecc71;
  height: 30px;
  transition: 0.7s;
  display: block;
  width: 100%;
  -webkit-animation: bar-before 1 1.8s;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 0;
}
.bar1::after{
  max-width: 60%;
}
.bar2::after{
  max-width: 72%;
}
.bar3::after{
  max-width: 47%;
}
.bar4::after{
  max-width: 20%;
}
@-webkit-keyframes bar-before{
  0%{
    width: 0px;
  }
  100%{
    width: 100%;
  }
}

.how-cont{
  width: calc(100% - 40px);
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
}
code {
  padding: 5px;
  background: #ecf0f1;
  display: block;
}
pre{
  padding: 0;
  margin: 0;
}
	</style>
<table>
	<h3> ${Session_User} 님의 출근부</h3>
  <tr>
    <th class="day-name">Sun</th>
    <th class="day-name">Mon</th>
    <th class="day-name">Tue</th>
    <th class="day-name">Wed</th>
    <th class="day-name">Thu</th>
    <th class="day-name">Fri</th>
    <th class="day-name">Sat</th>
  </tr>
  <tr>
  	<!-- 
  		 <span class="event"></span>
  	
  		 <span class="event event-multiday-start"></span>
  		 <span class="event event-multiday"></span>
  		 <span class="event event-multiday-finish"></span>
  		 
  		 <span class="event event-multiday-start eventclass" style="background-color:#5a9ab2;"></span>
  		 <span class="event event-multiday eventclass" style="background-color:#5a9ab2;"></span>
  		 <span class="event event-multiday-finish eventclass" style="background-color:#5a9ab2;"></span>
  		 
  		 <td class="day today">
  	  -->
    <td class="day${today_31_bf}"><span class="number">31</span>${At_day31_bf}</td>
    <td class="day${today_1}"><span class="number">1</span></td>
    <td class="day${today_2}"><span class="number">2</span></td>
    <td class="day${today_3}"><span class="number">3</span></td>
    <td class="day${today_4}"><span class="number">4</span></td>
    <td class="day${today_5}"><span class="number">5</span></td>
    <td class="day${today_6}"><span class="number">6</span></td>
  </tr>
  <tr>
    <td class="day${today_7}"><span class="number">7</span></td>
    <td class="day${today_8}"><span class="number">8</span></td>
    <td class="day${today_9}"><span class="number">9</span></td>
    <td class="day${today_10}"><span class="number">10</span></td>
    <td class="day${today_11}"><span class="number">11</span></td>
    <td class="day${today_12}"><span class="number">12</span></td>
    <td class="day${today_13}"><span class="number">13</span></td>
  </tr>
  <tr>
    <td class="day${today_14}"><span class="number">14</span></td>
    <td class="day${today_15}"><span class="number">15</span></td>
    <td class="day${today_16}"><span class="number">16</span></td>
    <td class="day${today_17}"><span class="number">17</span></td>
    <td class="day${today_18}"><span class="number">18</span></td>
    <td class="day${today_19}"><span class="number">19</span></td>
    <td class="day${today_20}"><span class="number">20</span></td>
  </tr>
  <tr>
    <td class="day${today_21}"><span class="number">21</span></td>
    <td class="day${today_22}"><span class="number">22</span></td>
    <td class="day${today_23}"><span class="number">23</span></td>
    <td class="day${today_24}"><span class="number">24</span></td>
    <td class="day${today_25}"><span class="number">25</span></td>
    <td class="day${today_26}"><span class="number">26</span></td>
    <td class="day${today_27}"><span class="number">27</span></td>
  </tr>
  <tr>
    <td class="day${today_28}"><span class="number">28</span></td>
    <td class="day${today_29}"><span class="number">29</span></td>
    <td class="day${today_30}"><span class="number">30</span></td>
    <td class="day${today_31}"><span class="number">31</span></td>
  </tr>
 
</table>
	<br>
	<br>
	<br>
	<div class="graph-cont">
  		A<div class="bar23 bar1"> </div>
  		B<div class="bar23 bar2"> </div>
  		C<div class="bar23 bar3"> </div>
 	 	D<div class="bar23 bar4"> </div>
	</div>

</body>
</html>