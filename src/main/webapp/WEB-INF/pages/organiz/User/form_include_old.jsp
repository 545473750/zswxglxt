<%@page import="com.opendata.organiz.model.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/commons/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tags/attachment.tld" prefix="attach"%>


<!-- optional javascript: effects.js,jquery.js -->
<link href="<c:url value="/styles/jquery.ui.theme.css"/>" type="text/css" rel="stylesheet">

<script src="<c:url value="/scripts/application.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery-ui-1.8.9.custom.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery.blockUI.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery.MultiFile.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery.metadata.js"/>" type="text/javascript"></script>

<script src="<c:url value="/scripts/hf.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/My97DatePicker/WdatePicker.js"/>" type="text/javascript"></script>

<script type="text/javascript">
$(function() {
	$("#dialog").dialog({
		title : '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 组织机构',
		autoOpen : false,
		width : 400,
		resizable : false,
		modal : true,
		autoResize : true,
		overlay : {
			opacity : 0.5,
			background : "black"
		}
	});
});

function choiceOrganization() {
	// 附带参数，已经选择的组织机构ID
	var selectedIds = document.getElementById('organizationIds').value;
	//var selectedIds = $('#organizationIds').attr("value");
	
	openDialog('${ctx}/organiz/Organization!choiceOrganization.do?partitionId=${partitionId}&selectedIds=' + selectedIds);
}

function getAge(date)
{
//		var biryear = date.cal.sdate.y;
	var localYear = new Date().getFullYear();
	var age = Number(localYear)-Number(date);
	$("#age").val(age);
}
var getStates = function(bigStateCode,selectId,url){
	if(!bigStateCode){return ;}
	var smallState = $("#"+selectId);
	var option='<option value="">--请选择--</option>';
	
	if(smallState){
		params = {code:bigStateCode};
	    $.ajax( {
			async : false,
			type : 'POST',
			dataType : "json",
			url : '${ctx}'+url,
			data:params,
			success : function(str) 
			{
	    		for (var i =0;i< str.length;i++){
	    				option += "<option value='"+str[i].code+"'>"+str[i].value+"</option>";
		    		}
				}
			});
		}
	smallState.html(option);
};		
		
</script>

<s:hidden id="id" name="id" />
<s:hidden id="partitionId" name="partitionId" />

<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">姓名*:</td>
		<td><input type="text" value="${model.username}" id="username" name="username" datatype='*' max='20' tip='长度不能超过20'/></td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">登录名*:</td>
		<td><input type="text" value="${model.loginname}" id="loginname" name="loginname" datatype='*' max='20' tip='长度不能超过20'/></td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">密码*:</td>
		<td><input type="password" value="${model.password}" id="password" name="password" datatype='*' max='20' tip='长度不能超过20'/></td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">手机号:</td>
		<td><input type="text" value="${model.phone}" id="phone"  name="phone"  datatype='*' max='20' tip='长度不能超过20' ignore="ignore"/></td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">出生年月:</td>
		<td><input type="text" value="${model.birthday}" id="birthday" name="birthday" datatype='date' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',onpicking:function(dp){getAge(dp.cal.date.y);}});" ignore="ignore"/></td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			年龄:
		</td>
		<td>
			<input type="text" value="${model.age}" id="age" name="age" datatype='integer' max='100' tip='年龄不能超过100' ignore="ignore"/>
		</td>
	</tr>
	
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			性别:
		</td>
		<td>
			<select id="sex" name="sex" datatype="*" nullmsg="请选择性别！" errormsg="请选择性别！">
				<option value="">--请选择--</option>
				<option <c:if test="${model.sex==1}">selected="selected"</c:if>  value="1">女</option>
				<option <c:if test="${model.sex==0}">selected="selected"</c:if> value="0">男</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			电子邮箱:
		</td>
		<td>
			<input type="text" value="${model.mail}" id="mail" name="mail" datatype='*' max='100' tip='长度不能超过100' ignore="ignore"/>
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			QQ:
		</td>
		<td>
			<input type="text" value="${model.qq}" id="qq" name="qq" datatype='*' max='200' tip='长度不能超过200' ignore="ignore" />
		</td>
	</tr>
	<tr>
		<td width="10%" height="36" class="leftbor">
			MSN:
		</td>
		<td>
			<input type="text" value="${model.msn}" id="msn" name="msn" datatype='*' max='200' tip='长度不能超过200' ignore="ignore"/>
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">
			微博:
		</td>
		<td>
			<input type="text" value="${model.wblog}" id="wblog" name="wblog"
				datatype='*' max='200' tip='长度不能超过200' ignore="ignore"/>
		</td>
	</tr>
	<tr >
		<td width="10%" height="36" class="leftbor">是否离职:</td>
		<td>
			<input type="radio" value="0" id="isLeave0" name="isLeave" />是
			<input type="radio" value="1" checked="checked" id="isLeave1" name="isLeave" />否
		</td>
	</tr>
	<tr class="jg">
		<td width="10%" height="36" class="leftbor">所属部门:</td>
		<td>
			<input id="organizationIds" value="${model.deptIDs }" name="deptIDs" type="hidden" />
			<textarea rows="4" cols="60" readonly="readonly" id="organizationTexts">${model.deptsString}</textarea>
			<a href="javascript:void(0);" onclick="choiceOrganization();"> <strong>选择</strong></a>
		</td>
	</tr>
	<tr >
		<td width="10%" height="36" class="leftbor">备注:</td>
		<td><textarea rows="6" cols="60" id="remark" name="remark">${model.remark}</textarea></td>
	</tr>
</table>

<div id="dialog" style="overflow: hidden;">
	<iframe id="addSit" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="400" height="344"></iframe>
</div>
