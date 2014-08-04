<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >课程id：</td>
	<td>
		<input type="text" value="${model.courseId}" id="courseId" name="courseId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >本院教师：</td>
	<td>
		<input type="text" value="${model.localTeacherId}" id="localTeacherId" name="localTeacherId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >外请教师：</td>
	<td>
		<input type="text" value="${model.outTeacherId}" id="outTeacherId" name="outTeacherId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >学时：</td>
	<td>
		<input type="text" value="${model.courseDate}" id="courseDate" name="courseDate"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >考核方式：</td>
	<td>
		<input type="text" value="${model.checkWay}" id="checkWay" name="checkWay"    datatype='string' max='1' ignore='ignore'  tip='长度不能超过1'/>
	</td>
</tr>
</table>         
