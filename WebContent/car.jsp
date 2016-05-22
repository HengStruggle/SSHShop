<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>岳衡杂货铺</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="YueHeng`s Shop" />
<meta name="keywords"
	content="blur, css3, transition, jquery, box shadow, text shadow, articles, scale, transform, animation" />
<meta name="author" content="CaiYueheng" />

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<!-- Font Awesome CSS -->
<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
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
				<div class="navbar-brand">岳衡杂货铺</div>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="goShop.action">店铺首页</a></li>
					<li class="active"><a href="javascript:void(0);">我的购物车</a></li>
					<li><a href="javascript:void(0);">用户信息</a></li>
					<s:if test="#session.admin == 1">
						<li><a href="goShopManageAction.action">后台管理</a></li>
					</s:if>
					<li><a href="logout.action">注销</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<h1 style="text-align: center;">
			<span><s:property value="#session.username"></s:property> 的购物车</span>
		</h1>

		<s:if test="#session.car.isEmpty">
			<h3 style="text-align: center;">购物车里面没有商品</h3>！
		</s:if>
		<s:else>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品厂商</th>
						<th>商品价格</th>
						<th>移除该商品</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator var="com" value="#session.car">
						<tr>
							<td>${com.commodityId}</td>
							<td>${com.commodityName}</td>
							<td>${com.manufacturer}</td>
							<td>${com.fcPrice}元</td>
							<td ><a
								href="deleteFromCar.action?commodityID=${com.commodityId}">移除</a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:else>
	</div>
</body>
</html>
