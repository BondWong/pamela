<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--meta_title start-->
<%@ include file="templates/meta_title.jsp"%>
<!--meta_title end-->
<!--main page common css-->
<%@ include file="templates/main_page_common_css.jsp"%>
<!--main page common css-->
<!--dynamic table-->
<link href="js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />
</head>

<body>

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
				<!-- page start-->
				<div class="row">
					<div id="indicator"></div>
				</div>

				<!-- page end-->
			</section>
		</section>
		<!--main content end-->

	</section>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="js/purl.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<!--dynamic table-->
	<script type="text/javascript"
		src="js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/data-tables/DT_bootstrap.js"></script>

	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>

	<!--dynamic table initialization -->
	<script type="text/javascript" src="js/dynamic_table_init.js"></script>

	<!--indicator-->
	<script type="text/javascript" src="js/spin.js"></script>
	<!--indicator start-->
	<script>
		var opts = {
			lines : 11 // The number of lines to draw
			,
			length : 35 // The length of each line
			,
			width : 14 // The line thickness
			,
			radius : 42 // The radius of the inner circle
			,
			scale : 0.7 // Scales overall size of the spinner
			,
			corners : 1 // Corner roundness (0..1)
			,
			color : '#000' // #rgb or #rrggbb or array of colors
			,
			opacity : 0.25 // Opacity of the lines
			,
			rotate : 0 // The rotation offset
			,
			direction : 1 // 1: clockwise, -1: counterclockwise
			,
			speed : 1 // Rounds per second
			,
			trail : 60 // Afterglow percentage
			,
			fps : 20 // Frames per second when using setTimeout() as a fallback for CSS
			,
			zIndex : 2e9 // The z-index (defaults to 2000000000)
			,
			className : 'spinner' // The CSS class to assign to the spinner
			,
			top : '50%' // Top position relative to parent
			,
			left : '50%' // Left position relative to parent
			,
			shadow : true // Whether to render a shadow
			,
			hwaccel : true // Whether to use hardware acceleration
			,
			position : 'absolute' // Element positioning
		};
		var target = document.getElementById('indicator');
		var spinner = new Spinner(opts).spin(target);
	</script>
	<!--indicator end-->

	<!--load diaries start-->
	<script>
		$
				.ajax({
					url : "pamela/diary/0/500/${param.category}",
					type : "GET",
					dataType : "json",
					cache : true,
					async : true,
					success : function(data, textStatus, jqXHR) {
						var diaries = [];
						$(data).each(function(index, element) {
							diaries[index] = element;
						});

						//remove indicator
						$("#indicator").remove();

						//prepare table data
						var table = '<div class="col-sm-12">'
								+ '<section class="panel">'
								+ '<header class="panel-heading"> Diaries</header>'
								+ '<div class="panel-body">'
								+ '<div class="adv-table">'
								+ '<table class="display table table-hover general-table" id="dynamic-table">'
								+ '<thead>' + '<tr>' + '<th>Title</th>'
								+ '<th>Weather</th>'
								+ '<th class="hidden-phone">Mood</th>'
								+ '<th class="hidden-phone">Date</th>'
								+ '</tr>' + '</thead>' + '<tbody>';

						$(diaries)
								.each(
										function(index, element) {
											weather = element["weather"];
											table += '<tr id="' + element["id"] + '">'
													+ '<td><span class='+ weather +'>'
													+ element["title"]
													+ '</span></td>'
													+ '<td class="center hidden-phone"><span class="mif-' + weather +' mif-4x ' + weather + '"></span></td>'
													+ '<td class="center hidden-phone"><span class="icon-' + element["mood"] + '2 ' + weather + '"></span></td>'
													+ '<td><span class="'+ weather + '">'
													+ element["date"]
													+ '</span></td>'
													+ '</a></tr>';
										});

						table += '</tbody>' + '</table>' + '</div>' + '</div>'
								+ '</section>' + '</div>';

						//append table
						$("div.row").append(table);
						$('#dynamic-table').dataTable({
							"aaSorting" : [ [ 3, "desc" ] ]
						});
						$("tbody tr").click(function() {
							var id = $(this).attr("id");
							window.location.href = "diary_view.jsp?id=" + id;
						});
					},
					error : function(jqXHR, textStatus, error) {
						// fail message
						alert(textStatus);
					}

				});
	</script>
	<!--load diaries end-->
</body>
</html>
