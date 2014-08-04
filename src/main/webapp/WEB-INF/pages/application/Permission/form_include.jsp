<%@page import="com.opendata.application.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />
	<c:if test="${not empty id }">
	<input type="hidden" name="oldUrl" value="${model.url }"/>
	</c:if>
	
	<s:hidden id="icon" name="icon" />
	
	<s:hidden id="bigIcon" name="bigIcon" />
	
	<span>
		<input type="hidden" name="applicationId" value="${query.applicationId }">
		<input type="hidden" name="parentId" value="${query.parentId }">
	</span>
	
	<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
	
	
	<c:if test="${empty  model.id}">
	<tr class="jg">
	<td class="tdLabel">父访问入口:</td>
	<td>${model.parentPermission==null?'根节点':model.parentPermission.name}</td>
	</tr>
	</c:if>
<!-- ONGL access static field: @package.class@field or @vs@field -->
	<c:if test="${ empty  model.id}">
	<s:textfield label="%{@com.opendata.application.model.Permission@ALIAS_CODE}" key="code" value="%{model.code}" cssClass="required " maxlength="20" required="true" />
	</c:if>
	<c:if test="${!empty  model.id}">
	<td class="tdLabel"><%= com.opendata.application.model.Permission.ALIAS_CODE%>:</td>
	<td>
	${model.code }
	</td>
	</c:if>
	
	<s:textfield label="%{@com.opendata.application.model.Permission@ALIAS_NAME}" key="name" value="%{model.name}" cssClass="required " maxlength="20" required="true" />
	<c:if test="${! (! empty  parentPermission && parentPermission.type=='1')}">
	<td class="tdLabel"><%=com.opendata.application.model.Permission.ALIAS_TYPE %>:</td>
	<td>
	<input type="radio" value="0" name="type" onclick="document.getElementById('urlDiv').style.display='none'" ${model.type=='0'?'checked':''}>目录   <input type="radio" name="type" value="1" onclick="document.getElementById('urlDiv').style.display='block'" ${model.type=='1'?'checked':''}>菜单入口
	</td>
    </c:if>
    
<c:if test="${(! empty  parentPermission && parentPermission.type=='1')}">
	<s:hidden id="type" name="type" value="2" />
</c:if>

	<div id="urlDiv" style="display: none">
	<s:textfield label="%{@com.opendata.application.model.Permission@ALIAS_URL}" key="url" value="%{model.url}" cssClass=""  />
	</div>
	<script type="text/javascript">
     var urlDiv = document.getElementById("urlDiv");
     var type = '${model.type}';
     var parentType = '${parentPermission.type}';
     if(type == '1'||parentType=='1'){
     	urlDiv.style.display='block';
     }else{
     	urlDiv.style.display='none';
     }
</script>
	<tr class="jg">
	<td class="tdLabel"><%=com.opendata.application.model.Permission.ALIAS_ICON %>:</td>
	<td>
	<s:div label="%{@com.opendata.application.model.Permission@ALIAS_ICON}" id="iconDiv"><c:if test="${model.icon!=null && model.icon!=''}"><img src="${ctx}/${model.icon}"/></c:if>
	<input type="button" value="选择" onclick="openDialog('${ctx}/application/Application!getIcons.do?id=${model.id}');"/></s:div>
	</td></tr>
	<tr>
	<td class="tdLabel"><%=com.opendata.application.model.Permission.ALIAS_BIGICON %>:</td>
	<td>
	<s:div label="%{@com.opendata.application.model.Permission@ALIAS_BIGICON}" id="bigIconDiv"><c:if test="${model.bigIcon!=null && model.bigIcon!=''}"><img src="${ctx}/${model.bigIcon}"/></c:if></s:div>
	</td></tr>
	
	
	
   <s:textfield label="%{@com.opendata.application.model.Permission@ALIAS_SEQUENCE}" cssStyle="width:155px;" key="sequence" value="%{model.sequence}" cssClass="required validate-integer " maxlength="4" required="true" />
	
	<s:textarea label="%{@com.opendata.application.model.Permission@ALIAS_DESCRIPTION}" cssStyle="width:330px;height:70px;" key="description" value="%{model.description}" cssClass="" required="false" />
	</table>
