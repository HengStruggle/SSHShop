<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>岳衡杂货铺后台管理</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="YueHeng`s ShopManage" />
<meta name="author" content="CaiYueheng" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.css" />
<!-- Font Awesome CSS -->
<link href="<%=basePath%>/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/style.css" />

<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap.js"></script>
</head>
<body data-spy="scroll" data-target="#scrollspy">

	<div style="color: red">
		<s:fielderror />
	</div>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
					<li><a href="car.jsp">我的购物车</a></li>
					<li><a href="javascript:void(0);">用户信息</a></li>
					<s:if test="#session.admin == 1">
						<li class="active"><a href="goShopManageAction.action">后台管理</a></li>
					</s:if>
					<li><a href="logout.action">注销</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<header class="jumbotron subhead">
		<div class="container">
			<h1>杂货铺后台管理</h1>
			<p class="lead">管理商品种类、全部商品、全部订单</p>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="scrollspy">
				<ul class="nav nav-tabs nav-stacked " data-spy="affix"
					data-offset-top="250">
					<li><a data-toggle="modal" data-target="#addCommodityClass">新增商品种类</a></li>
					<li class="active"><a href="#commodityClassList">查看商品种类列表</a></li>
					<li><a data-toggle="modal" data-target="#addCommodity">商品录入</a></li>
					<li><a href="#commodityList">查看商品列表</a></li>
					<li><a href="#">订单状态列表</a></li>
				</ul>
			</div>

			<div class="col-md-10">
				<h2 id="commodityClassList">商品种类列表</h2>
				<s:if test="commodityClasses==null">
					<h3 style="text-align: center;">系统当前没有商品种类!</h3>
				</s:if>
				<s:else>
					<table
						class="table table-striped table-bordered  table-hover">
						<thead>
							<tr>
								<th>商品种类编号</th>
								<th>商品种类名称</th>
								<th>修改种类名称</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator var="com" value="commodityClasses">
								<tr>
									<td>${com.commodityClassId}</td>
									<td>${com.commodityClassName}</td>
									<td><a data-toggle="modal"
										data-target="#commodityClass-${com.commodityClassId}">修改</a></td>
								</tr>

								<div class="modal modal_align fade bs-example-modal-lg"
									id="commodityClass-${com.commodityClassId}" tabindex="-1"
									role="dialog"
									aria-labelledby="commodityClass-${com.commodityClassId}Label"
									style="display: none;">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="loginLabel"
													style="text-align: center;">修改商品种类名称</h4>
											</div>

											<form action="updateCommodityClass" class="form-horizontal"
												method="post" role="form">
												<div class="modal-body">

													<fieldset disabled>
														<div class="form-group">
															<label for="commodityClassId"
																class="col-md-4 control-label">商品种类编号</label>
															<div class="col-md-8">
																<input name="commodityClassID" type="text"
																	class="form-control" id="commodityClassId"
																	placeholder="${com.commodityClassId}">
															</div>
														</div>
													</fieldset>

													<div class="form-group">
														<label class="col-md-4 control-label" for="inputName">商品种类名称</label>
														<div class="col-md-8">
															<input name="commodityClassName" type="text"
																class="form-control" id="inputName"
																placeholder="请输入修改后的商品种类">
														</div>
													</div>

												</div>
												<div class="modal-footer">
													<div class="row">
														<button type="submit"
															class="col-md-3 col-md-offset-3 btn btn-primary">确定修改</button>
														<button type="button" class="col-md-3 btn btn-default"
															data-dismiss="modal" aria-hidden="true">取消</button>
													</div>
												</div>
											</form>
										</div>
									</div>

								</div>

							</s:iterator>
						</tbody>
					</table>
				</s:else>

				<h2 id="commodityList">商品列表</h2>
				<s:if test="commodities==null">
					<h3 style="text-align: center;">系统当前没有商品!</h3>
				</s:if>
				<s:else>
					<table class="table table-condensed table-bordered  table-hover">
						<thead>
							<tr>
								<th>商品编号</th>
								<th>商品名称</th>
								<th>商品种类</th>
								<th>商品厂商</th>
								<th>商品价格</th>
								<th>本店价格</th>
								<th>全部数量</th>
								<th>剩余数量</th>
								<th>上架时间</th>
								<th>编辑商品</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator var="commodity" value="commodities">
								<tr>
									<td style="width: 8%;">${commodity.commodityId}</td>
									<td style="width: 20%;">${commodity.commodityName}</td>
									<td style="width: 8%;">${commodity.commodityClass.commodityClassName}</td>
									<td style="width: 8%;">${commodity.manufacturer}</td>
									<td style="width: 8%;">${commodity.commodityPrice}元</td>
									<td style="width: 8%;">${commodity.fcPrice}元</td>
									<td style="width: 8%;">${commodity.commodityAmount}</td>
									<td style="width: 8%;">${commodity.commodityLeaveNum}</td>
									<td style="width: 8%;"><s:date name="regTime"
											format="yyyy-MM-dd" />
									<td style="width: 8%;"><a data-toggle="modal"
										data-target="#commodity-${commodity.commodityId}">修改</a> <a
										href="commodityDelete.action?commodityID=${commodity.commodityId}">移除</a>
									</td>
								</tr>

								<!-- 商品信息Modal -->
								<div class="modal modal_align fade bs-example-modal-lg"
									id="commodity-${commodity.commodityId}" tabindex="-1"
									role="dialog"
									aria-labelledby="commodity-${commodity.commodityId}"
									style="display: none;">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title">修改商品信息</h4>
											</div>
											<form class="form-horizontal" role="form"
												action="updateCommodity" method="post"
												enctype="multipart/form-data">
												<div class="modal-body">
													<div class="row">
														<div class="col-md-4">
															<div class="row">
																<img class="center-block"
																	src="showImg.action?commodityID=${commodity.commodityId}"
																	alt="" />
															</div>
														</div>

														<div class="col-md-8"
															style="font-size: 18px; text-align: center;">

																<div class="form-group">
																	<label for="commodityId" class="col-sm-4 control-label">商品编号</label>
																	<div class="col-sm-8">
																		<input name="commodityID" type="text"
																			class="form-control" id="commodityId"
																			value="${commodity.commodityId}">
																	</div>
																</div>

															<div class="form-group">
																<label for="commodityName"
																	class="col-md-4 control-label">商品名称</label>
																<div class="col-md-8">
																	<input name="commodityName" type="text"
																		class="form-control" id="commodityName"
																		value="${commodity.commodityName}">
																</div>
															</div>

															<div class="row">
																<div class="form-group">
																	<label for="commodityClass_1"
																		class="col-md-3 col-md-offset-1 control-label ">商品种类</label>
																	<select id="commodityClass_1" name="commodityClassID"
																		class="col-md-6">
																		<option value="${c.commodityClassId}">${commodity.commodityClass.commodityClassName}</option>
																		<s:iterator value="commodityClasses" var="c">
																			<option value="${c.commodityClassId}">
																				${c.commodityClassName}</option>
																		</s:iterator>
																	</select>
																</div>
															</div>

															<div class="form-group">
																<label for="manufacturer" class="col-md-4 control-label">生产厂商</label>
																<div class="col-md-8">
																	<input name="manufacturer" type="text"
																		class="form-control" id="manufacturer"
																		value="${commodity.manufacturer}">
																</div>
															</div>

															<div class="form-group">
																<label for="commodityAmount"
																	class="col-md-4 control-label">商品总量</label>
																<div class="col-md-8">
																	<input name="commodityAmount" type="text"
																		class="form-control" id="commodityAmount"
																		value="${commodity.commodityAmount}">
																</div>
															</div>

															<div class="form-group">
																<label for="commodityLeaveNum"
																	class="col-md-4 control-label">剩余数量</label>
																<div class="col-md-8">
																	<input name="commodityLeaveNum" type="text"
																		class="form-control" id="commodityLeaveNum"
																		value="${commodity.commodityLeaveNum}">
																</div>
															</div>

															<div class="form-group">
																<label for="commodityPrice"
																	class="col-md-4 control-label">商品价格</label>
																<div class="col-md-8">
																	<input name="commodityPrice" type="text"
																		class="form-control" id="commodityPrice"
																		value="${commodity.commodityPrice}">
																</div>
															</div>

															<div class="form-group">
																<label for="fcPrice" class="col-md-4 control-label">杂货铺价格</label>
																<div class="col-md-8">
																	<input name="fcPrice" type="text" class="form-control"
																		id="fcPrice" value="${commodity.fcPrice}">
																</div>
															</div>

															<div class="form-group">
																<label for="inputfile" class="col-md-4 control-label">
																	更改图片</label>
																<div class="col-md-8">
																	<input name="uploadImage" type="file" id="inputfile">
																</div>
															</div>

														</div>
													</div>

													<div class="row"
														style="margin-left: 20px; margin-right: 20px;">
														<div class="form-group">
															<label for="commodityDepict">商品描述</label>
															<textarea id="commodityDepict" name="commodityDepict"
																class="form-control" rows="5" >${commodity.commodityDepict}</textarea>
														</div>
													</div>
												</div>

												<div class="modal-footer" style="font-size: 18px;">
													<div class="row">
														<input type="submit"
															class="col-md-3 col-md-offset-3   btn btn-primary"
															value="确定修改" />
														<button type="button"
															class="col-md-3 col-md-offset-1 btn btn-primary"
															data-dismiss="modal">关闭</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Modal end -->

							</s:iterator>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pager">
							<s:if test="commodityPage.hasPrePage">
								<li><a
									href="goShopManageAction.action?commoditiesCurrentPage=1"
									class="">首页</a></li>
								<li><a
									href="goShopManageAction.action?commoditiesCurrentPage=${commoditiesCurrentPage - 1}">
										上一页</a></li>
							</s:if>
							<s:else>
								<li class="disabled"><a href="javascript:void(0);">首页</a></li>
								<li class="disabled"><a href="javascript:void(0);">上一页</a></li>
							</s:else>
							<s:if test="commodityPage.hasNextPage">
								<li><a
									href="goShopManageAction.action?commoditiesCurrentPage=${commoditiesCurrentPage+ 1}">下一页</a></li>
								<li><a
									href="goShopManageAction.action?commoditiesCurrentPage=${commodityPage.totalPage}">
										尾页</a></li>
							</s:if>
							<s:else>
								<li class="disabled"><a href="javascript:void(0);"> 下一页</a></li>
								<li class="disabled"><a href="javascript:void(0);">尾页</a></li>
							</s:else>
						</ul>
					</div>
				</s:else>
			</div>
		</div>
	</div>

	<div class="modal modal_align fade bs-example-modal-lg"
		id="addCommodityClass" tabindex="-1" role="dialog"
		aria-labelledby="addCommodityClassLabel" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addCommodityClassLabel"
						style="text-align: center;">增加商品种类</h4>
				</div>

				<form action="CommodityAdd.action" class="form-horizontal"
					method="post" role="form">
					<div class="modal-body">

						<div class="form-group">
							<label class="col-md-3 control-label" for="inputName">种类名称</label>
							<div class="col-md-6">
								<input name="commodityClassName" type="text"
									class="form-control" id="inputName" placeholder="请输入要增加的商品种类名称">
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<div class="row">
							<button type="submit"
								class="col-md-3 col-md-offset-3 btn btn-primary">确定增加</button>
							<button type="button" class="col-md-3 btn btn-default"
								data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<div class="modal modal_align fade bs-example-modal-lg"
		id="addCommodity" tabindex="-1" role="dialog"
		aria-labelledby="addCommodityLabel" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addCommodityLabel"
						style="text-align: center;">录入商品</h4>
				</div>

				<form action="addCommodity" class="form-horizontal" method="post"
					role="form" enctype="multipart/form-data">
					<div class="modal-body text-center">

						<div class="form-group">
							<label for="CommodityName" class="col-md-4 control-label">商品名称</label>
							<div class="col-md-6">
								<input name="commodityName" type="text" class="form-control"
									id="CommodityName" placeholder="请输入要录入商品的名称">
							</div>
						</div>

						<div class="form-group">
							<label for="commodityClass_2"
								class="col-md-4 control-label text-center">商品种类</label> <select
								id="commodityClass_2" name="commodityClassID" class="col-md-6">
								<option value=""></option>
								<s:iterator value="commodityClasses" var="c">
									<option value="${c.commodityClassId}">
										${c.commodityClassName}</option>
								</s:iterator>
							</select>
						</div>

						<div class="form-group">
							<label for="Manufacturer" class="col-md-4 control-label">生产厂商</label>
							<div class="col-md-6">
								<input name="manufacturer" type="text" class="form-control"
									id="Manufacturer" placeholder="请输入要录入商品的生产厂商">
							</div>
						</div>

						<div class="form-group">
							<label for="CommodityAmount" class="col-md-4 control-label">商品总量</label>
							<div class="col-md-8">
								<input name="commodityAmount" type="text" class="form-control"
									id="CommodityAmount" placeholder="请输入要录入商品的商品总量">
							</div>
						</div>

						<div class="form-group">
							<label for="CommodityLeaveNum" class="col-md-4 control-label">剩余数量</label>
							<div class="col-md-6">
								<input name="commodityLeaveNum" type="text" class="form-control"
									id="CommodityLeaveNum" placeholder="请输入要录入商品的剩余数量">
							</div>
						</div>

						<div class="form-group">
							<label for="CommodityPrice" class="col-md-4 control-label">商品价格</label>
							<div class="col-md-6">
								<input name="commodityPrice" type="text" class="form-control"
									id="CommodityPrice" placeholder="请输入要录入商品的价格">
							</div>
						</div>

						<div class="form-group">
							<label for="FcPrice" class="col-md-4 control-label">杂货铺价格</label>
							<div class="col-md-6">
								<input name="fcPrice" type="text" class="form-control"
									id="FcPrice" placeholder="请输入要录入商品在本杂货铺的价格}">
							</div>
						</div>

						<div class="form-group">
							<label for="inputfile" class="col-md-4 control-label">
								商品图片</label>
							<div class="col-md-6">
								<input name="uploadImage" type="file" id="inputfile">
							</div>
						</div>

						<div class="row" style="margin-left: 20px; margin-right: 20px;">
							<div class="form-group">
								<label>商品描述</label>
								<textarea name="commodityDepict" class="form-control" rows="5">请输入要录入商品的商品描述</textarea>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<div class="row">
							<button type="submit"
								class="col-md-3 col-md-offset-3 btn btn-primary">确定增加</button>
							<button type="button" class="col-md-3 btn btn-default"
								data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
