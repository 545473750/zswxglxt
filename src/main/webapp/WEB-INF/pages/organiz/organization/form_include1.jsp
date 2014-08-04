<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
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
		$("#managerId").val(itemvalue);
		$("#managerName").val(item);
	};
	
</script>
	<s:hidden id="id" name="id" />
	<input type="hidden" name="flag" value="refresh" />
	
	<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
		
		
		<tr class="jg">
			<td height="36" class="leftbor">上级部门*:</td>
			<td>
				<c:if test="${empty parent }">无</c:if>
				<input type="hidden" name="parentId" value="${parent.id }">
				${parent.name }
			</td>
		</tr>
		
		<tr class="jg">
			<td height="36" class="leftbor">部门名称*:</td>
			<td><input type="text" value="${model.name}" id="name" name="name" datatype='*' max='100' tip='长度不能超过100' /></td>
		</tr>
		
		<tr class="jg">
			<td  width="130" height="36" class="leftbor">上级领导*:</td>
			<td>
				<input type="text" id="managerName" value="${model.manager.username }" onfocus="openDialog('${ctx }/common/CommonUser!list.do')">
				<input type="hidden" id="managerId" name="managerId" value="${model.manager.id }" >
			
			</td>
		</tr>
		<tr class="jg">
			<td  class="leftbor">业务范围:</td>
			<td>
				<select id="scope" name="scope" datatype="*" nullmsg="单位性质！" errormsg="请选择单位性质！">
					<option value="" selected="selected">---请选择---</option>
					<c:forEach items="${ywfwMap}" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.scope }">selected="selected"</c:if>>
						${item.value }
					</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		
		
		
		<tr class="jg">
			<td height="36" class="leftbor">描述:</td>
			<td>
				
				<textarea rows="6" cols="60" id="description" name="description"></textarea>
			</td>
		</tr>
		
		<tr class="jg">
			<td height="36" class="leftbor">显示排序*:</td>
			<td><input type="text" value="${model.sequence}" id="sequence" name="sequence"  /></td>
		</tr>
		
	</table>
	
	<div id="dialog" style="overflow: hidden;">
	<iframe id="addSit" frameborder="0" marginheight="0" scrolling="auto" marginwidth="0" width="570" height="480"></iframe>
	</div>
