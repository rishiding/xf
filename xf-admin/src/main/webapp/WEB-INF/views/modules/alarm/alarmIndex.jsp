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
	width: 78%;
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
			<li><label>区域：</label>  <select id="c" name="c" onchange="getAreaData()">
				<option value="">请选择</option>
				<c:forEach items="${listg}" var="a">
					<option value="${a.id}" <c:if test="${a.id eq '24'}"> selected="selected"</c:if>>${a.name}</option>
				</c:forEach>				
            </select><select id="s" name="s" class="input-mini" onchange="getShiData()"><option value="">请选择</option><c:forEach items="${listc}" var="a">
					<option value="${a.id}" <c:if test="${a.id eq '276'}"> selected="selected"</c:if>>${a.name}</option>
				</c:forEach></select> </li><li class="btns"><input id="button" class="btn btn-primary" type="button" value="查询" onclick="getData()"/></li>			
			<li><input type="hidden" id="areaId"/><input type="hidden" id="areaName"/></li>
		</ul>
	</form>

	<div id="l-map"></div>
	<div id="r-result">
		<div class="breadcrumb form-search">
		<ul class="ul-form">
			<li ><label onclick="find('')">建筑物总数:</label>&nbsp;<span id="totalBuild" onclick="find('')"></span></li>
			<li class="clearfix"></li>
			<li style="height:64px;" ><label><img title="当前火灾报警数" onclick="find('1')"  src="/static/images/status/fire.png"></label><span onclick="find('1')" id="alarmBuild" Style="padding-left:4px;font-size:26px;color:red;font-weight:bold;">0</span></li>
			<li class="clearfix" style="height:64px;"></li>
			<li style="height:64px;"><label><img title="当前故障数" onclick="find('2')"  src="/static/images/status/alarm.png"></label><span onclick="find('2')" id="faltBuild" Style="padding-left:4px;font-size:26px;color:yellow;font-weight:bold;">0</span></li>
			<li class="clearfix" style="height:64px;"></li>
			<li style="height:64px;"><label><img title="当前正常数" onclick="find('0')"  src="/static/images/status/normal1.png"></label><span onclick="find('0')" id="normalBuild" Style="padding-left:4px;font-size:26px;font-weight:bold; color:green;">0</span></li>
			<li class="clearfix" style="height:64px;"></li>					
		</ul>
		</div>
    	<input id="keyword" type="text" style="width:150px;height:18px;float:left" value="" onkeypress="search('type','keyword')"	placeholder="输入建筑名模糊查询"/> 
   	 	<input type="button" value="搜索" onclick="search('type','keyword')" style="float:left"/>
	</div>

</body>
</html>
<script type="text/javascript">
	function getAreaData(){		
			$('#s').val(null).trigger("change"); 
			 var oSelected = document.getElementById("c");
			 var selectedValue = oSelected.options[oSelected.selectedIndex].value;		
			 var text =$("#c option:selected").text();
			 $("#areaId").val(selectedValue);
			 $("#areaName").val(text);
			 var office= document.getElementById("s");
			 office.options.length = 0;
			 document.getElementById('s2id_s').childNodes[0].childNodes[1].innerHTML="";
		        $.ajax({  
		            type:"POST",  
		            url: "${ctx}/sys/area/treeData?pid="+selectedValue,  
		           
		            success: function(data){  
		                if(data != null && data.length > 0){  
		                    var html="";  
		                    for(var i=0; i<data.length; i++){  
		                        office.add(new Option(data[i].name,data[i].id));
		                    }  
		                    $("#s").select2();
		                }  
		            }  
		        }); 
	}
	function getShiData(){		
		var selectedValue = $("#s option:selected").val();		
		 var text =$("#s option:selected").text();
		 $("#areaId").val(selectedValue);
		 $("#areaName").val(text);
		
	}
	function getData() {
		var a;
		$.ajax({
			type : "GET",
			async : false,
			url : "${ctx}/sys/building/alarmData?areaId=" + $("#areaId").val(),
			success : function(data) {
				$("#totalBuild").text(data.totalBuild);
				$("#alarmBuild").text(data.alarmBuild);
				$("#faltBuild").text(data.faltBuild);
				$("#normalBuild").text(data.normalBuild);
				 a =  JSON.parse(JSON.stringify(data.list))
			   
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
		var num=10;
		if(name1.indexOf("市")>=0){
			num=12;
		}
		window.map = new BMap.Map("l-map");
		map.centerAndZoom(name1, num);
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
// 		var searchType = document.getElementsByName(searchTypeRadio_name);
		var keyword = document.getElementById(keyword_name).value;
		//获取dom的值
		var isLikeSearch='more';
		/* for (var i = 0; i < searchType.length; i++) {
			if (searchType[i].checked) {
				isLikeSearch = searchType[i].value;
			}
		} */
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
	window.find = function(status) {
		//获取dom的值
		var isLikeSearch='more';
	
		//开始搜索
		searchClass.trim(isLikeSearch) == "" && (t_v = "single"); //去掉搜索关键字的html标签
		var dd = searchClass.search({
			k : "status",
			d : status,
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
			t : "more",
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
		console.info(json);
		var iw = new BMap.InfoWindow(
				"<a href='#' type='/f/sys/building/detail?id="+ json.id +"' onclick='parent.addTab(this, true)' title='" + json.title + "'><b class='iw_poi_title' title='" + json.title + "'>"
						+ json.title + "</b><div class='iw_poi_content'>"
						+ json.content + "</div></a>");
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
		/* if (this.trim(rule) == "" || this.trim(rule.d) == ""
				|| this.trim(rule.k) == "" || this.trim(rule.t) == "") {
			alert("请指定要搜索建筑物名!");
			return false;
		} */
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