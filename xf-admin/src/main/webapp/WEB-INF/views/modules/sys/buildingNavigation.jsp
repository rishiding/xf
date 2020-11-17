<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
<link href="${ctxStatic}/common/xf.min.css" type="text/css"
	rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	font-family: "微软雅黑";
}

#l-map {
	height: 300px;
	width: 100%;
}

#r-result, #r-result table {
	width: 100%;
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=e3S713ak0UZDsql6qC8whcyG7dL8n2q2"></script>
<title>导航详情</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

		$("img").click(function() {
			ll = layer.open({
				type : 2,
				title : '平面图预览',
				maxmin : true,
				area : [ '600px', '600px' ],
				content : this.src
			});
			layer.full(ll);
		});
	});
</script>
</head>
<body>

	<div style="width: 78%; float: left;">
		<div id="l-map"></div>
		<div id="r-result"></div>
	</div>
	<div class="form-horizontal" style="width: 20%; float: left">
		<div class="control-group">
			<div class="controls">${building.name}</div>
		</div>
		
		<div class="control-group">
			<div class="controls">楼层数量：${building.floorNum}</div>
		</div>
		<input  class="btn" type="button" value="返回" onclick="javascript:window.history.back(-1);"/>
		
	</div>
</body>
</html>
<script type="text/javascript">
	//百度地图API功能
	var map = new BMap.Map("l-map");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);

	var transit = new BMap.DrivingRoute(map, {
		renderOptions : {
			map : map,
			panel : "r-result",
			enableDragging : true
		//起终点可进行拖拽
		},
	});
	transit.search("成都市", "${building.unit.name}");
</script>