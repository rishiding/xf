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

<title>楼栋详情</title>
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

	<div style="width: 69%; float: left;">
		<img alt="平面图" id="planeImg" name="planeImg" width="98%"  src="${building.planeImg}">
	</div>
	<div class="form-horizontal" style="width: 29%; float: left">
		<div class="control-group">
			<div class="controls">${building.name}</div>
		</div>		
		
		<div class="control-group">
			
			<div class="controls">${building.address} 
			<input  class="btn" type="button" onclick="window.location.href='/f/sys/building/navigation?id=${building.id}'" value="到这里去"/></div>
		</div>				
		<div class="control-group">
			<div class="controls">可用电梯数量：${building.elevatorsNum}</div>
		</div>
		<div class="control-group">			
			<div class="controls">可用楼梯数量：${building.stairNum}</div>
		</div>
	</div>
</body>
</html>
