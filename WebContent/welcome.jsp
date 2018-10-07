<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>大学校园隐患排查</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/lib/layui/images/welcome/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/lib/layui/images/welcome/global.css" media="all">
<script src="${pageContext.request.contextPath }/lib/layui/images/welcome/hm.js"></script>
<link id="layuicss-skincodecss" rel="stylesheet" href="${pageContext.request.contextPath }/lib/layui/images/welcome/code.css" media="all">
<link rel="preload" href="${pageContext.request.contextPath }/lib/layui/images/welcome/integrator.js" as="script">
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/layui/images/welcome/integrator.js"></script>
<link id="layuicss-layer" rel="stylesheet"
	href="${pageContext.request.contextPath }/lib/layui/images/welcome/layer.css" media="all">
<style>
.version {
	font-size: 20px;
	margin: 10px;
	color: #fff;
	font-weight: 400;
}
</style>
</head>
<body class="site-home" >
	<div class="site-banner">
		<div class="site-banner-bg"
			style="background-image: url('${pageContext.request.contextPath }/lib/layui/images/welcome/timg.jpg'); background-size: cover;">
		</div>
		<div class="site-banner-main">
			<div class="site-zfj site-zfj-anim">
				<i class="layui-icon" style="color: #fff;color:rgba(255,255,255,.7)">&#xe609;</i>
			</div>
			<div class="layui-anim site-desc site-desc-anim">
				<h1 style="font-size:60px;color:#ffffff;text-align: center">欢迎使用校园隐患排查后台系统</h1>
				<cite>实现学校安全管理的标准化、规范化、信息化，同时增强学生校园隐患排查意识，增强隐患处理知识储备。</cite>
			</div>
			<div class="site-download"></div>
			<div class="site-version">
				<span>当前版本：<cite class="site-showv">1.0</cite></span> 
				<span><a
					href="https://www.layui.com/doc/base/changelog.html" rel="nofollow"
					target="_blank">更新日志</a></span> <span>下载量：<em
					class="site-showdowns">****</em>
					</span>
			</div>

		</div>
	</div>
	<div class="layui-main">



		<ul class="site-idea">
			<li>
				<fieldset class="layui-elem-field layui-field-title">
					<legend>基本信息</legend>
					<!-- <p>身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。</p>-->
					<p>基本信息包括，用户信息、地点信息、隐患信息等等的增删改查；包括排查，自查标准的设定，等级划分依据等。。</p>
				</fieldset>
			</li>

			<li>
				<fieldset class="layui-elem-field layui-field-title">
					<legend>分析预警</legend>
					<p>用各类可视化图表显示，一目了然的看出不同时间，不同地点，不同等级的隐患的分布状况。在大量数据的支持下，必然能够做到相应的预警功能！</p>
				</fieldset>
			</li>
		</ul>

	</div>
	<div class="layui-footer footer footer-index">
		<div class="layui-main">
			<p>2018.9.19</p>
			<p>
				<a href="" target="_blank">使用说明</a> <a href="" target="_blank">支持</a>
				<a href="">联系</a> <a href="" target="_blank" rel="nofollow">GitHub</a>
			</p>

		</div>
	</div>				  
	<script async="" src="${pageContext.request.contextPath }/lib/layui/images/welcome/adsbygoogle.js"></script>
	<div class="site-tree-mobile layui-hide">
		<i class="layui-icon"></i>
	</div>
	<div class="site-mobile-shade"></div>
	<script src="${pageContext.request.contextPath }/lib/layui/images/welcome/layui.js" charset="utf-8"></script>
	<script>
		window.global = {
			pageType : 'index',
			preview : function() {
				var preview = document.getElementById('LAY_preview');
				return preview ? preview.innerHTML : '';
			}()
		};
		layui.config({
			base : '//res.layui.com/static/lay/modules/layui/',
			version : '1535898708529'
		}).use('global');
	</script>

	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>



	<ul class="layui-fixbar">
		<li class="layui-icon" lay-type="bar1" style=""></li>
		<li class="layui-icon layui-fixbar-top" lay-type="top"
			style="display: none;"></li>
	</ul>
</body>
</html>