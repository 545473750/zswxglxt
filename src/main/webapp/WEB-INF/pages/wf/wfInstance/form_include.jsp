<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >流程名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >当前状态：</td>
	<td>
		<input type="text" value="${model.state}" id="state" name="state"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
</table>         
