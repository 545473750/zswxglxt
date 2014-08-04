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
	<td width="10%" height="36" class="leftbor" >节点顺序：</td>
	<td>
		<input type="text" value="${model.orderNum}" id="orderNum" name="orderNum"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >节点类型：</td>
	<td>
		<input type="text" value="${model.actType}" id="actType" name="actType"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >节点状态：</td>
	<td>
		<input type="text" value="${model.actFlag}" id="actFlag" name="actFlag"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >功能描述：</td>
	<td>
		<input type="text" value="${model.description}" id="description" name="description"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >扩展字段1：</td>
	<td>
		<input type="text" value="${model.extFiled1}" id="extFiled1" name="extFiled1"    datatype='string' max='200' ignore='ignore'  tip='长度不能超过200'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >扩展字段2：</td>
	<td>
		<input type="text" value="${model.extFiled2}" id="extFiled2" name="extFiled2"    datatype='string' max='200' ignore='ignore'  tip='长度不能超过200'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >扩展字段3：</td>
	<td>
		<input type="text" value="${model.extFiled3}" id="extFiled3" name="extFiled3"    datatype='string' max='200' ignore='ignore'  tip='长度不能超过200'/>
	</td>
</tr>
</table>         
