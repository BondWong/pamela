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
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-fileupload/bootstrap-fileupload.css" />
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
								<h4 class="gen-case">Compose Diary</h4>
							</header>
							<div class="panel-body">
								<div class="btn-row">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-round btn-default btn-lg active">
											<input type="radio" name="mood" value="happy"
											checked="checked" /> <span class="icon-happy2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="smile" /><span
											class="icon-smile2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="tongue" /><span
											class="icon-tongue2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="sad" /><span
											class="icon-sad2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="wink" /><span
											class="icon-wink2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="grin" /><span
											class="icon-grin2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="cool" /><span
											class="icon-cool2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="angry" /><span
											class="icon-angry2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="evil" /><span
											class="icon-evil2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="shocked" /><span
											class="icon-shocked2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="baffled" /><span
											class="icon-baffled2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="confused" /><span
											class="icon-confused2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="neutral" /><span
											class="icon-neutral2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="hispter" /><span
											class="icon-hipster2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="wondering" /><span
											class="icon-wondering2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="sleepy" /><span
											class="icon-sleepy2"></span>
										</label><label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="frustrated" /><span
											class="icon-frustrated2"></span>
										</label> <label class="btn btn-round btn-default btn-lg"> <input
											type="radio" name="mood" value="crying" /><span
											class="icon-crying2"></span>
										</label>
									</div>
								</div>
								<div class="btn-row">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-round btn-danger btn-lg active">
											<input type="radio" name="weather" value="sun"
											checked="checked" /> <span class="mif-sun mif-4x"></span>
										</label> <label class="btn btn-round btn-primary btn-lg"> <input
											type="radio" name="weather" value="cloudy" /> <span
											class="mif-cloudy mif-4x"></span>
										</label> <label class="btn btn-round btn-success btn-lg"> <input
											type="radio" name="weather" value="windy" /> <span
											class="mif-windy2 mif-4x"></span>
										</label><label class="btn btn-round btn-info btn-lg"> <input
											type="radio" name="weather" value="rainy" /><span
											class="mif-rainy mif-4x"></span>
										</label><label class="btn btn-round btn-warning btn-lg"> <input
											type="radio" name="weather" value="lightning" /><span
											class="mif-lightning mif-4x"></span>
										</label>
									</div>
								</div>
								<div class="compose-mail">
									<form role="form-horizontal" method="post"
										onsubmit="return false;">
										<div class="form-group">
											<label for="to" class="">Titile:</label> <input type="text"
												tabindex="1" id="title" class="form-control"
												placeholder="Input Diary Title" />
										</div>

										<div class="compose-editor">
											<textarea class="wysihtml5 form-control" rows="20"
												placeholder="Input Diary Content"></textarea>
										</div>
										<div class="compose-btn">
											<button class="btn btn-primary btn-sm" id="wysihtml5-button">
												<i class="fa fa-check"></i> Send
											</button>
											<a class="btn btn-danger btn-sm" href="diary_compose.jsp?"
												onclick="this.href+=new Date().getTime();return true;"
												id="reset_button"> <i class="fa fa-times"></i> Discard
											</a>
										</div>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
				<!-- page end-->
			</section>
			<!--main content end-->
		</section>
		<!--warning start-->
		<!--title warning-->
		<div class="modal fade" id="title_warning">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body alert-warning">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Warning!</strong> Please Input Diary Title.
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--content warning-->
		<div class="modal fade" id="content_warning">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body alert-warning">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Warning!</strong> Please Input Diary Content.
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--create diary success-->
		<div class="modal fade" id="create_diary_success">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body alert-success">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" id="diary_message_close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Diary Created!</strong>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--create diary fail-->
		<div class="modal fade" id="create_diary_fail">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body alert-fail">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" id="diary_message_close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>Diary Failed!</strong>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!--warning end-->
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="js/purl.js"></script>
	<!--for $.broswer-->
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<!--Theme Switcher-->
	<script src="js/theme-switcher.js"></script>

	<!--Wysiwyg html5-->
	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>

	<!--icheck init -->
	<script src="js/icheck-init.js"></script>
	<script src="js/iCheck/jquery.icheck.js"></script>
	<!--fileupload-->
	<script src="js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-fileupload/bootstrap-fileupload.js"></script>

	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
		//wysihtml5 start

		$('.wysihtml5').wysihtml5({
			"font-styles" : true, //Font styling, e.g. h1, h2, etc. Default true
			"emphasis" : true, //Italics, bold, etc. Default true
			"lists" : true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
			"html" : false, //Button which allows you to edit the generated HTML. Default false
			"link" : true, //Button to insert a link. Default true
			"image" : true, //Button to insert an image. Default true,
			"blockquote" : true,
			"color" : true
		//Button to change color of font  
		});

		//wysihtml5 end

		//wysihtml5 send button start
		$("#wysihtml5-button").click(function() {
			var mood = $('input[name=mood]:checked').val();
			var weather = $('input[name=weather]:checked').val();
			var title = $("#title").val();
			var htmlContent = $(".wysihtml5").val();
			data = {
				"mood" : mood,
				"weather" : weather,
				"title" : title,
				"htmlContent" : htmlContent
			};

			if (data.title == "") {
				warn_title();
			} else if (data.html == "") {
				warn_content();
			} else {

				$.ajax({
					url : "pamela/diary/create",
					type : "POST",
					data : JSON.stringify(data),
					contentType : "application/json",
					dataType : "json",
					cache : false,
					async : false,
					success : function() {
						// success message
						$("#create_diary_success").modal();
					},
					error : function() {
						// fail message
						$("#create_diary_fail").modal();
					}

				});
			}
		});
		//wysihtml5 send button end

		//warn form title start
		function warn_title() {
			$("#title_warning").modal();
			$("#title").focus();
		}
		//warn form title end

		//warn form title start
		function warn_content() {
			$("#content_warning").modal();
			$(".wysihtml5").focus();
		}
		//warn form title end

		//diary message close start
		$("#diary_message_close").click(function() {
			window.location.href += "?" + new Date().getTime();
		});
		//diary message close end
	</script>
</body>
</html>
