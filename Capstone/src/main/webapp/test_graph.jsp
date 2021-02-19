<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<style>
	
		@import url(https://fonts.googleapis.com/css?family=Raleway:400,200);
* {
		box-sizing: border-box;
		font-family: 'Raleway', sans-serif;
}

html,
body {
		position: relative;
		float: left;
		margin: 0;
		width: 100%;
		height: 100%;
}

h1 {
		position: relative;
		float: relative;
		margin: 30px 0 20px 0;
		text-align: center;
		width: 100%;
		font-weight: 400;
}

#container {
		position: relative;
		float: left;
		width: 100%;
		min-height: 100%;
		padding-left: 10px;
		padding-top: 10px;
		padding-bottom: 10px;
}

.card {
		position: relative;
		float: left;
		width: 280px;
		padding: 30px 30px 0 30px;
		box-sizing: border-box;
		border-radius: 0.2em;
		box-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
		-webkit-transition: none;
		transition: none;
}

.card * {
		-webkit-transition: none;
		transition: none;
}

.card h3 {
		font-size: 22px;
		margin-top: 0;
		margin-bottom: 30px;
		text-align: center;
		font-weight: 400;
}

.card .chart-legend {
		position: relative;
		float: left;
		margin-top: 30px;
		margin-left: -30px;
		width: calc(100% + 60px);
		padding: 7px 30px 5px 30px;
		border-radius: 0 0 0.2em 0.2em;
}

.card .chart-legend h3,
.card .chart-legend p {
		font-size: 14px;
		text-align: center;
		font-weight: 200;
		letter-spacing: 1px;
		line-height: 25px;
}

.card .chart {
		position: relative;
		float: left;
		width: 100%;
		height: 220px;
		overflow: hidden;
}

.card.line .chart {
		overflow: visible;
}
/* COLOURS */

.card.bg,
.card .bg {
		background: #fff;
		color: #111;
}

.card.line canvas {
		border-color: #333;
}

.card.line-only canvas,
.card.quote p,
.card.quote p:before {
		border-color: #5CA8A6;
}

.card .chart-legend,
.card.list li:before,
.card .bar-chart .bar:nth-child(4),
.card .column-chart .column:nth-child(4),
.card .stacked-column-chart .col-part:nth-child(1) {
		background-color: #5CA8A6;
		color: #fff;
		z-index: 4;
}

.card .ring-chart .ring-fill {
		border-color: #79D0CE;
}

.card .ring-chart .circle .mask .fill,
.card.ring .chart-legend p:nth-child(1):before,
.card .bar-chart .bar:nth-child(3),
.card .column-chart .column:nth-child(3),
.card .stacked-column-chart .col-part:nth-child(2) {
		background-color: #79D0CE;
		color: #fff;
		z-index: 3;
}

.card .ring-chart.small .ring-fill {
		border-color: #BBDDDB;
}

.card .bar-chart .bar:nth-child(2),
.card .column-chart .column:nth-child(2),
.card .ring-chart.small .circle .mask .fill,
.card.ring .chart-legend p:nth-child(2):before,
.card .stacked-column-chart .col-part:nth-child(3) {
		background-color: #BBDDDB;
		color: #fff;
		z-index: 2;
}

.card .ring-chart.mini .ring-fill {
		border-color: #DBEEED;
}

.card .bar-chart .bar:nth-child(1),
.card .column-chart .column:nth-child(1),
.card .ring-chart.mini .circle .mask .fill,
.card.ring .chart-legend p:nth-child(3):before,
.card .stacked-column-chart .col-part:nth-child(4) {
		background-color: #DCEFEE;
		color: #fff;
		z-index: 1;
}
/* RING CHART */

.card .ring-chart {
		position: relative;
		width: 100%;
		height: 100%;
		border-radius: 100%;
}

.card .small.ring-chart {
		position: absolute;
		top: 19px;
		left: 19px;
		width: calc(100% - 38px);
		height: calc(100% - 38px);
}

.card .mini.ring-chart {
		position: absolute;
		top: 39px;
		left: 39px;
		width: calc(100% - 78px);
		height: calc(100% - 78px);
}

.card .ring-chart .ring-fill {
		content: '';
		position: absolute;
		top: 9px;
		left: 9px;
		width: calc(100% - 18px);
		height: calc(100% - 18px);
		border-width: 3px;
		border-style: solid;
		border-radius: 100%;
		box-sizing: border-box;
}

.card .ring-chart .circle .mask,
.card .ring-chart .circle .fill {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		border-radius: 100%;
		-webkit-backface-visibility: hidden;
		-webkit-transition-timing-function: ease-in-out;
		transition-timing-function: ease-in-out;
		-webkit-transition: -webkit-transform 1s;
		transition: transform 1s;
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
}

.card.ring .chart-legend p {
		padding-left: 15px;
}

.card.ring .chart-legend p:before {
		content: '';
		position: absolute;
		left: 20px;
		margin-top: 3px;
		width: 16px;
		height: 12px;
		border: 3px solid transparent;
}
/* COLUMN CHART */

.card .column-chart {
		position: relative;
		float: left;
		width: 100%;
		height: 100%;
}

.card .column-chart .column {
		position: absolute;
		bottom: 0;
		left: 0;
		width: calc(25% - 10px);
		margin-left: 5px;
		height: 0;
		-webkit-transition-timing-function: ease-in-out;
		transition-timing-function: ease-in-out;
		-webkit-transition: height 0.5s;
		transition: height 0.5s;
}

.card .column-chart .column:nth-child(2) {
		left: 25%;
}

.card .column-chart .column:nth-child(3) {
		left: 50%;
}

.card .column-chart .column:nth-child(4) {
		left: 75%;
}

.card .column-chart .col-data {
		position: absolute;
		width: 100%;
		text-align: center;
		top: 5px;
		z-index: 3;
}
/* BAR CHART */

.card .bar-chart {
		position: relative;
		float: left;
		width: 100%;
		height: 100%;
}

.card .bar-chart .bar {
		position: absolute;
		top: 0;
		left: 0;
		height: calc(25% - 10px);
		margin-top: 5px;
		width: 0;
		-webkit-transition-timing-function: ease-in-out;
		transition-timing-function: ease-in-out;
		-webkit-transition: width 0.5s;
		transition: width 0.5s;
}

.card .bar-chart .bar:nth-child(2) {
		top: 25%;
}

.card .bar-chart .bar:nth-child(3) {
		top: 50%;
}

.card .bar-chart .bar:nth-child(4) {
		top: 75%;
}

.card .bar-chart .bar-data {
		position: absolute;
		top: 50%;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
		right: 5px;
		z-index: 3;
}
/* LIST AND QUOTE */

.card.list {
		padding-bottom: 30px;
}

.card.quote .chart,
.card.list .chart {
		height: auto;
}

.card.list h3 {
		margin-bottom: 20px;
}

.card.list ul {
		position: relative;
		width: 100%;
		list-style: none;
		padding: 0;
		margin: 0;
}

.card.list li {
		position: relative;
		width: 100%;
		counter-increment: list-item;
		padding-left: 37px;
		margin-bottom: 20px;
		line-height: 22px;
		letter-spacing: 1px;
		font-family: 'Raleway', sans-serif;
		font-weight: 300;
}

.card.list li:before {
		content: counter(list-item);
		position: absolute;
		text-align: center;
		top: calc(50% - 2px);
		transform: translateY(-50%);
		left: 0;
		border-radius: 100%;
		width: 26px;
		height: 26px;
		line-height: 23px;
}

.card.quote h3 {
		margin-bottom: 0;
		padding-top: 10px;
		padding-bottom: 10px;
}

.card.quote p {
		position: relative;
		float: left;
		border-left-width: 4px;
		border-left-style: solid;
		padding-left: 10px;
		line-height: 24px;
		letter-spacing: 1px;
		font-family: 'Raleway', sans-serif;
		font-weight: 300;
}

.card.quote p:before {
		content: '';
		display: inline;
		position: relative;
		float: left;
		padding: 0 1px 0 2px;
		margin-top: 3px;
		margin-right: 5px;
		height: 11px;
		border-left-width: 3px;
		border-left-style: solid;
		border-right-width: 3px;
		border-right-style: solid;
		-webkit-transform: rotate(12deg);
		transform: rotate(12deg);
}
/* Line Chart */

.card.line-only canvas {
		border-left-width: 4px;
		border-left-style: solid;
		border-bottom-width: 4px;
		border-bottom-style: solid;
}

.card.line canvas {
		position: absolute;
		top: 0;
		left: -2px;
		box-sizing: content-box;
		border-left-width: 2px;
		border-left-style: solid;
		border-bottom-width: 2px;
		border-bottom-style: solid;
		z-index: 5;
}
/* Stacked Column Chart */

.card.stacked-columns h3 {
		margin-bottom: 45px;
}

.card .stacked-column-chart .stacked-col-data {
		position: absolute;
		width: 100%;
		text-align: center;
		bottom: calc(100% + 5px);
		color: #333;
		z-index: 3;
}

.card.stacked-columns .chart {
		overflow: visible;
}

.card .stacked-column-chart {
		position: relative;
		float: left;
		width: 100%;
		height: 100%;
}

.card .stacked-column-chart .column {
		position: absolute;
		bottom: 0;
		left: 0;
		width: calc(25% - 10px);
		margin-left: 5px;
		height: 0;
		-webkit-transition-timing-function: ease-in-out;
		transition-timing-function: ease-in-out;
		-webkit-transition: height 0.5s;
		transition: height 0.5s;
}

.card .stacked-column-chart .column:nth-child(2) {
		left: 25%;
}

.card .stacked-column-chart .column:nth-child(3) {
		left: 50%;
}

.card .stacked-column-chart .column:nth-child(4) {
		left: 75%;
}

.card .stacked-column-chart .col-part {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 0;
}
	
	</style>
	
	<script>

	$.fn.drawColsLine = function drawLine(data, colour, cols) {

		var el = $(this);

		function calculate(data, index, d) {
				var valueRatio = data[index] / 100 * d;
				return d - valueRatio;
		};

		data['sorted'] = data.sort(function(a, b) {
				return parseFloat(a.x, 10) - parseFloat(b.x, 10);
		});

		data['y'] = new Array();

		for (var i = 0; i < data['sorted'].length; i++) {
				data['y'][i] = data['sorted'][i].y;
		}

		var canvas = el[0],
				ctx = canvas.getContext('2d');

		var t = 0;
		var interval = setInterval(function() {
				var x = ((canvas.width / cols.length) + parseInt(cols.css('margin-left')) / 2) * t + ((canvas.width / (cols.length * 2)) - parseInt(cols.css('margin-left')));
				var y = calculate(data['y'], t, canvas.height);
				ctx.lineTo(x, y);
				ctx.strokeStyle = colour;
				ctx.moveTo(x, y);
				ctx.stroke();
				t = t + 1;
				if (t > data['sorted'].length) {
						clearInterval(interval);
				}
		}, 800 / data['sorted'].length);
};

$.fn.drawLine = function drawLine(data, colour) {

		function calculate(data, index, d, max) {
				var valueRatio = data[index] / max * d - 10;
				return d - valueRatio;
		};

		function getMax(data) {
				return Math.max.apply(null, data);
		}

		data['sorted'] = data.sort(function(a, b) {
				return parseFloat(a.x, 10) - parseFloat(b.x, 10);
		});
		data['x'] = new Array();
		data['y'] = new Array();

		for (var i = 0; i < data['sorted'].length; i++) {
				data['x'][i] = data['sorted'][i].x;
				data['y'][i] = data['sorted'][i].y;
		}

		var canvas = $(this)[0],
				ctx = canvas.getContext('2d'),
				maxx = getMax(data['x']),
				maxy = getMax(data['y']);

		setTimeout(function() {
				var t = 0;
				var interval = setInterval(function() {
						var x = canvas.width - calculate(data['x'], t, canvas.width, maxx);
						var y = calculate(data['y'], t, canvas.height, maxy);
						ctx.lineTo(x, y);
						ctx.strokeStyle = colour;
						ctx.moveTo(x, y);
						ctx.stroke();
						t = t + 1;
						if (t > data['sorted'].length) {
								clearInterval(interval);
						}
				}, 800 / data['sorted'].length);
		}, 500);
};

$(document).ready(function() {

		var data1 = [{
				x: 14.31,
				y: 12.31
		}, {
				x: 9.34,
				y: 10.34
		}, {
				x: 5.26,
				y: 10.26
		}, {
				x: 16,
				y: 9
		}, {
				x: 12.21,
				y: 8.21
		}, {
				x: 18.41,
				y: 13.41
		}, {
				x: 25.43,
				y: 14.43
		}, {
				x: 2.31,
				y: 23.31
		}, {
				x: 19.41,
				y: 13.41
		}, {
				x: 18.4,
				y: 11.4
		}, {
				x: 45.34,
				y: 28.34
		}, {
				x: 36.21,
				y: 29.21
		}];

		var linegraph = $('.line-only').find('canvas');
		linegraph.drawLine(data1, linegraph.css('border-color'));
		var $container = $('#container');
		// init
		$container.packery({
				itemSelector: '.card',
				gutter: 10,
				columnWidth: '.card'
		});
		var $window = $(window);
		revealOnScroll();
		$window.on('scroll', revealOnScroll);

		function revealOnScroll() {
				var rings = $('.ring-chart');
				var columns = $('.column-chart');
				var bars = $('.bar-chart');
				var colline = $('.line-column-chart');

				var data = new Array();

				rings.each(function() {
						var chart = $(this);
						var win_height_padded = $window.height() * 1.1;
						var scrolled = $window.scrollTop();
						var offsetTop = chart.parents('.chart-wrap').offset().top;
						var offsetBottom = chart.parents('.chart-wrap').offset().top + parseInt(chart.parents('.chart-wrap').outerHeight());
						/* Clipping */
						var width = chart.width();
						var height = chart.height();
						var clipmask = 'rect(0,' + width + 'px,' + height + 'px,' + width / 2 + 'px)';
						var clipfill = 'rect(0,' + width / 2 + 'px,' + height + 'px,0)';
						chart.find('.mask').css({
								'clip': clipmask
						});
						chart.find('.mask').find('.fill').css({
								'clip': clipfill
						});

						if (scrolled + win_height_padded > offsetTop) {
								/* Percentage */
								var per = parseInt(chart.attr('data-progress'));
								var csshalf = {
										'-webkit-transform': 'rotate(' + 180 * per / 100 + 'deg)',
										'transform': 'rotate(' + 180 * per / 100 + 'deg)'
								};
								var cssfull = {
										'-webkit-transform': 'rotate(' + 360 * per / 100 + 'deg)',
										'transform': 'rotate(' + 360 * per / 100 + 'deg)'
								};
								setTimeout(function() {
										chart.find('.mask.full').css(csshalf);
										chart.find('.fill').css(csshalf);
										chart.find('.fix').css(cssfull);
								}, 500);
						} else if (scrolled + win_height_padded < offsetTop) {
								var cssempty = {
										'-webkit-transform': 'rotate(0deg)',
										'transform': 'rotate(0deg)'
								};
								setTimeout(function() {
										chart.find('.mask.full').css(cssempty);
										chart.find('.fill').css(cssempty);
										chart.find('.fix').css(cssempty);
								}, 0);
						}
				});

				columns.each(function() {
						var parts = $(this).find('.column');
						var win_height_padded = $window.height() * 1.1;
						var scrolled = $window.scrollTop();
						var offsetTop = parts.parents('.chart-wrap').offset().top;
						var offsetBottom = parts.parents('.chart-wrap').offset().top + parseInt(parts.parents('.chart-wrap').outerHeight());

						if (scrolled + win_height_padded > offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										setTimeout(function() {
												column.css({
														'height': cssheight + '%'
												});
												setTimeout(function() {
														column.find('.col-data').remove();
														column.append('<div class="col-data">' + cssheight + '%</div>');
												}, 50);
										}, 500 + (125 * a));
								});
						} else if (scrolled + win_height_padded < offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										setTimeout(function() {
												column.removeAttr('style');
										}, 0);
								});
						}
				});

				colline.each(function() {
						var parts = $(this).find('.column');
						var win_height_padded = $window.height() * 1.1;
						var scrolled = $window.scrollTop();
						var offsetTop = parts.parents('.chart-wrap').offset().top;
						var offsetBottom = parts.parents('.chart-wrap').offset().top + parseInt(parts.parents('.chart-wrap').outerHeight());

						if (scrolled + win_height_padded > offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										data.push({
												x: a,
												y: parseInt(cssheight)
										});
										setTimeout(function() {
												column.css({
														'height': cssheight + '%'
												});
												setTimeout(function() {
														column.find('.col-data').remove();
														column.append('<div class="col-data">' + cssheight + '%</div>');
												}, 50);
										}, 500 + (125 * a));
								});
								setTimeout(function() {
										var linegraph = parts.parent().next();
										if (linegraph.attr('data-line') != 'true') {
												linegraph.drawColsLine(data, linegraph.css('border-color'), parts);
										}
										linegraph.attr('data-line', 'true');
										data = [];
								}, 500 + (125 * (parts.length + 1)));
						} else if (scrolled + win_height_padded < offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										setTimeout(function() {
												column.removeAttr('style');
										}, 0);
								});
						}
				});
				var stackedcol = $('.stacked-column-chart');

				stackedcol.each(function() {
						var parts = $(this).find('.column');
						var win_height_padded = $window.height() * 1.1;
						var scrolled = $window.scrollTop();
						var offsetTop = parts.parents('.chart-wrap').offset().top;
						var offsetBottom = parts.parents('.chart-wrap').offset().top + parseInt(parts.parents('.chart-wrap').outerHeight());

						if (scrolled + win_height_padded > offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										setTimeout(function() {
												column.css({
														'height': cssheight + '%'
												});
										}, 500 + (125 * a));
										setTimeout(function() {
												var colparts = column.find('.col-part');
												var colpartspos = 0;
												colparts.each(function(c, d) {
														var colpart = $(this);
														var partheight = colpart.attr('data-progress');
														setTimeout(function() {
																if (c == 0) {
																		colpart.stop().animate({
																				'height': partheight + '%'
																		});
																} else {
																		colpart.stop().animate({
																				'height': partheight + '%',
																				'bottom': colpartspos + '%'
																		});
																}
																colpartspos = colpartspos + parseInt(partheight);
																setTimeout(function() {
																		column.find('.stacked-col-data').remove();
																		column.append('<div class="stacked-col-data">' + cssheight + '%</div>');
																}, 125 * c);
														}, 500 + (125 * c));
												});
										}, 500 + (125 * parts.length));
								});
						} else if (scrolled + win_height_padded < offsetTop) {
								parts.each(function(a, b) {
										var column = $(this);
										var cssheight = column.attr('data-progress');
										setTimeout(function() {
												column.removeAttr('style');
										}, 0);
								});
						}
				});

				bars.each(function() {
						var parts = $(this).find('.bar');
						var win_height_padded = $window.height() * 1.1;
						var scrolled = $window.scrollTop();
						var offsetTop = parts.parents('.chart-wrap').offset().top;
						var offsetBottom = parts.parents('.chart-wrap').offset().top + parseInt(parts.parents('.chart-wrap').outerHeight());

						if (scrolled + win_height_padded > offsetBottom) {

								parts.each(function(a, b) {
										var bar = $(this);
										var csswidth = bar.attr('data-progress');
										setTimeout(function() {
												bar.css({
														'width': csswidth + '%'
												});
												setTimeout(function() {
														bar.find('.bar-data').remove();
														bar.append('<div class="bar-data">' + csswidth + '%</div>');
												}, 50);
										}, 500 + (125 * a));
								});
						} else if (scrolled + win_height_padded < offsetTop) {
								parts.each(function(a, b) {
										var bar = $(this);
										var cssheight = bar.attr('data-progress');
										setTimeout(function() {
												bar.removeAttr('style');
										}, 0);
								});
						}
				});
		}
});

	</script>
</head>
<body>

	<h1>A series of chart visualisations</h1>

<div id="container">
		<div class="card chart-wrap bg ring">
				<h3>Triple Ring Chart</h3>
				<div class="chart">
						<div class="ring-chart" data-progress="80">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
						<div class="small ring-chart" data-progress="60">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
						<div class="mini ring-chart" data-progress="40">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This describes the value of the outer ring</p>
						<p>This describes the value of the middle ring</p>
						<p>This describes the value of the inner ring</p>
				</div>
		</div>
		<div class="card chart-wrap bg ring">
				<h3>Double Ring Chart</h3>
				<div class="chart">
						<div class="ring-chart" data-progress="40">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
						<div class="small ring-chart" data-progress="70">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This describes the value of the outer ring</p>
						<p>This describes the value of the middle ring</p>
				</div>
		</div>
		<div class="card chart-wrap bg ring">
				<h3>Single Ring Chart</h3>
				<div class="chart">
						<div class="ring-chart" data-progress="70">
								<div class="circle">
										<div class="mask full">
												<div class="fill bg"></div>
										</div>
										<div class="mask half">
												<div class="fill bg"></div>
												<div class="fill bg fix"></div>
										</div>
								</div>
								<div class="ring-fill bg"></div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This describes the value of the outer ring</p>
				</div>
		</div>
		<div class="card chart-wrap bg line-only">
				<h3>Line Chart</h3>
				<div class="chart">
						<canvas id="line-graph-1" width="216" height="216"></canvas>
				</div>
				<div class="chart-legend">
						<p>This is just a legend for what is happening in the line chart</p>
				</div>
		</div>
		<div class="card chart-wrap bg line columns">
				<h3>Column Line Chart</h3>
				<div class="chart">
						<div class="column-chart line-column-chart">
								<div class="column" data-progress="64"></div>
								<div class="column" data-progress="70"></div>
								<div class="column" data-progress="80"></div>
								<div class="column" data-progress="95"></div>
						</div>
						<canvas width="220" height="220" data-line="false"></canvas>
				</div>
				<div class="chart-legend">
						<p>This is just a legend for what is happening in the column line chart</p>
				</div>
		</div>
		<div class="card chart-wrap bg columns">
				<h3>Column Chart</h3>
				<div class="chart">
						<div class="column-chart">
								<div class="column" data-progress="64"></div>
								<div class="column" data-progress="72"></div>
								<div class="column" data-progress="80"></div>
								<div class="column" data-progress="92"></div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This is just a legend for what is happening in the column chart</p>
				</div>
		</div>
		<div class="card chart-wrap bg stacked-columns">
				<h3>Stacked Column Chart</h3>
				<div class="chart">
						<div class="stacked-column-chart">
								<div class="column" data-progress="64">
										<div class="col-part" data-progress="44"></div>
										<div class="col-part" data-progress="56"></div>
								</div>
								<div class="column" data-progress="100">
										<div class="col-part" data-progress="17"></div>
										<div class="col-part" data-progress="47"></div>
										<div class="col-part" data-progress="29"></div>
										<div class="col-part" data-progress="7"></div>
								</div>
								<div class="column" data-progress="80">
										<div class="col-part" data-progress="30"></div>
										<div class="col-part" data-progress="10"></div>
										<div class="col-part" data-progress="60"></div>
								</div>
								<div class="column" data-progress="92">
										<div class="col-part" data-progress="15"></div>
										<div class="col-part" data-progress="40"></div>
										<div class="col-part" data-progress="40"></div>
										<div class="col-part" data-progress="5"></div>
								</div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This is just a legend for what is happening in the stacked column chart</p>
				</div>
		</div>
		<div class="card chart-wrap bg bars">
				<h3>Bar Chart</h3>
				<div class="chart">
						<div class="bar-chart">
								<div class="bar" data-progress="64"></div>
								<div class="bar" data-progress="72"></div>
								<div class="bar" data-progress="80"></div>
								<div class="bar" data-progress="92"></div>
						</div>
				</div>
				<div class="chart-legend">
						<p>This is just a legend for what is happening in the bar chart</p>
				</div>
		</div>
		<div class="card chart-wrap bg list">
				<h3>List</h3>
				<div class="chart">
						<ul>
								<li class="list-item">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
								<li class="list-item">Aliquam tincidunt mauris eu risus.</li>
								<li class="list-item">Vestibulum auctor dapibus neque.</li>
								<li class="list-item">Aliquam tincidunt mauris eu risus.</li>
								<li class="list-item">Vestibulum auctor dapibus neque.</li>
						</ul>
				</div>
		</div>
		<div class="card chart-wrap bg quote">
				<div class="chart">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga illum nisi, placeat similique enim ullam atque, quam expedita, odit eius, neque mollitia officiis tempora cupiditate. Unde ex, dolorem placeat aspernatur.</p>
				</div>
				<div class="chart-legend">
						<h3>- Somebody important</h3>
				</div>
		</div>
</div>
</body>
</html>