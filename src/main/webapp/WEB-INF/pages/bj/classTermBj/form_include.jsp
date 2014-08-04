<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table width="100%">
<tr class="jg" >
	<td width="14%" height="36" class="leftbor" align="right" >班级名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='50' tip='长度不能超过50'/>
	</td>
</tr>
<tr>
	<td width="14%" height="36" class="leftbor" align="right" >计划招生人数：</td>
	<td>
		<input type="text" value="${model.planCount }" id="planCount" name="planCount" datatype='integer' tip='请输入整数'/>
	</td>
</tr>
</table>
       
