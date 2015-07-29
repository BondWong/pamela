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
	<section id="container">
		<!--main content start-->
		<section id="mobile-main-content">
			<section class="mobile-wrapper">
				<!-- page start-->
				<div class="col-md-12">
					<section class="panel">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">View Your Loved One's Diary</h4>
						</header>
						<div class="panel-body ">

							<div class="mail-header">
								<div class="col-md-12">
									<h4 class="pull-left" id="title"></h4>
								</div>
							</div>
							<div class="mail-sender ">
								<div class="col-md-4" id="mood"></div>
								<div class="col-md-4" id="weather"></div>
								<div class="col-md-4" id="date">
									<p class="date"></p>
								</div>
							</div>
							<div class="view-mail" id="htmlContent"></div>
						</div>
					</section>
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

	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script src="js/iCheck/jquery.icheck.js"></script>

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
					},
					error : function(jqXHR, textStatus, error) {
						// fail message
						console.log(error);
					}

				});

		//load data end
	</script>
</body>
</html>



