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
	
	
	
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['날짜', '매출액(%)'],
          ['${day_data1}',  ${sales_data1}],
          ['${day_data2}',  ${sales_data2}],
          ['${day_data3}',  ${sales_data3}],
          ['${day_data4}',  ${sales_data4}]
        ]);

        var options = {
          title: '가계부 통계',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
	
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
    <td class="day"><span class="number">31</span></td>
    <td class="day"><span class="number">1</span><span class="event"></span><span class="event"></span></td>
    <td class="day"><span class="number">2</span></td>
    <td class="day"><span class="number">3</span><span class="event event-multiday-start"></span></td>
    <td class="day"><span class="number">4</span><span class="event event-multiday"></span><span class="event event-multiday-start eventclass" style="background-color:#5a9ab2;"></span><span class="event"></td>
    <td class="day"><span class="number">5</span><span class="event event-multiday-finish"></span><span class="event event-multiday eventclass" style="background-color:#5a9ab2;"></span></td>
    <td class="day"><span class="number">6</span><span class="event event-ghost"></span><span class="event event-multiday-finish eventclass" style="background-color:#5a9ab2;"></span></td>
  </tr>
  <tr>
    <td class="day"><span class="number">7</span></td>
    <td class="day"><span class="number">8</span><span class="event"></span></td>
    <td class="day"><span class="number">9</span></td>
    <td class="day"><span class="number">10</span></td>
    <td class="day"><span class="number">11</span></td>
    <td class="day"><span class="number">12</span></td>
    <td class="day"><span class="number">13</span></td>
  </tr>
  <tr>
    <td class="day"><span class="number">14</span></td>
    <td class="day"><span class="number">15</span></td>
    <td class="day"><span class="number">16</span><span class="event"></span></td>
    <td class="day"><span class="number">17</span><span class="event"></span></td>
    <td class="day"><span class="number">18</span></td>
    <td class="day"><span class="number">19</span></td>
    <td class="day"><span class="number">20</span></td>
  </tr>
  <tr>
    <td class="day"><span class="number">21</span></td>
    <td class="day"><span class="number">22</span></td>
    <td class="day"><span class="number">23</span></td>
    <td class="day"><span class="number">24</span></td>
    <td class="day"><span class="number">25</span></td>
    <td class="day"><span class="number">26</span></td>
    <td class="day"><span class="number">27</span><span class="event event-multiday-start" style="background-color:#da5f5f;"></td>
  </tr>
  <tr>
    <td class="day"><span class="number">28</span><span class="event event-multiday" style="background-color:#da5f5f;"></td>
    <td class="day today"><span class="number">29</span><span class="event event-multiday-finish" style="background-color:#da5f5f;"></td>
    <td class="day"><span class="number">30</span></td>
    <td class="day"><span class="number">1</span></td>
    <td class="day"><span class="number">2</span></td>
    <td class="day"><span class="number">3</span></td>
    <td class="day"><span class="number">4</span></td>
  </tr>
  <tr>
    <td class="day"><span class="number">5</span></td>
    <td class="day"><span class="number">6</span><span class="event"></span></td>
    <td class="day"><span class="number">7</span></td>
    <td class="day"><span class="number">8</span></td>
    <td class="day"><span class="number">9</span></td>
    <td class="day"><span class="number">10</span></td>
    <td class="day"><span class="number">11</span></td>
  </tr>
</table>
	<div id="curve_chart" style="width: 1700px; height: 500px"></div>
</body>
</html>