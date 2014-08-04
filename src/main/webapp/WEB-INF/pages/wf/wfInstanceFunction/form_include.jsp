<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >页面url：</td>
	<td>
		<input type="text" value="${model.url}" id="url" name="url"    datatype='string' max='200' ignore='ignore'  tip='长度不能超过200'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >参数名称：</td>
	<td>
		<input type="text" value="${model.parName}" id="parName" name="parName"    datatype='string' max='200' ignore='ignore'  tip='长度不能超过200'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >功能描述：</td>
	<td>
		<input type="text" value="${model.description}" id="description" name="description"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >功能分类：</td>
	<td>
		<input type="text" value="${model.funType}" id="funType" name="funType"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >节点类型：</td>
	<td>
		<input type="text" value="${model.insType}" id="insType" name="insType"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >分组：</td>
	<td>
		<input type="text" value="${model.groupFlag}" id="groupFlag" name="groupFlag"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
</table>         
