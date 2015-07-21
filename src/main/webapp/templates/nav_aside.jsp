<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside>
	<div id="sidebar" class="nav-collapse">
		<!-- sidebar menu start-->
		<div class="leftside-navigation">
			<ul class="sidebar-menu" id="nav-accordion">
				<li><a href="index.jsp" id="nav_index"> <i
						class="fa fa-dashboard"></i> <span>Beloved One Status</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;" id="diary_parent">
						<i class="fa fa-file-text"></i> <span>Diary </span>
				</a>
					<ul class="sub" id="diary_tools">
						<li><a href="diary_compose.jsp" id="nav_diary_compose"><i
								class="fa fa-pencil-square-o"></i>Compose</a></li>
						<li class="sub-menu"><a href="javascript:;"
							id="category_parent"> <i class="fa fa-folder-open"></i> <span>Category
							</span>
						</a>
							<ul class="sub" id="mood_category">
							</ul></li>
					</ul></li>
				<li><a href="gallery.jsp" id="nav_gallery"> <i
						class="fa fa-picture-o"></i> <span>Gallery</span>
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