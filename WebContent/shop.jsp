<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

<link rel="stylesheet" type="text/css" href="css/floatmenu.css" />

<link rel="stylesheet" type="text/css" href="css/style.css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="js/jquery.appear.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/template.js"></script>
<script src="js/floatmenu.js"></script>
<script type="text/javascript">	
	$(function(){
		//初始化菜单
		menuInitialize();	
	});
</script>
</head>
<body class="index">
	<s:include value="message.jsp"></s:include>

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
					<li class="active"><a href="goShop.action">店铺首页</a></li>
					<li><a href="car.jsp">我的购物车</a></li>
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
			<span>欢迎光临岳衡杂货铺</span>

		</h1>
		<s:if test="#session.username != null">
			<h4 style="float: right;">
				欢迎 <a href="userManage.action"><s:property
						value="#session.username"></s:property></a>
			</h4>
			<br>
		</s:if>
		<s:else>
			<h4 style="float: right;">
				<a href="index.jsp">&emsp;登录</a>
			</h4>
			<br>
		</s:else>

		<div class="row text-center">

			<h2>
				<s:if test="#session.commoditiesClassName == null">
					最新商品
				</s:if>
				<s:else>
					<s:property value="#session.commoditiesClassName"></s:property>
				</s:else>
			</h2>

			<s:iterator value="commodities" var="commodity">
				<div class="col-md-4 "
					style="margin-top: 20px; margin-bottom: 20px;">

					<div class="overlay-container">
						<img class="center-block" width="80%" height="80%"
							src="showImg.action?commodityID=${commodity.commodityId}" alt="" />
						<a class="overlay" data-toggle="modal"
							data-target="#commodity-${commodity.commodityId}"> <i
							class="fa fa-search-plus"></i> <span>${commodity.commodityName}</span>
						</a>
					</div>
					<a class="btn btn-default btn-block" data-toggle="modal"
						data-target="#commodity-${commodity.commodityId}">${commodity.commodityName}</a>

					<!-- 商品信息Modal -->
					<div class="modal modal_align fade bs-example-modal-lg"
						id="commodity-${commodity.commodityId}" tabindex="-1"
						role="dialog" aria-labelledby="commodity-${commodity.commodityId}"
						style="display: none;">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title"
										id="project-${commodity.commodityId}-label">${commodity.commodityName}</h4>
								</div>

								<div class="modal-body">
									<div class="row">
										<div class="col-md-4">
											<img class="center-block" style=""
												src="showImg.action?commodityID=${commodity.commodityId}"
												alt="" />
										</div>
										<div class="col-md-8" style="font-size: 18px;">
											<h3
												style="margin-left: 20px; margin-top: 20px; margin-bottom: 20px;">
												<span>${commodity.commodityName}</span>
											</h3>
											<b>生成厂商:</b><span>${commodity.manufacturer}</span><br /> <b>商品编号:</b><span>${commodity.commodityId}</span><br />
											<b>商品总量:</b><span>${commodity.commodityAmount}</span> <br />
											<b>剩余数量:</b><span>${commodity.commodityLeaveNum}</span><br />
											<b>上架时间:</b><span><s:date name="#commodity.RegTime"
													format="yyyy年MM月dd日" /></span><br /> <b>商品价格:</b><span><del
													style="color: #999999;"> ${commodity.commodityPrice}</del>
												${commodity.fcPrice}元</span>
										</div>
									</div>

									<div class="row" style="margin-left: 20px;">
										<div class="form-group">
											<label for="commodityDepict"><span>商品描述</span></label>
											<textarea name="commodityDepict" class="form-control"
												rows="5">${commodity.commodityDepict}</textarea>
										</div>
									</div>

								</div>

								<div class="modal-footer" style="font-size: 18px;">
									<div class="row">
										<form id="addToCarForm"
											action="addToCar.action?commodityID=${commodity.commodityId}"
											method="post">
											<input type="submit"
												class="col-md-3 col-md-offset-3   btn btn-primary"
												value="添加至购物车" />
										</form>
										<button type="button"
											class="col-md-3 col-md-offset-1 btn btn-primary"
											data-dismiss="modal">关闭</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal end -->
				</div>
			</s:iterator>
		</div>
		<div class="text-center">
			<ul class="pager">
				<s:if test="page.hasPrePage">
					<s:if test="commodityClassID ==null">
						<li><a href="goShop.action?currentPage=1" class="">首页</a></li>
						<li><a href="goShop.action?currentPage=${currentPage - 1}">
								上一页</a></li>
					</s:if>
					<s:else>
						<li><a href="showByClass.action?currentPage=1">首页</a></li>
						<li><a
							href="showByClass.action?currentPage=${currentPage - 1}"> 上一页</a></li>
					</s:else>
				</s:if>
				<s:else>
					<li class="disabled"><a href="javascript:void(0);">首页</a></li>
					<li class="disabled"><a href="javascript:void(0);">上一页</a></li>
				</s:else>
				<s:if test="page.hasNextPage">
					<s:if test="commodityClassID == null">
						<li><a href="goShop.action?currentPage=${currentPage + 1}">下一页</a></li>
						<li><a href="goShop.action?currentPage=${page.totalPage}">
								尾页</a></li>
					</s:if>
					<s:else>
						<li><a
							href="showByClass.action?currentPage=${currentPage + 1}">下一页</a></li>
						<li><a
							href="showByClass.action?currentPage=${page.totalPage}"> 尾页</a></li>
					</s:else>
				</s:if>
				<s:else>
					<li class="disabled"><a href="javascript:void(0);"> 下一页</a></li>
					<li class="disabled"><a href="javascript:void(0);">尾页</a></li>
				</s:else>
			</ul>
		</div>
	</div>



	<!--悬浮菜单-->
	<div class="float-open" id="float-open"
		style="left: -2px; top: 100px; background: url(img/history.png) no-repeat; background-size: 90% 90%; background-position: center;">
		<a class="open-btn" id="open-btn" href="javascript:void(0);">&gt;
		</a>
	</div>
	<div class="float-news" id="float-news"
		style="left: -450px; top: 75px; width: 250px; height: 500px">
		<a class="float-close" id="float-close"
			style="background: url(img/x.png) no-repeat; background-size: 100% 100%;"
			href="javascript:void(0);">X</a>
		<div class="commodityClasslist">
			<h3 style="text-align: center; vertical-align: middle">商品种类</h3>
			<ul>
				<s:iterator value="commodityClasses" var="commodityClass">
					<li style="text-align: left;"><a
						href="showByClass.action?commodityClassID= ${commodityClass.commodityClassId}">
							<s:property value="#commodityClass.commodityClassName"></s:property>
					</a></li>
				</s:iterator>
			</ul>
		</div>
	</div>

</body>
</html>
