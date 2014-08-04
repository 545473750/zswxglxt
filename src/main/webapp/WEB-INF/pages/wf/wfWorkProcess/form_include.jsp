<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >工作流ID：</td>
	<td>
		<input type="text" value="${model.projectId}" id="projectId" name="projectId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >节点ID：</td>
	<td>
		<input type="text" value="${model.actId}" id="actId" name="actId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >状态：</td>
	<td>
		<input type="text" value="${model.proState}" id="proState" name="proState"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >开始时间：</td>
	<td>
		<input type="text" value="<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>" onclick='WdatePicker({isShowClear:true,readOnly:true})' id="startTime" name="startTime"    datatype='date' ignore='ignore'  tip='请选择日期'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >结束时间：</td>
	<td>
		<input type="text" value="<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>" onclick='WdatePicker({isShowClear:true,readOnly:true})' id="endTime" name="endTime"    datatype='date' ignore='ignore'  tip='请选择日期'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >创建人：</td>
	<td>
		<input type="text" value="${model.userId}" id="userId" name="userId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >创建人姓名：</td>
	<td>
		<input type="text" value="${model.userName}" id="userName" name="userName"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
</table>         
