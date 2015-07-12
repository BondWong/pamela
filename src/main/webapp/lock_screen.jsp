<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--meta_title start-->
<%@ include file="templates/meta_title.jsp"%>
<!--meta_title end-->
<!--error page common css-->
<%@ include file="templates/sub_page_common_css.jsp"%>
<!--error page common css-->
</head>

<body class="lock-screen" onload="startTime()">

	<div class="lock-wrapper">

		<div id="time"></div>


		<div class="lock-box text-center">
			<div class="lock-name">Jonathan Smith</div>
			<img src="images/lock_thumb.jpg" alt="lock avatar" />
			<div class="lock-pwd">
				<form role="form" class="form-inline" action="index.jsp">
					<div class="form-group">
						<input type="password" placeholder="Password"
							id="exampleInputPassword2" class="form-control lock-input">
						<button class="btn btn-lock" type="submit">
							<i class="fa fa-arrow-right"></i>
						</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<script>
		function startTime() {
			var today = new Date();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			// add a zero in front of numbers<10
			m = checkTime(m);
			s = checkTime(s);
			document.getElementById('time').innerHTML = h + ":" + m + ":" + s;
			t = setTimeout(function() {
				startTime()
			}, 500);
		}

		function checkTime(i) {
			if (i < 10) {
				i = "0" + i;
			}
			return i;
		}
	</script>
</body>
</html>
