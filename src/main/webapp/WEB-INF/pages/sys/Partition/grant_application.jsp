<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<style type="text/css">
.op_box{width:638px;height:398px;padding:10px;padding-bottom:0px;overflow:hidden;}
.op_box_cen{width:632px;height:324px;overflow:auto;overflow-x:hidden;clear:both;}
.iframe_box{border:1px solid #cbcbcb;padding:5px;padding-top:0px;overflow:hidden;height:200px;background:#FFF;margin-bottom:4px;}
.iframe_name{border:1px solid #cbcbcb;padding:5px;background:#FFF;font-size:12px;width:98%;}
.iframe_name_box{background:url(../images/component/open_textbox.gif) no-repeat left top;width:130px;height:29px;line-height:26px;float:left;margin-right:10px;margin-bottom:8px;}
.iframe_name_box p{float:left;padding:0px;margin:0px;text-align:center;}
.iframe_name_box p.iframe_name_text{width:116px;}
.iframe_name_box p.iframe_name_close{width:11px;}
.iframe_name_box p.iframe_name_close img{border:none;}
</style>

<script type="text/javascript">
		// 删除功能
		function delItem(id, name){
			//删除列表项
			var userList = document.getElementById("appList");
			userList.removeChild(document.getElementById(id));
			//更新IDS
			var ids = document.getElementById("ids").value;
			var idsarray = ids.split(",");
			for(var i=0;i < idsarray.length;i++){
				if(idsarray[i] == id){
					idsarray[i] = "";
				}
			}
			ids = "";
			for(var i=0;i < idsarray.length;i++){
				if(idsarray[i] != ""){
					if(ids == ""){
						ids = idsarray[i];
					}else{
						ids = ids + "," + idsarray[i];
					}
				}
			}
			document.getElementById("ids").value = ids;
			// 更新names
			var names = document.getElementById("names").value;
			var tmp = names.replace(name, '');
			var nameArray = tmp.split(",");
			var nameArrays = new Array();
			for(var i = 0; i < nameArray.length; i++) {
				if(nameArray[i] != '') {
					nameArrays.push(nameArray[i]);
				}
			}
			document.getElementById("names").value = nameArrays.join();
		}
		
		function submitValue() {
			document.getElementById("submitForm").submit();
		}
			
		function resetValue() {
			// 重置数据,ids,selectedUserHTML
			document.getElementById('ids').value = "";
			document.getElementById('names').value = "";
			document.getElementById('appList').innerHTML = "";
			
		}
	</script>
</head>

<body>
<div class="op_box_cen" style="width: 100%; overflow: hidden; height: 334px;">

	<div style="clear:both;font-size:0px;height:0px;overflow:hidden;">
	<form method="post" action="${ctx }/sys/Partition!grantApplication.do" id="submitForm">
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="gridBody">
	  <tr><td>
	  <!-- station id -->
	  <input type="hidden"" name="Id" value="${Id }"/>
	  <!-- ids -->
	  <input type="hidden" name="selectedAppIds" id="ids" value="${selectedIds }"/>
	  <input type="hidden" name="selectedAppNames" id="names" value="${selectedNames }"/>
	  </td></tr>
	</table>
	</form>
	</div>

	<!-- 待选应用列表 -->
	<div class="iframe_box" style="padding: 0px 0px 0px 0px; width: 100%" >
	<iframe src="${pageContext.request.contextPath }/application/Application!loadAppList.do" 
		style="border:none;" frameborder="0" width="100%" height="206" scrolling="auto">
	</iframe>
	</div>

	<!-- 已选应用列表 -->
	<div class="iframe_name" style="overflow: auto; height: 80px; align:center">
		<div id="appList">${selectedAppHTML }</div>
	    <div style="clear:both;font-size:0px;height:0px;overflow:hidden;"></div>
	</div>

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="gridBody" style="padding-top: 5px;">
	  <tr>
	  	<td>
	    	<input type="button" value="提交" onclick="submitValue();"/>
	    	<input type="button" value="重置" onclick="resetValue();"/>
	  	</td>
	  </tr>
	</table>

</div>
</body>
</html>
