<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--meta_title start-->
<%@ include file="templates/meta_title.jsp"%>
<!--meta_title end-->
<!--Core CSS -->
<link href="bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<style>
.ronmatic_text {
	color: rgb(241, 125, 128);
}
</style>
</head>

<body class="login-body">

	<div class="container">

		<form class="form-signin" method="post" id="signin-form">
			<h2 class="form-signin-heading">sign in now</h2>
			<div class="login-wrap">
				<div class="user-login-info">
					<input type="text" class="form-control" placeholder="ID I gave you"
						autofocus required id="name"> <input type="password"
						class="form-control" placeholder="Password I told you"
						id="password" required autofocus>
				</div>
				<label class="checkbox"> <input type="checkbox"
					id="remember-me"> Remember me <span class="pull-right">
						<a data-toggle="modal" href="#myModal"> Forgot Password?</a>

				</span>
				</label>
				<button class="btn btn-lg btn-login btn-block" type="submit"
					id="form_submit_button">Sign in</button>

				<!-- <div class="registration">
					Don't have an account yet? <a class="" href="registration.jsp">
						Create an account </a>
				</div> -->

			</div>

			<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
				tabindex="-1" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Forgot Password ?</h4>
						</div>
						<div class="modal-body">
							<p>
								Contact your <span class="ronmatic_text">boyfriend</span> for
								help :)
							</p>
							<!-- <input type="text" name="email" placeholder="Email"
								autocomplete="off" class="form-control placeholder-no-fix"> -->

						</div>
						<div class="modal-footer">
							<!-- <button data-dismiss="modal" class="btn btn-default"
								type="button">Cancel</button> -->
							<button class="btn btn-success" type="button"
								data-dismiss="modal">OK</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal -->

		</form>

	</div>



	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="js/jquery.js"></script>
	<script src="bs3/js/bootstrap.min.js"></script>
	<script>
		$("#signin-form").submit(function(e) {
			e.preventDefault();
			var name = $("#name").val();
			var password = $("#password").val();
			var remember_me = $("#remember-me").is(":checked");

			$.ajax({
				url : "pamela/account/login",
				type : "POST",
				data : JSON.stringify({
					"name" : name,
					"password" : password,
					"remember-me" : remember_me
				}),
				contentType : "application/json",
				cache : false,
				async : false,
				success : function(data, textStatus, jqXHR) {
					// success message
					window.location.href = data;
				},
				error : function(jqXHR, textStatus, error) {
					// fail message
					console.log(error);
				}

			});

		});
	</script>

</body>
</html>
