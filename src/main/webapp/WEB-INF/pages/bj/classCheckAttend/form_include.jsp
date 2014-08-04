<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >课表id：</td>
	<td>
		<input type="text" value="${model.courseName}" id="courseName" name="courseName"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >出勤状态：</td>
	<td>
		<input type="text" value="${model.startTime}" id="startTime" name="startTime"    datatype='string' max='19' ignore='ignore'  tip='长度不能超过19'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >出勤时间：</td>
	<td>
		<input type="text" value="${model.endTime}" id="endTime" name="endTime"    datatype='string' max='19' ignore='ignore'  tip='长度不能超过19'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >考核教师：</td>
	<td>
		<input type="text" value="${model.teacherId}" id="teacherId" name="teacherId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
</table>         
