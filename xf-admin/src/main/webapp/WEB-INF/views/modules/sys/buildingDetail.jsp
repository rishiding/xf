<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	 <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
	 <link href="${ctxStatic}/common/xf.min.css" type="text/css" rel="stylesheet" />
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:300px;width:100%;}
		#r-result,#r-result table{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=e3S713ak0UZDsql6qC8whcyG7dL8n2q2"></script>
	<title>导航详情</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("img").click(function(){						
				ll=layer.open({
				    type: 2,	
				    title:'平面图预览',
				    maxmin: true,  
				    area: ['600px', '600px'],
				    content: this.src				   
				  });	
				layer.full(ll);
			});	
		});
	</script>
</head>
<body>	
<div class="form-horizontal" style="width:20%;float:left">
		<div class="control-group">
			<label class="control-label">建筑名：</label>
			<div class="controls">
				${building.name}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属单位：</label>
			<div class="controls">
				${building.unit.name}		  
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼栋：</label>
			<div class="controls">${building.buildingNo}					
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">${building.address}	
			</div>
		</div>		
		
		<div class="control-group">
			<label class="control-label">坐标位置：</label>
			<div class="controls">${building.point}				
			</div>
		</div>	
		
		<div class="control-group">
			<label class="control-label">楼层数量：</label>
			<div class="controls">${building.floorNum}	
				
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">平面图：</label>
			<div class="controls"><img alt="平面图" id="planeImg" name="planeImg" width="30px" src="${building.planeImg}">			 		
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可用电梯数量：</label>
			<div class="controls">${building.elevatorsNum}
				
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可用楼梯数量：</label>
			<div class="controls">${building.stairNum}				
			</div>
		</div>
	</div>
		<div style="width:78%;float:left;">
		<div id="l-map"></div>
		<div id="r-result"></div>
	</div>
	
</body>
</html>
<script type="text/javascript">
//百度地图API功能
var map = new BMap.Map("l-map");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);

 var transit = new BMap.DrivingRoute(map, {
	renderOptions: {
		map: map,
		panel: "r-result",
		enableDragging : true //起终点可进行拖拽
	},  
});
transit.search("成都市","${building.unit.name}");
</script>