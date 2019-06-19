<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	 <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script>
	 <script src="${ctxStatic}/map/js/selectLocation.js" type="text/javascript"></script>
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
<body>	<div class="form-horizontal">
		<sys:message content="${message}"/>		
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
		
	
	
</body>
</html>