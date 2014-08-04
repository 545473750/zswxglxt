<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script type="text/javascript">
function getChangeTeacher(url){
	parent.dialog({
		title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择人员',
		autoOpen: true,
		width: 720,
		height: 560,
		modal: true,
		overlay: {
			opacity: 0.5,
			background: "black"
		},
		useIframe: true,
		url:url
	});
}

</script>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="jg" >
	<td width="14%" height="36" class="leftbor" align="right" >期数名称：</td>
	<td>
		<input type="text" id="name" name="name" value="${model.name }" datatype="*" tip='请输入期数名称' errormsg="请输入期数名称" max="100" min="0"/>
	</td>
</tr>
<tr>
	<td width="15%" height="36" class="leftbor" align="right" >开始日期：</td>
	<td>
		<input readonly="true" value="<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>" id="startTime" name="startTime" maxlength="100" datatype="*" tip="请选择时间"  class="" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})"/>
	</td>
</tr>
<tr class="jg" >
	<td width="15%" height="36" class="leftbor" align="right" >结束日期：</td>
	<td>
		<input readonly="true" value="<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>" id="endTime" name="endTime" maxlength="100" datatype="*" tip="请选择时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" />
	</td>
</tr>
<tr>
	<td width="14%" height="36" class="leftbor" align="right" >招生人数：</td>
	<td>
		<input type="text" value="${model.allLimit}" id="allLimit" name="allLimit"  datatype='integer' tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="14%" height="36" class="leftbor" align="right" >每班人数：</td>
	<td>
		<input type="text" value="${model.classLimit}" id="classLimit" name="classLimit" datatype='integer' tip='请输入一个整数'/>
	</td>
</tr>
<tr>
	<td width="14%" height="36" class="leftbor" align="right" >期负责人：</td>
	<td>
		<input type="text" value="${model.termTeacher1 }" id="termTeacher1" name="termTeacher1" datatype="*" tip="请选择负责人" onfocus="openDialogById('${ctx }/bj/ClassTerm!userList.do?teacher=termTeacher1&type=1&teacherIds=${model.termTeacher1Id }')"/>
		<input type="hidden" id="termTeacher1Id" name="termTeacher1Id" value="${model.termTeacher1Id }"/>
	</td>
</tr>
<tr class="jg" >
	<td width="14%" height="36" class="leftbor" align="right" >辅导老师：</td>
	<td>
		<textarea cols="55" rows="3" type="text" id="termTeacher0" name="termTeacher0" datatype="*" tip="请选择辅导老师" onfocus="getChangeTeacher('${ctx }/bj/ClassTerm!userlist.do?teacher=termTeacher0&type=0&teacherIds=${model.termTeacher0Id }')">${model.termTeacher0 }</textarea>
		<input type="hidden" value="${model.termTeacher0Id }" id="termTeacher0Id" name="termTeacher0Id"/>
	</td>
</tr>
</table>         
