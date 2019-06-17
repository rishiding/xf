<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta name="decorator" content="default" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#h-hong {
	height: 10%;
	width: 100%;
}

#l-map {
	height: 100%;
	width: 80%;
	float: left;
	border-right: 2px solid #bcbcbc;
}

#r-result {
	height: 100%;
	width: 20%;
	float: left;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=e3S713ak0UZDsql6qC8whcyG7dL8n2q2"></script>
<title>报警首页</title>

</head>
<body>
	<sys:message content="${message}" />
	<form id="searchForm" action="#" method="post"
		class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>区域：</label> <sys:treeselect id="area" name="areaId"
					value="" labelName="area.name" labelValue="" title="区域"
					url="/sys/area/treeData" cssClass="required" /></li>
			<li><label>查询方式：</label> <input id="type1" type="radio"
				name="type" value="single" /><label for="type1">精准查找</label> <input
				id="type2" type="radio" name="type" value="more" checked="checked" /><label
				for="type2">模糊查找</label></li>
			<li><label>建筑名：</label> <input id="keyword" type="text"
				maxlength="255" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="button" onclick="search('type','keyword')" value="查询" /> <input
				type="button" onclick="reset()" value="重置" /></li>
			<li class="clearfix"></li>
		</ul>
	</form>

	<div id="l-map"></div>
	<div id="r-result">
		
	</div>

</body>
</html>
<script type="text/javascript">
// 	var BASEDATA=[{"title":"航利中心","icon":"/static/images/status/normal1.png","point":"104.044296|30.632085","content":"四川省成都市武侯区科园二路12","id":"caf5f24078254cbc9b9522ec3abdb2b1","isOpen":"0"},{"title":"环球中心","icon":"/static/images/status/normal1.png","point":"104.070742|30.574935","content":"四川省成都市武侯区","id":"ddf222e856cf467bbe901b01c03475dd","isOpen":"0"}];
// 	console.info(BASEDATA);
	function getData() {
		var a;
		$.ajax({
			type : "GET",
			async : false,
			url : "${ctx}/sys/building/alarmData?areaId=" + $("#areaId").val(),
			success : function(data) {
				 a =  JSON.parse(JSON.stringify(data.list))
			     /* for(var i =0 ;i < jsonObj.length;i++){
			            a[i] = jsonObj[i];
			     } */
			}
		});
		var name = $("#areaName").val();
		if (!name) {
			name = "成都市";
		}
		initMap(name, a);
	}

	//创建和初始化地图函数：
	function initMap(name1, data) {
		window.map = new BMap.Map("l-map");
		map.centerAndZoom(name1, 10);
		map.enableScrollWheelZoom();
		map.addControl(new BMap.NavigationControl());
		//创建自定义搜索类
		window.searchClass = new SearchClass();
		searchClass.setData(data)
		reset();
	}

	

	//搜索方法 param{searchTypeRadio_name：搜索radio的名字,keyword_name:搜索文本框的id}
	window.search = function(searchTypeRadio_name, keyword_name) {
		//获取页面dom
		var searchType = document.getElementsByName(searchTypeRadio_name);
		var keyword = document.getElementById(keyword_name).value;
		//获取dom的值
		var isLikeSearch;
		for (var i = 0; i < searchType.length; i++) {
			if (searchType[i].checked) {
				isLikeSearch = searchType[i].value;
			}
		}
		//开始搜索
		searchClass.trim(isLikeSearch) == "" && (t_v = "single"); //去掉搜索关键字的html标签
		var dd = searchClass.search({
			k : "title",
			d : keyword,
			t : isLikeSearch,
			s : ""
		});
		addMarker(dd);//向地图中添加marker
	}
	//重置返回所有结果
	window.reset = function() {
		//s:{''只返回找到的结果|all返回所有的} 
		var dd = searchClass.search({
			k : "title",
			d : "显示全部",
			t : "single",
			s : "all"
		});
		addMarker(dd);//向地图中添加marker
	}

	//创建marker
	window.addMarker = function(data) {
		map.clearOverlays();
		for (var i = 0; i < data.length; i++) {
			var json = data[i];
			var p0 = json.point.split("|")[0];
			var p1 = json.point.split("|")[1];
			var point = new BMap.Point(p0, p1);
			var iconImg = new BMap.Icon(json.icon, new BMap.Size(22, 22));
			var marker = new BMap.Marker(point, {
				icon : iconImg
			});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title, {
				"offset" : new BMap.Size(22, 22)
			});
			marker.setLabel(label);
			map.addOverlay(marker);
			label.setStyle({
				borderColor : "#808080",
				color : "#333",
				cursor : "pointer"
			});

			(function() {
				var _json = json;
				var _iw = createInfoWindow(_json);
				var _marker = marker;
				_marker.addEventListener("click", function() {
					this.openInfoWindow(_iw);
				});
				_iw.addEventListener("open", function() {
					_marker.getLabel().hide();
				})
				_iw.addEventListener("close", function() {
					_marker.getLabel().show();
				})
				label.addEventListener("click", function() {
					_marker.openInfoWindow(_iw);
				})
				if (!!json.isOpen) {
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
		}
	}
	//创建InfoWindow
	function createInfoWindow(json) {
		var iw = new BMap.InfoWindow(
				"<b class='iw_poi_title' title='" + json.title + "'>"
						+ json.title + "</b><div class='iw_poi_content'>"
						+ json.content + "</div>");
		return iw;
	}
	//创建一个Icon
	function createIcon(json) {
		var icon = new BMap.Icon(
				"http://dev.baidu.com/wiki/static/map/API/img/ico-marker.gif",
				new BMap.Size(json.w, json.h), {
					imageOffset : new BMap.Size(-json.l, -json.t),
					infoWindowAnchor : new BMap.Size(json.lb + 5, 1),
					offset : new BMap.Size(json.x, json.h)
				})
		return icon;
	}

	function SearchClass(data) {
		this.datas = data;
	}
	// rule = {k:"title",d:"酒店",s:"all",t:"single"}=>t{single:(key=?),more:(key like[%?%])}//t:{single|more},s{all|!all}
	// rule = {k:"名字",d:"搜索关键字",t:{single名字精确查找|more名字模糊匹配查找},s{''只返回找到的结果|all返回所有的} 
	SearchClass.prototype.search = function(rule) {
		if (this.datas == null) {
			alert("数据不存在!");
			return false;
		}
		if (this.trim(rule) == "" || this.trim(rule.d) == ""
				|| this.trim(rule.k) == "" || this.trim(rule.t) == "") {
			alert("请指定要搜索建筑物名!");
			return false;
		}
		var reval = [];
		var datas = this.datas;
		var len = datas.length;
		var me = this;
		var ruleReg = new RegExp(this.trim(rule.d));
		var hasOpen = false;

		var addData = function(data, isOpen) {
			// 第一条数据打开信息窗口
			if (isOpen && !hasOpen) {
				hasOpen = true;
				data.isOpen = 1;
			} else {
				data.isOpen = 0;
			}
			reval.push(data);
		}
		var getData = function(data, key) {
			var ks = me.trim(key).split(/\./);
			var i = null, s = "data";
			if (ks.length == 0) {
				return data;
			} else {
				for (var i = 0; i < ks.length; i++) {
					s += '["' + ks[i] + '"]';
				}
				return eval(s);
			}
		}
		for (var cnt = 0; cnt < len; cnt++) {
			var data = datas[cnt];
			var d = getData(data, rule.k);
			if (rule.t == "single" && rule.d == d) {
				addData(data, true);
			} else if (rule.t != "single" && ruleReg.test(d)) {
				addData(data, true);
			} else if (rule.s == "all") {
				addData(data, false);
			}
		}
		return reval;
	}
	SearchClass.prototype.setData = function(data) {
		this.datas = data;
	}
	SearchClass.prototype.trim = function(str) {
		if (str == null) {
			str = "";
		} else {
			str = str.toString();
		}
		return str.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "");
	}
	
	$("#areaId").change(function() {
		getData();
	});
	getData();
	
	
	// 	initMap();//创建和初始化地图
</script>