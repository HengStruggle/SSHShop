<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户信息管理</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="YueHeng`s Shop" />
<meta name="keywords"
	content="blur, css3, transition, jquery, box shadow, text shadow, articles, scale, transform, animation" />
<meta name="author" content="CaiYueheng" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath %>/css/bootstrap.css" />
<!-- Font Awesome CSS -->
<link href="<%=basePath %>/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="<%=basePath %>/css/style.css" />

<script type="text/javascript" src="<%=basePath %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/bootstrap.js"></script>
</head>
<body class="index">

	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="navbar-brand">用户信息管理</div>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="goShop.action">店铺首页</a></li>
					<li><a href="javascript:void(0);">我的购物车</a></li>
					<li class="active"><a href="javascript:void(0);">用户信息</a></li>
					<s:if test="#session.admin == 1">
						<li><a href="goShopManageAction.action">后台管理</a></li>
					</s:if>
					<li><a href="javascript:void(0);">注销</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-tabs nav-stacked" data-spy="affix"
					data-offset-top="125">
					<li class="active"><a href="#">个人信息</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">修改密码</a></li>
				</ul>

			</div>

		</div>
	</div>
</body>
</html>
