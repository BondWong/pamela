<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	Date today = new Date();
	int day = today.getDay();
	int month = today.getMonth();
	int year = today.getYear();
	request.setAttribute("year", 115 + 1900 + "");
	int date = today.getDate();
	request.setAttribute("date", date);

	switch (day) {
		case 0 :
			request.setAttribute("day", "Monday");
			break;
		case 1 :
			request.setAttribute("day", "Tuesday");
			break;
		case 2 :
			request.setAttribute("day", "Wednesday");
			break;
		case 3 :
			request.setAttribute("day", "Thursday");
			break;
		case 4 :
			request.setAttribute("day", "Friday");
			break;
		case 5 :
			request.setAttribute("day", "Saturday");
			break;
		case 6 :
			request.setAttribute("day", "Sunday");
			break;
		default :
	}

	switch (month) {
		case 0 :
			request.setAttribute("month", "January");
			break;
		case 1 :
			request.setAttribute("month", "February");
			break;
		case 2 :
			request.setAttribute("month", "March");
			break;
		case 3 :
			request.setAttribute("month", "April");
			break;
		case 4 :
			request.setAttribute("month", "May");
			break;
		case 5 :
			request.setAttribute("month", "June");
			break;
		case 6 :
			request.setAttribute("month", "July");
			break;
		case 7 :
			request.setAttribute("month", "August");
			break;
		case 8 :
			request.setAttribute("month", "September");
			break;
		case 9 :
			request.setAttribute("month", "October");
			break;
		case 10 :
			request.setAttribute("month", "November");
			break;
		case 11 :
			request.setAttribute("month", "December");
			break;
		default :
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--meta_title start-->
<%@ include file="templates/meta_title.jsp"%>
<!--meta_title end-->
<!--main page common css-->
<%@ include file="templates/main_page_common_css.jsp"%>
<!--main page common css-->
<!--clock css-->
<link href="js/css3clock/css/style.css" rel="stylesheet">
<!--Morris Chart CSS -->
<link rel="stylesheet" href="js/morris-chart/morris.css">
<!--Wiget_Calendar_Vector-->
<link href="js/jvector-map/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<link href="css/clndr.css" rel="stylesheet">
<link href="js/jquery-ui/jquery-ui-1.10.1.custom.min.css"
	rel="stylesheet">
</head>
<body>
	<!--theme switcher start-->
	<%@ include file="templates/theme_switcher.jsp"%>
	<!--theme switcher end-->
	<section id="container">
		<!--header start-->
		<%@ include file="templates/header.jsp"%>
		<!--header end-->
		<!--sidebar start-->
		<%@ include file="templates/nav_aside.jsp"%>
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-md-8">
						<div class="event-calendar clearfix">
							<div class="col-lg-7 calendar-block">
								<div class="cal1 "></div>
							</div>
							<div class="col-lg-5 event-list-block">
								<div class="cal-day">
									<span>Today</span>
									<c:out value="${requestScope.day }" />
								</div>
								<ul class="event-list">
									<li>Will you miss me like I am miss you? <!-- <a
										href="javascript:void(0)" class="event-close"><i
											class="ico-close2"></i></a> --></li>
									<li>You make me wanna be a better man, and I hope that I
										give you the same motivation <!-- <a
										href="javascript:void(0)" class="event-close"><i
											class="ico-close2"></i></a> -->
									</li>
									<li>Don't be a lazy woman! Taking care of yourself! <!-- <a
										href="javascript:void(0)" class="event-close"><i
											class="ico-close2"></i></a> --></li>
									<li>Gym @ 17:00 <!-- <a
										href="javascript:void(0)" class="event-close"><i
											class="ico-close2"></i></a> --></li>
									<li>I love you and will be missing you from the very day I
										leave China. <!-- <a
										href="javascript:void(0)" class="event-close"><i
											class="ico-close2"></i></a> -->
									</li>

								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<section class="panel">
							<header class="panel-heading">
								Mood Statistic <span class="tools pull-right"> </span>
							</header>
							<div class="panel-body">
								<div id="graph-donut"></div>
							</div>
						</section>
					</div>
					<!--widget mood start-->
					<div class="col-md-4">
						<div class="mini-stat clearfix">
							<span class="mini-stat-icon orange"><i class="fa fa-gavel"></i></span>
							<div class="mini-stat-info">
								<span id="lastest_mood">None</span> Lastest Diary Mood
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<section class="panel">
							<div class="wdgt-row">
								<img src="images/philadelphia-morning.jpg" height="243" alt="">
								<div class="wdt-head">weather forecast</div>
								<!-- <div class="country-select">
									<select class="styled">
										<option>New York</option>
										<option>London</option>
										<option>Australia</option>
										<option>China</option>
										<option>Canada</option>
									</select>
								</div> -->
							</div>

							<div class="panel-body">
								<div class="row weather-full-info" id="weather_forecast">
									<!-- <div class="col-md-3 today-status">
										<h1>Today</h1>
										<i class=" ico-cloudy " id="forecast_weather_today"></i>
										<div class="degree">37</div>
									</div>
									<div class="col-md-2 today-status">
										<h1>Today</h1>
										<i class=" ico-cloudy " id="forecast_weather_today"></i>
										<div class="degree">37</div>
									</div>
									<div class="col-md-2 today-status">
										<h1>Today</h1>
										<i class=" ico-cloudy " id="forecast_weather_today"></i>
										<div class="degree">37</div>
									</div>
									<div class="col-md-2 today-status">
										<h1>Today</h1>
										<i class=" ico-cloudy " id="forecast_weather_today"></i>
										<div class="degree">37</div>
									</div>
									<div class="col-md-2 today-status">
										<h1>Today</h1>
										<i class=" ico-cloudy " id="forecast_weather_today"></i>
										<div class="degree">37</div>
									</div> -->
									<!-- <ul>
											<li>
												<h2>Tomorrow</h2> <i class=" ico-cloudy"></i>
												<div class="statistics">32</div>
											</li>
											<li>
												<h2>Mon</h2> <i class=" ico-rainy2"></i>
												<div class="statistics">40</div>
											</li>
											<li>
												<h2>Tue</h2> <i class=" ico-lightning3"></i>
												<div class="statistics">25</div>
											</li>
											<li>
												<h2>Wed</h2> <i class=" ico-sun3"></i>
												<div class="statistics">37</div>
											</li>
										</ul> -->
								</div>
							</div>

						</section>
					</div>
					<div class="col-md-4">
						<div class="profile-nav alt">
							<section class="panel">
								<div class="user-heading alt clock-row terques-bg">
									<h1>
										<c:out value="${requestScope.month }" />
										<c:out value=" " />
										<c:out value="${requestScope.date }" />
									</h1>
									<p class="text-left">
										<c:out value="${requestScope.year }" />
										,
										<c:out value="${requestScope.day }" />
									</p>
								</div>
								<ul id="clock">
									<li id="sec"></li>
									<li id="hour"></li>
									<li id="min"></li>
								</ul>

								<!--<ul class="clock-category">
									 <li><a href="javascript:void(0)" class="active"> <i
											class="ico-clock2"></i> <span>Clock</span>
									</a></li>
									<li><a href="javascript:void(0)"> <i
											class="ico-alarm2 "></i> <span>Alarm</span>
									</a></li>
									<li><a href="javascript:void(0)"> <i
											class="ico-stopwatch"></i> <span>Stop watch</span>
									</a></li>
									<li><a href="javascript:void(0)"> <i
											class=" ico-clock2 "></i> <span>Timer</span>
									</a></li> 
								</ul>-->

							</section>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="invisible col-sm-3">
						<section class="panel">
							<header class="panel-heading">
								Customize Graph <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-cog"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div id="graph-area"></div>
							</div>
						</section>
					</div>
					<div class="invisible col-sm-3">
						<section class="panel">
							<header class="panel-heading">
								Bar Chart <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-cog"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div id="graph-bar"></div>
							</div>
						</section>
					</div>
					<div class="invisible col-sm-3">
						<section class="panel">
							<header class="panel-heading">
								Line Chart <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-cog"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div id="graph-line"></div>
							</div>
						</section>
					</div>
					<div class="invisible col-sm-3">
						<section class="panel">
							<header class="panel-heading">
								Area Chart <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-cog"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div id="graph-area-line"></div>
							</div>
						</section>
					</div>
				</div>
			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
	<script src="js/purl.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
	<script src="js/skycons/skycons.js"></script>
	<script src="js/jquery.scrollTo/jquery.scrollTo.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/calendar/clndr.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
	<script src="js/calendar/moment-2.2.1.js"></script>
	<script src="js/evnt.calendar.init.js"></script>
	<script src="js/gauge/gauge.js"></script>
	<!--clock init-->
	<script src="js/css3clock/js/css3clock.js"></script>
	<!--Morris Chart-->
	<script src="js/morris-chart/morris.js"></script>
	<script src="js/morris-chart/raphael-min.js"></script>
	<script src="js/morris.init.js"></script>
	<!--Theme Switcher-->
	<script src="js/theme-switcher.js"></script>
	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>
	<!--script for this page-->

	<script>
		var user = JSON.parse(localStorage.getItem("user"));
		$.ajax({
			url : "pamela/mood/latest/" + user["id"],
			type : "GET",
			dataType : "json",
			cache : true,
			async : false,
			success : function(data, textStatus, jqXHR) {
				// success message
				if (data != null && data.length > 1)
					$("#lastest_mood").empty().append(data.toUpperCase());
			},
			error : function(jqXHR, textStatus, error) {
				// fail message
			}
		});

		var showWeather = function(data) {
			var weather = "";
			$(data.query.results.channel.item.forecast).each(
					function(index, element) {
						if (index == 0) {
							weather = '<div class="col-md-3 today-status">'
									+ '<h1>Today</h1>'
									+ '<h5>'
									+ element["text"]
									+ '</h5>'
									+ '<div class="degree">'
									+ parseInt((parseInt(element["high"])
											+ parseInt(element["low"]) - 32)
											/ (2 * 1.8)) + '</div>' + '</div>';
						} else if (index == 1) {
							weather = '<div class="col-md-2 today-status">'
									+ '<h1>Tomorrow</h1>'
									+ '<h5>'
									+ element["text"]
									+ '</h5>'
									+ '<div class="degree">'
									+ parseInt((parseInt(element["high"])
											+ parseInt(element["low"]) - 32)
											/ (2 * 1.8)) + '</div>' + '</div>';
						} else {
							weather = '<div class="col-md-2 today-status">'
									+ '<h1>'
									+ element["day"]
									+ '</h1>'
									+ '<h5>'
									+ element["text"]
									+ '</h5>'
									+ '<div class="degree">'
									+ parseInt((parseInt(element["high"])
											+ parseInt(element["low"]) - 32)
											/ (2 * 1.8)) + '</div>' + '</div>';
						}
						$("#weather_forecast").append(weather);
					});
		};
	</script>

	<script
		src="https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text='philadelphia, pa')&format=json&callback=showWeather"></script>

</body>
</html>