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
							<header class="panel-heading"> Gallery</header>
							<div class="panel-body">

								<ul id="filters" class="media-filter">
									<li><a href="javascript:void(0)" data-filter="*"> All</a></li>
								</ul>

								<div id="gallery" class="media-gal"></div>

								<div class="col-md-12 text-center clearfix">
									<div id="loadmoreajaxloader">
										<img src="images/ajax-loader.gif" />
									</div>
								</div>

								<!-- Modal -->
								<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title">Image Name</h4>
											</div>
											<div class="modal-body row">
												<div class="col-md-12 img-modal">
													<img src="images/gallery/image1.jpg" alt=""> <a
														href="javascript:void(0)" class="btn btn-white btn-sm"></a>
												</div>
											</div>
										</div>
									</div>
								</div> -->
								<!-- modal -->
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
	<script src="js/purl.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<script src="js/jquery.isotope.js"></script>
	<script src="js/jquery.lighterbox.js"></script>


	<!--common script init for all pages-->
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
		$(function() {
			var $container = $('#gallery');
			$container.isotope({
				itemSelector : '.item',
				animationOptions : {
					duration : 750,
					easing : 'linear',
					queue : false
				}
			});
			// filter items when filter link is clicked
			$('#filters a').click(function() {
				var selector = $(this).attr('data-filter');
				$container.isotope({
					filter : selector
				});
				return false;
			});
		});

		$
				.ajax({
					url : "pamela/mood/all",
					type : "GET",
					dataType : "json",
					cache : true,
					async : false,
					success : function(data, textStatus, jqXHR) {
						// success message
						$(data)
								.each(
										function(index, element) {
											var option = '<li><a href="javascript:void(0)" data-filter=".'
													+ element
													+ '">'
													+ element.toUpperCase()
													+ '</a></li>';
											$("#filters").append(option);
										});
					},
					error : function(jqXHR, textStatus, error) {
						// fail message
						alert(textStatus);
					}
				});

		if (sessionStorage.getItem("thumbnailLinks") == null) {
			$.ajax({
				url : "pamela/image/all",
				type : "GET",
				dataType : "json",
				cache : true,
				async : false,
				success : function(data, textStatus, jqXHR) {
					// success message
					sessionStorage.setItem("thumbnailLinks", JSON
							.stringify(data));
					appendThumbnails();
				},
				error : function(jqXHR, textStatus, error) {
					// fail message
					alert(textStatus);
				}
			});
		} else {
			appendThumbnails();
		}
		function appendThumbnails() {
			var data = JSON.parse(sessionStorage.getItem("thumbnailLinks"));
			$(data)
					.each(
							function(index, element) {
								var name = element.substring(element
										.indexOf("-") + 1);
								var pattern = /-([a-zA-Z]{1,})-/;
								var mood = pattern.exec(name);
								var image = '<div class="' + mood[1] + ' item ">'
										+ '<a href="images/uploadedFile/' + name + '" class="lighterbox">'
										+ '<img src="images/uploadedFile/' + element + '" alt="" />'
										+ '</a>'
										+ '<p>'
										+ name
										+ '</p>'
										+ '</div>';
								$("#gallery").append(image);
							});
			$(".lighterbox").lighterbox({
				overlayColor : "black",
				overlayOpacity : "0.3"
			});
			$('div#loadmoreajaxloader').hide();
		}
	</script>

</body>
</html>
