<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
	<div id="sidebar" class="nav-collapse">
		<!-- sidebar menu start-->
		<div class="leftside-navigation">
			<ul class="sidebar-menu" id="nav-accordion">
				<li><a class="active" href="index.jsp"> <i
						class="fa fa-dashboard"></i> <span>His Status</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-envelope"></i> <span>Diary </span>
				</a>
					<ul class="sub">
						<li><a href="diary_compose.jsp">Compose</a></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-envelope"></i> <span>Category </span>
						</a>
							<ul class="sub" id="mood_category">
							</ul></li>
					</ul></li>
				<li><a href="gallery.jsp"> <i class="fa fa-picture-o"></i>
						<span>Gallery</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;"> <i
						class="fa fa-glass"></i> <span>Extra</span>
				</a>
					<ul class="sub">
						<li><a href="lock_screen.jsp">Lock Screen</a></li>
						<li><a href="404.jsp">404 Error</a></li>
						<li><a href="500.jsp">500 Error</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- sidebar menu end-->
	</div>
</aside>