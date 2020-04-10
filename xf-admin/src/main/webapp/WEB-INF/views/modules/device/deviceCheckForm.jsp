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
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/device/deviceCheck/">消防设施巡检列表</a></li>
		<li class="active"><a href="${ctx}/device/deviceCheck/form?id=${deviceCheck.id}">消防设施巡检<shiro:hasPermission name="device:deviceCheck:edit">${not empty deviceCheck.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="device:deviceCheck:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="deviceCheck" action="${ctx}/device/deviceCheck/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		
		<div class="control-group">
			<label class="control-label">所属消防局机构：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${deviceCheck.office.id}" labelName="office.name" labelValue="${deviceCheck.office.name}"
					title="机构" url="/sys/office/treeData?type=2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属建筑：</label>
			<div class="controls">
					<sys:treeselect id="build" name="buildId" value="${deviceCheck.buildId}" labelName="buildName" labelValue="${deviceCheck.build.name}"
					title="所属建筑" url="/sys/building/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">系统名称 ：</label>
			<div class="controls">
				<form:select path="sysName" class="input-xlarge required">
					 <form:options items="${fns:getDictList('system_type')}" itemLabel="label" itemValue="label"
		                              htmlEscape="false"/>
                </form:select>
			
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">巡检日期：</label>
			<div class="controls">
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${deviceCheck.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">巡检人：</label>
			<div class="controls">
				<form:input path="checkBy" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">巡检类型：</label>
			<div class="controls">
				<form:select path="checkType">
					 <form:options items="${fns:getDictList('check_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">正常设备数：</label>
			<div class="controls">
				<form:input path="normalNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">异常设备数量：</label>
			<div class="controls">
				<form:input path="errorNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态 ：</label>
			<div class="controls">
				<form:select path="status">
					 <form:options items="${fns:getDictList('check_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="device:deviceCheck:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>