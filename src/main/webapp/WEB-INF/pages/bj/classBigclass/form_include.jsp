<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >培训类别：</td>
	<td>
		<input type="text" value="${model.trainType}" id="trainType" name="trainType"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >班级名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >预设班主任：</td>
	<td>
		<input type="text" value="${model.headTeacherId}" id="headTeacherId" name="headTeacherId"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >学科：</td>
	<td>
		<input type="text" value="${model.subject}" id="subject" name="subject"    datatype='string' max='32' ignore='ignore'  tip='长度不能超过32'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >总学时：</td>
	<td>
		<input type="text" value="${model.totalHour}" id="totalHour" name="totalHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >面授学时：</td>
	<td>
		<input type="text" value="${model.faceHour}" id="faceHour" name="faceHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >网授学时：</td>
	<td>
		<input type="text" value="${model.netHour}" id="netHour" name="netHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >实践学习：</td>
	<td>
		<input type="text" value="${model.practiceHour}" id="practiceHour" name="practiceHour"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >预设总学分：</td>
	<td>
		<input type="text" value="${model.prepareScore}" id="prepareScore" name="prepareScore"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >招生对象：</td>
	<td>
		<input type="text" value="${model.recruitObj}" id="recruitObj" name="recruitObj"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >招生人数：</td>
	<td>
		<input type="text" value="${model.recruitCount}" id="recruitCount" name="recruitCount"    datatype='integer' ignore='ignore'  tip='请输入一个整数'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >资料费用：</td>
	<td>
		<input type="text" value="${model.materialsFee}" id="materialsFee" name="materialsFee"    datatype='double' ignore='ignore'  tip='请输入一个符点数'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >用途：</td>
	<td>
		<input type="text" value="${model.purpose}" id="purpose" name="purpose"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >课程说明：</td>
	<td>
		<input type="text" value="${model.description}" id="description" name="description"    datatype='string' max='-1' ignore='ignore'  tip='长度不能超过-1'/>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" class="leftbor" >培训目标：</td>
	<td>
		<input type="text" value="${model.trainTarget}" id="trainTarget" name="trainTarget"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" class="leftbor" >考核方式：</td>
	<td>
		<input type="text" value="${model.checkWay}" id="checkWay" name="checkWay"    datatype='string' max='1' ignore='ignore'  tip='长度不能超过1'/>
	</td>
</tr>
</table>         
