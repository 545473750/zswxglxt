<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="jg" >
	<td width="12%" height="36" align="right" class="leftbor" >名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100'  tip='长度不能超过100'/>
	</td>
	<td width="12%" height="36"  align="right" class="leftbor" >页面url：</td>
	<td>
		<input type="text" value="${model.url}" id="url" name="url"    datatype='string' max='200'  tip='长度不能超过200'/>
	</td>
</tr>
<tr>
	<td width="12%" height="36"  align="right" class="leftbor" >参数名称：</td>
	<td>
		<input type="text" value="${model.parName}" id="parName" name="parName"    datatype='*' max='200' ignore='ignore'  tip='长度不能超过200 (多个参数以英文状态下的逗号分隔)'/>
	</td>
	<td width="12%" height="36"  align="right" class="leftbor" >功能分类：</td>
	<td>
		<input type="text" value="${model.funType}" id="funType" name="funType"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="12%" height="36"  align="right" class="leftbor" >功能描述：</td>
	<td colspan="3">
		<textarea id="description" name="description" cols="60"   datatype='*' max='500' ignore='ignore'  tip='长度不能超过500'>
			${model.description}
		</textarea>
	</td>
	
</tr>
</table>         
