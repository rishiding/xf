<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
 	<%@ include file="/WEB-INF/views/include/head.jsp" %>
 	 <%-- <script type="text/javascript" src="${ctxStatic}/layer/layer.js"></script> --%>
 	 <script type="text/javascript" src="${ctxStatic}/jquery/jquery.image-maps5.0.js"></script>
 	 <link href="${ctxStatic}/css/imageHotAreaStyle.css" type="text/css" rel="stylesheet" />
	<title>楼层描点</title>
	<meta name="decorator" content="default"/>

</head>
<body>	
	<form id="inputForm"  class="form-horizontal">
		<input type="hidden" name="id" value="${buildingFloor.id}"/>
	<div class="hot_area" id = "areaContent">
    
     <div style="width:1024;" name="imageMap" id="image_map">
       <img src=""  ref="imageMap" id="photo"/>
     </div>    
    <!-- <p><span class="">已添加<b class="added_amount">0</b>个设备</span></p>
     <table><tbody id="areaItems"> </tbody></table>	 
     <p><a id="add_hot_area" href="JavaScript:;" class="">添加设备</a> &nbsp; </p>
	-->
     <input type="hidden" class="" id="hotAreas" name="hotAreas"  value=''>

	</div>		
		<!--<div class="form-actions">
			<shiro:hasPermission name="sys:buildingFloor:edit"><input id="btnSubmit" onclick="JavaScript:viewMap();" class="btn btn-primary" type="button" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>-->
	</form>
	<script type="text/javascript">

	$(document).ready(function() {
	//$(function(){
		var setting = {
			maxAmount:5,
			tag:'tr',
			params:{
				//'areaLink':'添加热区时的默认值',
				//'areaType':'添加热区时的默认值'
			},
			//proportion:"0.5",
			domCallBack:function(params){
				//console.log(params);
				return "<td>回路号：<input type='text' class='loop' value='00'/></td>"
			}
		}

		//初始化加载
		var areas = "${buildingFloor.dragInfos}";
		$("#hotAreas").val(areas);  

		
		imageMaps.proportionNoSameManual("${buildingFloor.planeImg}",setting,1,1,true);
		
	});

	function viewMap(){
		
		var lg=$(".area_item").length;
		var out="[";
		for (var i = 1; i <= lg; i++) { 			
			out=out+"{";
			var mm=1;
			$("#areaItem"+i+" :input").each(function(index,item){
		        var c = $(this).attr("class");    
		        var val = $(this).val();
		         if(c=="ipt_border area_title"){
		        	out=out+"'name':'"+val+"'";
		        }  else if(c=="loop"){
		        	out=out+"'loopNumber':'"+val+"'";
		        } else if(c=="areaMapInfo"){
		        	out=out+"'point':'"+val+"'";
		        } 
		         if(mm<3){
		        	 out=out+",";
		         }else{
		        	 out=out+"}";
		        	 
		         }  
				mm++;
			
		    });
			 if(i<lg){
				out=out+",";				
			}	 
		 }
		out=out+"]"; 
		
		$.post("${ctx}/sys/buildingFloor/updateMaps", { id: "${buildingFloor.id}", dragInfos: out },
				   function(data){
				     alert(data);
		
		});
		
	}
	
	</script>
</body>
</html>