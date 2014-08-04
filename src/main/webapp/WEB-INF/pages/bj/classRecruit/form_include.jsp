<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!-- 实体表单-->
<script type="text/javascript">
function modalNum(){
	var unitId=$("#unitId").val();
	parent.dialog({
		title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择培训班',
		autoOpen: true,
		width: 830,
		height: 550,
		modal: true,
		overlay: {
			opacity: 0.5,
			background: "black"
		},
		useIframe: true,
		url: '/bj/ClassTerm!classlist.do?unitId='+unitId+''
	});
}

function getChangeSchool(){
	var changeSchoolId=$("#changeSchoolId").val();
	parent.dialog({
		title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择学校',
		autoOpen: true,
		width: 720,
		height: 550,
		modal: true,
		overlay: {
			opacity: 0.5,
			background: "black"
		},
		useIframe: true,
		url: '/bj/ClassRecruit!toChooseSchool.do?changeSchoolId='+changeSchoolId+''
	});
}
//设置培训班名
function setIdByUnit(id,name,maxDate){
	if(id!=null&&name!=null){
		$("#unitId").val(id);
		$("#unit").val(name);
		$("#maxDate").val(maxDate);
	}
}
//设置学校名称
function setIdBySchool(id,name){
	if(id!=null&&name!=null){
		$("#changeSchoolId").val(id);
		$("#changeSchool").val(name);
	}
}
</script>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="jg" >
	<td width="15%" height="36" class="leftbor" align="right" >招生标题：</td>
	<td>
		<input type="text" size="30" value="${model.title}" id="title" name="title"    datatype='*' max='100'  tip='长度不能超过100'/>
		<input type="hidden" size="30" value="${model.id}" id="id" name="id"    datatype='string' max='100' ignore='ignore'  tip='长度不能超过100'/>
	</td>
</tr>
<tr >
	<td width="15%" height="36" class="leftbor" align="right" >选择培训班：</td>
	<td>
		<textarea cols="50" rows="4" id="unit" name="unit" onclick="modalNum();" datatype='*' max='1000' min='0' nullmsg="请选择培训班" tip='长度不能超过1000' readonly="readonly"><c:forEach items="${bigclasses }" var="class">${class.name }&nbsp;</c:forEach></textarea>
		<input type="hidden" size="30" value="${unitId}" id="unitId" name="unitId"  datatype='*' max='1000' min='0'  tip='长度不能超过1000'/>
		<input type="hidden" value="${maxDate }" id="maxDate" name="maxDate"/><!-- 期数的培训期间，报名时间必须在培训期间之前 -->
	</td>
</tr>
<tr class="jg">
	<td width="10%" height="36" class="leftbor" align="right" >报名起止时间：</td>
	<td>
		<input size="14" type="text" readonly="true" value="<fmt:formatDate value="${model.startTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'endTime\')}',isShowClear:true,readOnly:true})" id="startTime" name="startTime" datatype='date'  tip='请选择日期'/>
		-
		<input size="14" type="text" readonly="true" value="<fmt:formatDate value="${model.endTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',isShowClear:true,readOnly:true})" id="endTime" name="endTime"  datatype='date'  tip='请选择日期'/>
	</td>
</tr>
<tr>
	<td width="10%" height="36" class="leftbor" align="right" >选择学校：</td>
	<td>
		<textarea cols="50" rows="10" id="changeSchool" name="changeSchool" onclick="getChangeSchool();" datatype='*' max='1000' min='0' nullmsg="请选择学校" tip='长度不能超过1000' readonly="readonly">${changeSchool}</textarea>
		<input type="hidden" size="30" value="${changeSchoolId}" id="changeSchoolId" name="changeSchoolId"  datatype='*' max='1000' ignore='ignore'  tip='长度不能超过1000'/>
	</td>
</tr>
<tr class="jg">
	<td width="10%" height="36" class="leftbor" align="right" >录取方式：</td>
	<td>
		<input type="radio" id="enroll" name="enroll" value="0" checked="checked"/>自动录取
		<input type="radio" id="enroll" name="enroll" value="1"  <c:if test="${model.enroll == 1 }">checked="checked"</c:if>/>手动录取
	</td>
</tr>
</table>         
