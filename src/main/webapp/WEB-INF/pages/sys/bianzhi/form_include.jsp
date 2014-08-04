<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
	        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择上级领导',
	        autoOpen: false,
	        width: 570,
	        height:500,
	        resizable: false,
	        modal: true,
	        autoResize: true,
	        overlay: {
	               opacity: 0.5,
	               background: "black"
	           }
	    });
	});
	
	var selectItems = function(item,itemvalue){
		$("#userId").val(itemvalue);
		$("#userName").val(item);
	};
	
</script>
<input type="hidden" name="id"  value="${id }">
<!-- 实体表单-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="uiTable">
<tr  class="jg" >
	<td width="15%" height="36" align="center" >所属部门：</td>
	<td>
		${organization.name }
		<input type="hidden" name="orgId"  value="${organization.id }">
		<input type="hidden" name="deptId"  value="${query.deptId }">
	</td>
</tr>
<tr >
	<td width="10%" height="36" align="center" >编制名称：</td>
	<td>
		<input type="text" value="${model.name}" id="name" name="name"    datatype='string' max='32'   tip='长度不能超过32' style="width: 320px"/>
	</td>
</tr>

<tr class="jg" >
	<td width="10%" height="36" align="center">业务范围：</td>
	<td>
		<select id="scope" name="scope" datatype="*" nullmsg="请选业务范围！" errormsg="请选业务范围！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${ywfw}" var="item">
					<option value="${item.key}"
						<c:if test="${item.key==model.scope}"> selected="selected"</c:if> >
						${item.value}
					</option>
				</c:forEach>
			</select>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" align="center" >角色：</td>
	<td>
			<select id="roleId" name="roleId" datatype="*" nullmsg="请选角色！" errormsg="请选角色！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${roles}" var="item">
					<option value="${item.id}"
						<c:if test="${item.id==roleId}"> selected="selected"</c:if> >
						${item.name}
					</option>
				</c:forEach>
			</select>	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" align="center">学科：</td>
	<td>
		<select id="subjectId" name="subjectId" datatype="*" nullmsg="请选学科！" errormsg="请选学科！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${xk}" var="item">
					<option value="${item.key}"
						<c:if test="${item.key==model.subjectId}"> selected="selected"</c:if> >
						${item.value}
					</option>
				</c:forEach>
			</select>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" align="center" >学段：</td>
	<td>
		<select id="semester" name="semester" datatype="*" nullmsg="请选学段！" errormsg="请选学段！">
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${xd}" var="item">
					<option value="${item.key}"
						<c:if test="${item.key==model.semester}"> selected="selected"</c:if> >
						${item.value}
					</option>
				</c:forEach>
			</select>
	</td>
</tr>


<tr class="jg">
	<td width="10%" height="36" align="center" >在编人员：</td>
	<td>
		<input type="text" id="userName" value="${model.user.username }" onfocus="openDialog('${ctx }/common/CommonUser!list.do')">
		<input type="hidden" id="userId" name="userId" value="${model.userId }" >
	
	</td>
</tr>

<tr  >
	<td width="10%" height="36" align="center" >是否外部编制：</td>
	<td>
				<input type="radio" value="0"  name="isOut" <c:if test="${0==model.isOut}"> checked="checked"</c:if>/>是
			    <input type="radio" value="1"  name="isOut" <c:if test="${1==model.isOut}"> checked="checked"</c:if>/>否
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" align="center" >直接上级：</td>
	<td>
		<select id="parentId" name="parentId" >
				<option selected="selected" value="">--请选择--</option>
				<c:forEach items="${parentBz}" var="item">
					<option value="${item.id}" <c:if test="${item.id==model.parentId}"> selected="selected"</c:if> >
						${item.name}_${item.user.username}
					</option>
				</c:forEach>
			</select>
	</td>
</tr>
<tr  >
	<td width="10%" height="36" align="center">编制说明：</td>
	<td>
		<textarea id="description" name="description"  max='200'  cols="78" rows="10">${model.description}</textarea>
	</td>
</tr>
<tr class="jg" >
	<td width="10%" height="36" align="center" >显示顺序：</td>
	<td>
		<c:if test="${empty model.id }">
			<input type="text" value="1" id="seq" name="seq"    datatype='integer'   tip='请输入一个整数' style="width: 320px"/>
		</c:if>
		<c:if test="${not empty model.id }">
			<input type="text" value="${model.seq }" id="seq" name="seq"    datatype='integer'   tip='请输入一个整数' style="width: 320px"/>
		</c:if>
	</td>
</tr>
</table>    
     
<div id="dialog" style="overflow: hidden;">
	<iframe id="addSit" frameborder="0" marginheight="0" scrolling="auto" marginwidth="0" width="570" height="480"></iframe>
	</div>
