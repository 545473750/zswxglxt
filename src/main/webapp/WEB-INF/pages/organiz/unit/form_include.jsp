<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
		
<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
	        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 选择管理员',
	        autoOpen: false,
	        width: 800,
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
	
	<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	
		<tr class="jg">
			<td  width="130" height="36" class="leftbor">单位编号*:</td>
			<td><input type="text" value="${model.code}" id="code" name="code" datatype='string' max='100' tip='长度不能超过100' /></td>
		</tr>
		<tr class="jg">
			<td height="36" class="leftbor">单位名称*:</td>
			<td><input type="text" value="${model.name}" id="name" name="name" datatype='*' max='100' tip='长度不能超过100' /></td>
		</tr>
		
		<tr >
			<td height="36" class="leftbor">单位级别*:</td>
			<td>
				<select id="unitlevel" name="unitlevel" datatype="*" nullmsg="单位级别！" errormsg="请选择单位级别！">
					<option value="" selected="selected">---请选择---</option>
					<c:forEach items="${dwjbMap}" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.unitlevel }">selected="selected"</c:if>>
						${item.value }
					</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr class="jg">
			<td height="36" class="leftbor">单位性质:</td>
			<td>
				<select id="nature" name="nature" datatype="*" nullmsg="单位性质！" errormsg="请选择单位性质！">
					<option value="" selected="selected">---请选择---</option>
					<c:forEach items="${dwxzMap}" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.nature }">selected="selected"</c:if>>
						${item.value }
					</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		
		<tr >
			<td height="36" class="leftbor">单位类别*:</td>
			<td>
				<select id="dataType" name="dataType" datatype="*" nullmsg="单位级别！" errormsg="请选择单位级别！">
					<option value="" selected="selected">---请选择---</option>
					<c:forEach items="${dataTypeMap}" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.dataType }">selected="selected"</c:if>>
						${item.value }
					</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr class="jg">
			<td height="36" class="leftbor">单位分类:</td>
			<td>
				<select id="sysType" name="sysType" datatype="*" nullmsg="单位性质！" errormsg="请选择单位性质！">
					<option value="" selected="selected">---请选择---</option>
					<c:forEach items="${sysTypeMap}" var="item">
					<option value="${item.key }" <c:if test="${item.key ==model.sysType }">selected="selected"</c:if>>
						${item.value }
					</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		
		<tr >
			<td height="36" class="leftbor">管理员:</td>
			<td>
				<input type="text" id="managerName" value="${manager.username }" onfocus="openDialog('${ctx }/common/CommonUser!list.do')">
				<input type="hidden" id="managerId" name="managerId" value="${manager.id }" >
			
			</td>
		</tr>
		
		
		
		<tr class="jg">
			<td height="36" class="leftbor">描述:</td>
			<td>
				
				<textarea rows="6" cols="60" id="description" name="description"></textarea>
			</td>
		</tr>
	</table>
	
	<div id="dialog" style="overflow: hidden;">
	<iframe id="addSit" frameborder="0" marginheight="0" scrolling="auto" marginwidth="0" width="820" height="480"></iframe>
	</div>
