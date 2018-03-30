<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	 <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
	<title>消防建筑管理</title>
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
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/building/">消防建筑列表</a></li>
		<li class="active"><a href="${ctx}/sys/building/form?id=${building.id}">消防建筑<shiro:hasPermission name="sys:building:edit">${not empty building.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:building:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="building" action="${ctx}/sys/building/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">建筑名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属单位：</label>
			<div class="controls">
			  <sys:treeselect id="unit" name="unit.id" value="${building.unit.id}" labelName="unit.name"
                            labelValue="${building.unit.name}"
                            title="单位" url="/sys/unit/treeData" extId="${building.unit.id}" cssClass=""
                            allowClear="true"/>
				
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼栋：</label>
			<div class="controls">
				<form:input path="buildingNo" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				 <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">坐标位置：</label>
			<div class="controls">
				<form:input path="point" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">楼层数量：</label>
			<div class="controls">
				<form:input path="floorNum" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				 <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">平面图：</label>
			<div class="controls">
			 <form:hidden id="planeImg" path="planeImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
            	<sys:ckfinder input="planeImg" type="images" uploadPath="/building" selectMultiple="false" maxWidth="200"
                          maxHeight="200"/>
				
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可用电梯数量：</label>
			<div class="controls">
				<form:input path="elevatorsNum" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				 <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可用楼梯数量：</label>
			<div class="controls">
				<form:input path="stairNum" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				 <span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">视频监控地址：</label>
			<div class="controls">
				<form:input path="videoUrl" htmlEscape="false" maxlength="5000" class="input-xlarge "/>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="sys:building:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>