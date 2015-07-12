<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--meta_title start-->
<%@ include file="templates/meta_title.jsp"%>
<!--meta_title end-->
<!--main page common css-->
<%@ include file="templates/main_page_common_css.jsp"%>
<!--main page common css-->
<!--icheck-->
<link href="js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
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
				<!-- page start-->
				<div class="row">
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading wht-bg">
								<h4 class="gen-case">View My Diary</h4>
							</header>
							<div class="panel-body ">

								<div class="mail-header row">
									<div class="col-md-8">
										<h4 class="pull-left" id="title"></h4>
									</div>
									<div class="col-md-4">
										<div class="compose-btn pull-right">
											<a href="diary_compose.jsp" class="btn btn-sm btn-primary"><i
												class="fa fa-reply"></i> Back</a>
											<button class="btn btn-sm tooltips"
												data-original-title="Trash" data-toggle="tooltip"
												data-placement="top" title="">
												<i class="fa fa-trash-o"></i>
											</button>
										</div>
									</div>

								</div>
								<div class="mail-sender">
									<div class="row">
										<div class="col-md-4" id="mood"></div>
										<div class="col-md-4" id="weather"></div>
										<div class="col-md-4" id="date">
											<p class="date"></p>
										</div>
									</div>
								</div>
								<div class="view-mail" id="htmlContent"></div>
								<div class="attachment-mail">
									<p>
										<span><i class="fa fa-paperclip" id="images"></i></span>
									</p>
									<ul>
										<li id="thumbnail_list"></li>
									</ul>
								</div>
								<div class="compose-btn pull-left">
									<a href="diary_compose.jsp" class="btn btn-sm btn-primary"><i
										class="fa fa-reply"></i> Back</a>
									<button class="btn btn-sm tooltips" data-original-title="Trash"
										data-toggle="tooltip" data-placement="top" title=""
										id="diary_delete">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
							</div>
						</section>
					</div>
				</div>

				<!-- page end-->
			</section>
		</section>
		<!--main content end-->
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<!--Easy Pie Chart-->
	<script src="js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="js/sparkline/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>

	<script src="js/iCheck/jquery.icheck.js"></script>

	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>

	<!--icheck init -->
	<script src="js/icheck-init.js"></script>

	<script type="text/javascript">
		//wysihtml5 start

		$('.wysihtml5').wysihtml5({
			"font-styles" : true, //Font styling, e.g. h1, h2, etc. Default true
			"emphasis" : true, //Italics, bold, etc. Default true
			"lists" : true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
			"html" : true, //Button which allows you to edit the generated HTML. Default false
			"link" : true, //Button to insert a link. Default true
			"image" : true, //Button to insert an image. Default true,
			"color" : true
		//Button to change color of font  
		});

		//wysihtml5 end

		//load data start

		$
				.ajax({
					url : "pamela/diary/${param.id}",
					type : "GET",
					dataType : "json",
					cache : true,
					async : false,
					success : function(data, textStatus, jqXHR) {
						// success message
						$("#title").append(data["title"]);
						var mood = '<span class="icon-' + data["mood"] + '2"></span>';
						var weather = '<span class="mif-' + data["weather"] + ' mif-4x"></span>';
						$("#mood").append(mood);
						$("#weather").append(weather);
						$("#date .date").append(data["date"]);
						$("#htmlContent").append(data["htmlContent"]);
						$("#images").after(
								data["images"].length / 2 + " image(s)");

						$(data["images"])
								.each(
										function(index, element) {
											if (index % 2 == 1) {
												var item = '<li>'
														+ '<a class="atch-thumb" href="javascript:void(0)">'
														+ '<img src="images/uploadedFile/' + element["link"]
														+ '" /></a>'
														+ '<a class="name" href="javascript:void(0)">'
														+ 'picture '
														+ (Math
																.round(index / 2))
														+ '</a></li>';
												$("#thumbnail_list").append(
														item);
											}
										});
					},
					error : function(jqXHR, textStatus, error) {
						// fail message
						alert(textStatus);
					}

				});

		$("#diary_delete").click(function() {
			$.ajax({
				url : "pamela/diary/${param.id}",
				type : "DELETE",
				cache : false,
				async : false,
				success : function(data, textStatus, jqXHR) {
					window.location.href = "diary_compose.jsp";
				},
				error : function(jqXHR, textStatus, error) {
					alert(textStatus);
				}
			});
		});

		//load data end
	</script>
</body>
</html>



