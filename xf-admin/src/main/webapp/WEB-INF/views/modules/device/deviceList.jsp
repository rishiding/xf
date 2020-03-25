<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防设施管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function formSubmit() {
			$("#searchForm").submit();
		  }
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/device/device/list">消防设施事件列表</a></li>
		<shiro:hasPermission name="terminal:terminal:edit"><li><a href="${ctx}/device/device/form">消防设施事件添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="device" action="${ctx}/device/device/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li>
			 <input name="queryType" type="radio" value="" onclick="formSubmit()" />全部
			 <input name="queryType" type="radio" value="1" onclick="formSubmit()" <c:if test="${device.queryType eq '1'}">checked="checked"</c:if>/>本月
			 <input name="queryType" type="radio" value="2" onclick="formSubmit()" <c:if test="${device.queryType eq '2'}">checked="checked"</c:if>/>本周
			</li>
			
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>日期</th>
				<th>单位/街道</th>
				<th>消防建筑ID</th>
				<th>消防设施ID</th>
				<th>消防设施名称</th>
				<th>设施类型</th>
				<th>事件描述</th>
				<th>状态</th>
				<th>数据源</th>
				<shiro:hasPermission name="device:device:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="device">
			<tr>
				<td>
					<fmt:formatDate value="${device.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${device.office.name}
				</td>
				<td>
					<c:choose>
					<c:when test="${device.build.name ne ''}">
					${device.build.name}</c:when>
					<c:otherwise>
					${device.build.id}
					</c:otherwise>
					</c:choose>
				</td>
				<td>
					${device.deviceId}
				</td>
				<td>
					${device.deviceName}
				</td>
				<td>
					${device.deviceType}
				</td>
				<td>
					${device.note}
				</td>
				<td>
					${device.statusName}
				</td>
				<td>
					${device.source}
				</td>
				<shiro:hasPermission name="device:device:edit"><td>
    				<c:if test="${device.status eq '1'}">
						<a href="${ctx}/device/device/baoxiu?id=${device.id}" onclick="return confirmx('确认要保修该消防设施吗？', this.href)">保修</a>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>