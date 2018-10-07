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
<title>地点分布</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		隐患统计 <span class="c-gray en">&gt;</span>地点分布 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="page-container">
		<div class="f-14 c-error" align="center"></div>
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
	<script type="text/javascript">
		$(function() {
			
			var series=[];
			$
			.ajax({
				url : "${pageContext.request.contextPath }/hiddenDanger_getPlaceCount.action",
				data : {},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(data) {
					//var data = JSON.parse(JSON.stringify(httpdata));
					//alert(data[0].place_name);
					console.log(1);
					if (data != null
							&& data.length > 0) {
						data
								.forEach(function(
										i,
										index) {
									var node =[i.place.place_name,i.totalCount];
									series
											.push(node);
								});
						
						$('#container')
								.highcharts(
										{
											chart : {
												plotBackgroundColor : null,
												plotBorderWidth : null,
												plotShadow : false
											},
											title : {
												text : '2018年地点隐患发生情况'
											},
											tooltip : {
												pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
											},
											plotOptions : {
												pie : {
													allowPointSelect : true,
													cursor : 'pointer',
													dataLabels : {
														enabled : true,
														color : '#000000',
														connectorColor : '#000000',
														format : '<b>{point.name}</b>: {point.percentage:.1f} %'
													}
												}
											},
											series :[{
												type:'pie',
												name:'测试',
												data:series
											}]
										});
						
						
					}
				}
			});
			
		});
	</script>
</body>
</html>