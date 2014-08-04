<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<input type="hidden" name="type" value="${type }"/>

<!-- 用户列表 -->  
<c:if test="${type == 1 }">
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
		<th width="30">
			<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
		</th>
		<th width="50">序号</th>
		<th>用户名称</th>
	</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >备注：</td>
	<td>
		<input type="text" value="${model.remark}" id="remark" name="remark"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
</table>
</c:if>

<!-- 部门列表 -->
<c:if test="${type == 2 }">
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
		<th width="30">
			<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
		</th>
		<th width="50">序号</th>
		<th>部门名称</th>
	</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >备注：</td>
	<td>
		<input type="text" value="${model.remark}" id="remark" name="remark"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
</table>
</c:if>

<!-- 角色列表 -->
<c:if test="${type == 3 }">
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	<tr>
		<th width="30">
			<input type="checkbox" onclick="setAllCheckboxState('items',this.checked)">
		</th>
		<th width="50">序号</th>
		<th>角色名称</th>
	</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >备注：</td>
	<td>
		<input type="text" value="${model.remark}" id="remark" name="remark"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
</table>
</c:if>

