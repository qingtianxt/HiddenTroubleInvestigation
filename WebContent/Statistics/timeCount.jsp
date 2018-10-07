<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>3D柱状图</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		统计管理 <span class="c-gray en">&gt;</span> 每月隐患发生数量 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="f-14 c-error"></div>
		<div id="container" style="min-width: 700px; height: 400px"></div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
	<script type="text/javascript">
		﻿$(function() {
			var series = [];
			$
					.ajax({
						url : "${pageContext.request.contextPath }/hiddenDanger_getTimeCount.action",
						data : {},
						type : "POST",
						dataType : "json",
						async : false,
						success : function(data) {
							//var data = JSON.parse(JSON.stringify(httpdata));
							//alert(data[0].place_name);
							if (data != null && data.length > 0) {
								data.forEach(function(i, index) {
									series.push(i);
								});

								// Set up the chart
								var chart = new Highcharts.Chart(
										{
											chart : {
												renderTo : 'container',
												type : 'column',
												margin : 75,
												options3d : {
													enabled : true,
													alpha : 15,
													beta : 15,
													depth : 50,
													viewDistance : 25
												}
											},
											title : {
												text : '每月隐患发生数量统计'
											},
											subtitle : {
												text : ''
											},
											plotOptions : {
												column : {
													depth : 25
												}
											},
											plotOptions : {
												column : {
													colorByPoint : true
												}
											},
											series : [ {
												data : series
											} ]
										});

							}
						}
					});

			// Activate the sliders
			$('#R0').on('change', function() {
				chart.options.chart.options3d.alpha = this.value;
				showValues();
				chart.redraw(false);
			});
			$('#R1').on('change', function() {
				chart.options.chart.options3d.beta = this.value;
				showValues();
				chart.redraw(false);
			});

			function showValues() {
				$('#R0-value').html(chart.options.chart.options3d.alpha);
				$('#R1-value').html(chart.options.chart.options3d.beta);
			}
			showValues();
		});
	</script>
</body>
</html>