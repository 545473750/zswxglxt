<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>招生学校</title>
	<link href="${ctx}/${sxpt}/css/style.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/stmartFloat/smartFloat.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<style type="text/css">
.op_box{width:638px;height:398px;padding:10px;padding-bottom:0px;overflow:hidden;}
.op_box_cen{width:632px;height:324px;overflow:auto;overflow-x:hidden;clear:both;}
.iframe_box{border:1px solid #cbcbcb;padding:5px;padding-top:0px;overflow:hidden;height:200px;background:#FFF;margin-bottom:4px;}
.iframe_name{border:1px solid #cbcbcb;padding:5px;padding-left:10px;background:#FFF;font-size:12px;width:98%;}
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
		var userList = document.getElementById("userList");
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
		//设置学校id和学校name
		var id = document.getElementById("ids").value;
		var name = document.getElementById("names").value;
		parent.mainFrame.window.setIdBySchool(id,name);
		window.parent.closeDialog();
	}
		
	function resetValue() {
		// 重置数据,ids,selectedUserHTML
		document.getElementById('ids').value = "";
		document.getElementById('names').value = "";
		document.getElementById('userList').innerHTML = "<div class='iframe_name_box'><p class='iframe_name_text'><b>已选学校</b></p></div>";
		
	}
</script>
</head>
<body>

<input type="hidden" id = "ids" value="${selectedIds }"/>
<input type="hidden" id = "names" value="${selectedNames }"/>

<div class="llistbox" style="float: left; width:150px; height: 450px; margin-left: 5px;margin-top: 5px;overflow:auto; align:center" >
	<div id="userList" style="padding-left: 2px;">
		<div class='iframe_name_box'><p class='iframe_name_text'><b>已选学校</b></p></div>
		${selectedOrgHTML }
		
	</div>
	<div style="clear:both;font-size:0px;height:0px;overflow:hidden;"></div>
</div>
<div style="width: 520px; float: left;margin-top:5px;" class="llistbox">
	<iframe src="${ctx}/bj/ClassRecruit!findSchool.do" height="450" width="100%"  frameborder="0"  scrolling="auto">
	</iframe>
</div>
<div style="width: 700px; text-align: center;padding-top: 10px; clear: both;">
	<input type="button" value="提交" onclick="submitValue();" class="but_cz"/>
	<input type="button" value="重置" onclick="resetValue();" class="but_cz"/>
</div>
</body>