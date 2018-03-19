<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>建筑楼层管理</title>
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
		<li><a href="${ctx}/sys/buildingFloor/">建筑楼层列表</a></li>
		<li class="active"><a href="${ctx}/sys/buildingFloor/form?id=${buildingFloor.id}">建筑楼层<shiro:hasPermission name="sys:buildingFloor:edit">${not empty buildingFloor.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:buildingFloor:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="buildingFloor" action="${ctx}/sys/buildingFloor/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">所属建筑：</label>
			<div class="controls">
			  <sys:treeselect id="building" name="building.id" value="${buildingFloor.building.id}" labelName="building.name"
                            labelValue="${buildingFloor.building.name}"
                            title="建筑" url="/sys/building/treeData" extId="${buildingFloor.building.id}" cssClass="required"
                            allowClear="true"/>
				
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼层号：</label>
			<div class="controls">
				<form:input path="floorNo" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼层平面图：</label>
			<div class="controls">
				 <form:hidden id="planeImg" path="planeImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
            	<sys:ckfinder input="planeImg" type="images" uploadPath="/floor" selectMultiple="false" maxWidth="200"
                          maxHeight="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">视频监控地址：</label>
			<div class="controls">
				<form:input path="videoUrl" htmlEscape="false" maxlength="5000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:buildingFloor:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>