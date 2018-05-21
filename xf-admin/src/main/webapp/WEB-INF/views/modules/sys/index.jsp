<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
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
</head> 
<body> 
<ul class="box"> 

<li>
<a href="${ctx}/sys/building/list"  >
<img alt="消防建筑管理" src="${ctxStatic}/images/jz.png" height="109"/>
	<span>消防建筑管理</span>
</a>
</li> 
<li>
<a href="${ctx}/sys/buildingFloor/list"  >
<img alt="建筑楼层管理" src="${ctxStatic}/images/lc.png" height="109"/>
	<span>建筑楼层管理</span>
</a>
</li> 
<li>
<a href="${ctx}/device/device/list"  >
<img alt="消防设施检测" src="${ctxStatic}/images/jc.png" height="109"/>
	<span>消防设施检测</span>
</a>
</li> 
<li>
<a href="${ctx}/device/deviceCheck/list"  >
<img alt="消防设施巡检" src="${ctxStatic}/images/xj.png" height="109"/>
	<span>消防设施巡检</span>
</a>
</li> 
</ul> 
</body> 
</html> 
