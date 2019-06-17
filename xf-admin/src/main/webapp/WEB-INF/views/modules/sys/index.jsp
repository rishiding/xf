<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>首页</title>
	<meta name="decorator" content="default"/>
<style type="text/css"> 
*{ margin:0; padding:0;} 
.box{ overflow:hidden; padding-top:20px;} 
.box li{ float:left; list-style:none;margin-right:25px;} 
.box li a{color: #d44413; display:block; width:100px;text-decoration:none;position:relative; z-index:0; text-align:center;}
.box li a span{display:block;margin-top:10px;} 
.box li a:hover{ } 
</style> 
<script type="text/javascript">
function addTab($this, refresh){
	return parent.addTab($this, refresh);
	
}
</script>
</head> 
<body> 
<ul class="box"> 
<li>
<a href="#" url=""  onclick="addTab(this, true)" title="消防建筑管理"  type="${ctx}/sys/building/list">
	<img alt="消防建筑管理" src="${ctxStatic}/images/jz.png" height="109"/>
		<span>消防建筑管理</span>
	</a>
</li> 
<li>
<a href="#" type="${ctx}/sys/buildingFloor/list"  onclick="addTab(this, true)" title="建筑楼层管理" >
<img alt="建筑楼层管理" src="${ctxStatic}/images/lc.png" height="109"/>
	<span>建筑楼层管理</span>
</a>
</li> 
<li>
<a href="#" type="${ctx}/device/device/list"  onclick="addTab(this, true)" title="消防设施检测">
<img alt="消防设施检测" src="${ctxStatic}/images/jc.png" height="109"/>
	<span>消防设施检测</span>
</a>
</li> 
<li>
<a href="#" type="${ctx}/device/deviceCheck/list"  onclick="addTab(this, true)" title="消防设施巡检">
<img alt="消防设施巡检" src="${ctxStatic}/images/xj.png" height="109"/>
	<span>消防设施巡检</span>
</a>
</li> 
</ul> 
</body> 
</html> 
