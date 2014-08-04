<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
	//修改教学方式
	function changeTeachWay(obj){
		var teachWay = obj.value;
		if(teachWay=='2'){
			$("#span_place").show();
		}else{
			$("#span_place").hide();
		}
	}
</script>
<input type="hidden" name="classTermId" value="${query.termId }"/>
<input type="hidden" name="bigclassId" value="${query.bigclassId }"/>
<input type="hidden" name="classTermBjId" value="${query.classId }"/>
<input type="hidden" name="occurTime" value="${query.occurTime }"/>
<input type="hidden" name="id" value="${model.id }"/>        	
<!-- 实体表单-->
<table cellpadding="0" cellspacing="0" border="0" class="listTable" style="width:100%;" >
<!-- 
<tr class="jg" >
	<td width="100" height="36" class="leftbor" >课程名称：</td>
	<td colspan="3">
		<select name="classCourseId" datatype='*'  >
			<c:forEach items="${cc }" var="item">
				<option value="${item.id }"  <c:if test="${item.id==model.classCourseId }">selected="selected"</c:if> >${item.courseName }</option>
			</c:forEach>
		</select>
	</td>
</tr>

<tr  >
	<td height="36" class="leftbor" >上课日期：</td>
	<td>
		<input type="text" value="${model.occurTime}" id="occurTime" name="occurTime"    datatype='string' max='19' ignore='ignore'  tip='长度不能超过19'/>
	</td>
</tr>
 -->
<tr class="jg" >
	<td width="100" height="36" class="leftbor" >上课开始时间：</td>
	<td width="200" >
		<input type="text"  value="${model.startHour}" onclick="WdatePicker({dateFmt:'HH:mm'})" id="startHour" name="startHour"  style="width:60px; "  datatype='*'  />
		<input type="hidden"  value="${model.startTime}"  name="oldStartTime"    />
	</td>
	
	<td  width="100" height="36" class="leftbor" >上课结束时间：</td>
	<td>
		<input type="text" value="${model.endHour}" onclick="WdatePicker({dateFmt:'HH:mm'})"  id="endHour" name="endHour"  style="width:60px; "   datatype='*'    />
		<input type="hidden"  value="${model.endTime}"  name="oldEndTime"  />
	</td>
	
</tr>


<tr class="jg" >
	<td  height="36" class="leftbor" >授课方式：</td>
	<td colspan="3">
		<!-- 
		<c:forEach items="${teachWayMap }" var="item">
			
			<input type="radio" name="teachWay"  value="${item.key }" <c:if test="${item.key==model.teachWay }">checked="checked"</c:if> />${item.value }
		</c:forEach>
		 -->
		<select name="teachWay" style="width: 100px;" onchange="changeTeachWay(this)" >
			<c:forEach items="${teachWayMap }" var="item">
				<option  value="${item.key }" <c:if test="${item.key==model.teachWay }">selected="selected"</c:if>>${item.value }</option>
			</c:forEach>
		</select>
		
		<span style="margin-left: 10px;display: none;" id="span_place" >
			预定场地：
			<select name="placeId" style="width: 100px;" >
			<c:forEach items="${places }" var="item">
				<option  value="${item.id }" <c:if test="${item.id==model.placeId }">selected="selected"</c:if>>${item.name }</option>
			</c:forEach>
		</select>
		</span>
		
	</td>
	
	
	
</tr>
<tr>
	<td  height="36" class="leftbor" >授课内容：</td>
	<td colspan="3" >
		<textarea rows="5" cols="50" name="teachContent" >${model.teachContent}</textarea>
	</td>
</tr>
</table>         
