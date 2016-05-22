<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Shop System">
<meta name="author" content="CaiYueheng">

<title>My Shop</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="fonts-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="index">

	<s:include value="message.jsp"></s:include>

	<!-- Header -->
	<header>
	<div class="container">
		<div class="intro-text">
			<div class="intro-lead-in">Welcome To My Shop!</div>
			<div class="intro-heading">It's Nice To Meet You</div>
			<div class="row">
				<button style="margin-top: 50px"
					class="col-md-2 col-md-offset-3 btn btn-primary btn-lg"
					data-toggle="modal" data-target="#user_login">登录</button>
				<button style="margin-top: 50px"
					class="col-md-2 col-md-offset-2 btn btn-primary btn-lg"
					data-toggle="modal" data-target="#user_register">注册</button>
			</div>

			<div id="nav_left" style="margin-top: 120px">
				<h5>网络商城系统 | JavaEE课程设计</h5>
				<h5>13级计科一班&nbsp;&nbsp;蔡岳衡&nbsp;&nbsp;3113005717</h5>
			</div>
		</div>
	</div>
	</header>

	<div class="modal modal_align fade bs-example-modal-lg" id="user_login"
		tabindex="-1" role="dialog" aria-labelledby="loginLabel"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="loginLabel" style="text-align: center;">
						用户登录</h4>
				</div>

				<form action="login" class="form-horizontal" method="post"
					role="form">
					<div class="modal-body">
						<div class="form-group text-center">
							<input type="radio" name="user.admin" value="true" />
							管理员&nbsp;&nbsp; <input type="radio" checked="checked"
								name="user.admin" value="false" /> 普通用户
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="inputName">用户名</label>
							<div class="col-md-6">
								<input name="user.username" type="text" class="form-control"
									id="inputName" placeholder="请输入登录的用户名">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for="inputPassword">密码</label>
							<div class="col-md-6">
								<input name="user.password" type="password" class="form-control"
									id="inputPassword" placeholder="请输入登录的密码">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<div class="row">
							<button type="submit"
								class="col-md-3 col-md-offset-3 btn btn-primary">登录</button>
							<button type="button" class="col-md-3 btn btn-default"
								data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>



	<div class="modal modal_align fade bs-example-modal-lg"
		id="user_register" tabindex="-1" role="dialog"
		aria-labelledby="RegisterationLabel" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="loginLabel" style="text-align: center;">
						用户注册</h4>
				</div>

				<form action="registration" class="form-horizontal" method="post"
					role="form">
					<div class="modal-body">

						<div class="form-group">
							<label class="col-md-3 control-label" for="inputName">用户名</label>
							<div class="col-md-6">
								<input name="username" type="text" class="form-control"
									id="inputName" placeholder="请输入要注册的用户名">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for="inputPassword">密码</label>
							<div class="col-md-6">
								<input name="password" type="password" class="form-control"
									id="inputPassword" placeholder="请输入要注册的密码">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for="conformPassword">确认密码</label>
							<div class="col-md-6">
								<input name="confirm_password" type="password"
									class="form-control" id="conformPassword" placeholder="确认输入的密码">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<div class="row">
							<button type="submit"
								class="col-md-3 col-md-offset-3 btn btn-primary">注册</button>
							<button type="button" class="col-md-3 btn btn-default"
								data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>

</body>

</html>
