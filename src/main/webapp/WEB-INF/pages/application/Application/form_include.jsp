<%@page import="com.opendata.application.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />
	
	<s:hidden id="icon" name="icon" />
	
	<s:hidden id="bigIcon" name="bigIcon" />
	<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
<!-- ONGL access static field: @package.class@field or @vs@field -->
	<c:if test="${ empty  model.id}">
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_CODE}" cssStyle="width:155px;" key="code" value="%{model.code}" cssClass="required " required="true" />
	</c:if>
	<c:if test="${!empty  model.id}">
	<td class="tdLabel"><%= com.opendata.application.model.Application.ALIAS_CODE%>:</td>
	<td>
	${model.code }
	</td>
	</c:if>
	
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_NAME}" cssStyle="width:155px;" key="name" value="%{model.name}" cssClass="required " required="true" />
	<c:if test="${ empty  model.id}">
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_VERSION}"  cssStyle="width:155px;" key="version" value="%{model.version}" cssClass="required" required="true" />
	</c:if>
	<c:if test="${!empty  model.id}">
	<td class="tdLabel"><%= com.opendata.application.model.Application.ALIAS_VERSION%>:</td>
	<td>
	${model.version }
	</td>
	</c:if>
	
	<s:select label="%{@com.opendata.application.model.Application@ALIAS_TYPE}"  id="type" name="type" list="appTypeMap" listKey="key" listValue="value" headerKey="" value="%{model.type}"/>
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_SEQUENCE}"  cssStyle="width:155px;" key="sequence" value="%{model.sequence}" cssClass="required validate-integer " maxlength="4" required="true" />
	
	
	<tr>
	<td class="tdLabel"><%=com.opendata.application.model.Application.ALIAS_ICON %>:</td>
	<td>
	<s:div label="%{@com.opendata.application.model.Application@ALIAS_ICON}" id="iconDiv"><c:if test="${model.icon!=null && model.icon!=''}"><img src="${ctx}/${model.icon}"/></c:if>
	<input type="button" value="选择" onclick="openDialog('${ctx}/application/Application!getIcons.do?id=${model.id}');"/></s:div>
	</td>
	</tr>
	<tr>
	<td class="tdLabel"><%=com.opendata.application.model.Application.ALIAS_BIG_ICON %>:</td>
	<td>
	<s:div label="%{@com.opendata.application.model.Application@ALIAS_BIG_ICON}" id="bigIconDiv"><c:if test="${model.bigIcon!=null && model.bigIcon!=''}"><img src="${ctx}/${model.bigIcon}"/></c:if></s:div>
	</td></tr>
		
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_INITIALIZE_PAGE}" cssStyle="width:155px;" key="initializePage" value="%{model.initializePage}"  />
	
	<s:textfield label="%{@com.opendata.application.model.Application@ALIAS_CONFIGURATION_PAGE}" cssStyle="width:155px;" key="configurationPage" value="%{model.configurationPage}"   />
	
	
	
	<s:textarea label="%{@com.opendata.application.model.Application@ALIAS_DESCRIPTION}" cssStyle="width:330px;height:70px;" key="description" value="%{model.description}" cssClass="" required="false" />
	</table>
	
	
	
	
	
	
	
