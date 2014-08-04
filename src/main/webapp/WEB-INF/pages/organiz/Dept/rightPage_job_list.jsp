<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title>岗位列表</title>

	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">	
	<style type="text/css">
		<!--
		html,body {height:100%;_overflow-x:hidden;_margin-right:16px;}
		-->
	</style>
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm', '${page.thisPageNumber}', '${page.pageSize}', '${pageRequest.sortColumns}');
		});
		function toggleContent(){
			var state=document.getElementById("state");
			if(state.value==0){
				state.value=1;
				document.getElementById("search").style.display="none";
			}else{
			     state.value=0;
			     document.getElementById("search").style.display="block";
			}
		}
	</script>
</rapid:override>

<rapid:override name="content">
	<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm"
		action="<c:url value="/organiz/Organization!loadDefaultStation.do?parentid=${parentid }&partitionId=${partitionId}"/>" 
		method="post"
		style="display: inline;">

	<!-- 内容区开始 -->
	<div class="mainbox" style="margin-right:0px;">
	  <div class="mainsubnav">
	    <div class="m-title" onclick="toggleContent()">
	    	<span><img src="<c:url value="images/main_ico04.gif"/>" width="16" height="16" align="absmiddle" /> 查询</span>
	    </div>
	    <div class="m-nav">
	    <a href="javascript:add(parentid);"><img src="<c:url value="images/main_ico05.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 确定</a> 
	    <a onclick="window.parent.closeDialog();"><img src="<c:url value="images/main_ico06.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 取消</a>
	    </div>
	  </div>
		  
	  <!-- 查询块 -->
	  <div class="search" id="search">
	    <div class="search-tit"><img src="<c:url value="images/searchico.jpg"/>" width="30" height="31" align="absmiddle" /> 查询</div>
	    <div class="search-form">
	    <div class="queryPanel">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>	
				<td class="tdLabel"><%=Station.ALIAS_NAME%></td>		
				<td><input value="${query.name}" id="name" name="name" maxlength="20" class=""/></td>
				<td>
				<input type="image" src="<c:url value="images/cx.gif"/>" 
					onclick="getReferenceForm(this).action='${ctx}/organiz/Organization!loadDefaultStation.do?parentid=${parentid }&partitionId=${partitionId}'"/></td>
			</tr>	
	      </table>
	      </div>
	    </div>
	  </div>
		  
		<div class="gridTable">
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
			  	<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				<th>序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="name" ><%=Station.ALIAS_NAME%></th>
				<th sortColumn="code" ><%=Station.ALIAS_CODE%></th>
				<th sortColumn="level" ><%=Station.ALIAS_LEVEL%></th>
				<th sortColumn="organization_id" ><%=Station.ALIAS_ORGANIZATION_ID%></th>
				<th sortColumn="sequence" ><%=Station.ALIAS_SEQUENCE%></th>
				<th sortColumn="ts" ><%=Station.ALIAS_TS%></th>
	
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td><input type="checkbox" name="items" value="id=${item.id}&partitionId=${partitionId}" <c:if test="${fn:indexOf(selectedItems, item.id) != -1 }">checked="checked"</c:if> ></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><c:out value='${item.name}'/>&nbsp;</td>
				<td><c:out value='${item.code}'/>&nbsp;</td>
				<td><c:out value='${item.levelString}'/>&nbsp;</td>
				<td><c:out value='${item.orgString}'/>&nbsp;</td>
				<td><c:out value='${item.sequence}'/>&nbsp;</td>
				<td><c:out value='${item.ts}'/>&nbsp;</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
		
		<simpletable:pageToolbar page="${page }"></simpletable:pageToolbar>
	</div>
	</div>
	</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>