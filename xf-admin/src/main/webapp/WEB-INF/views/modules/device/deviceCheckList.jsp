<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>消防设施巡检管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function formSubmit() {
			$("#searchForm").submit();
		  }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/device/deviceCheck/">消防设施巡检列表</a></li>
		<li ><a href="${ctx}/device/deviceCheck/form?id=${deviceCheck.id}">消防设施巡检新增</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="deviceCheck" action="${ctx}/device/deviceCheck/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>巡检类型：</label>
			<form:select path="checkType">
				<form:options  items="${fns:getDictList('check_type')}" itemLabel="label" itemValue="value" />	
				</form:select>
			</li>
			<li><label>  系统名称：</label>
				<form:select path="sysName">
					 <form:options items="${fns:getDictList('system_type')}" itemLabel="label" itemValue="label"
		                              htmlEscape="false"/>
                </form:select>
			
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>单位/街道</th>
				<th>消防建筑ID</th>
				<th>系统名字</th>
				<th>巡检日期</th>
				<th>巡检人</th>
				<th>巡检类型</th>
				<th>正常设备</th>
				<th>异常设备</th>
				<th>状态</th>
				<th>备注</th>
				<shiro:hasPermission name="device:deviceCheck:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="deviceCheck">
			<tr>
				<td>
					${deviceCheck.office.name}
				</td>
				<td>
					<c:choose>
					<c:when test="${deviceCheck.build.name ne ''}">
					${deviceCheck.build.name}</c:when>
					<c:otherwise>
					${deviceCheck.build.id}
					</c:otherwise>
					</c:choose>
				</td>
				<td>${deviceCheck.sysName}</td>
				<td>
					<fmt:formatDate value="${deviceCheck.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>${deviceCheck.checkBy}</td>
				<td>${deviceCheck.checkTypeName}</td>
				<td>${deviceCheck.normalNum}</td>
				<td>${deviceCheck.errorNum}</td>
				<td>${deviceCheck.statusName}</td>
				<td>
					${deviceCheck.remarks}
				</td>
				<shiro:hasPermission name="device:deviceCheck:edit"><td>
    				<c:if test="${deviceCheck.status eq '0'}">
					 <a href="${ctx}/device/deviceCheck/check?id=${deviceCheck.id}" onclick="return confirmx('确认审核该消防设施巡检吗？', this.href)">审核</a>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>