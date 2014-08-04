<%@ page import="com.opendata.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=Dictvalue.TABLE_ALIAS%> 维护</title>

	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">	
	<style type="text/css">
		<!--
		html,body {height:100%;_overflow-x:hidden;_margin-right:16px;}
		-->
	</style>
	<script src="<c:url value="/scripts/jquery.js"/>" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm','${page.thisPageNumber}','${page.pageSize}','${pageRequest.sortColumns}');
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
		function add(){
			location.href ='${ctx}/sys/Dictvalue!create.do?dictitemId=${dictitemId}';
		}
	</script>
</rapid:override>

	<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm" action="<c:url value="/sys/Dictvalue!list.do"/>" method="post" style="display: inline;">
	<!-- 内容区开始 -->
	<div class="mainbox-top"><img src="<c:url value="images/mainbox01.gif"/>" width="7" height="7" /></div><!-- 上圆角边线 -->
	<div class="mainbox">
		<div class="mainsubnav">
		    <div class="m-title" onclick="toggleContent()"><span><img src="<c:url value="images/main_ico04.gif"/>" width="16" height="16" align="absmiddle" /> 查询</span></div>
		    <div class="m-nav"><a href="javascript:add();"><img src="<c:url value="images/main_ico05.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 添加</a> 
		    <a href="javascript:batchEdit('${ctx}/sys/Dictvalue!edit.do','items',document.forms.queryForm)"><img src="<c:url value="images/main_ico07.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 修改</a>
		    <a href="javascript:batchDelete('${ctx}/sys/Dictvalue!delete.do','items',document.forms.queryForm)"><img src="<c:url value="images/main_ico06.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 删除</a>
		    </div>
		</div>
		  <!-- 查询块 -->
		  <div class="search" id="search">
		    <div class="search-tit"><img src="<c:url value="images/searchico.jpg"/>" width="30" height="31" align="absmiddle" /> 查询</div>
		    <div class="search-form">
		    <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<td class="tdLabel"><%=Dictvalue.ALIAS_CODE%></td>		
					<td><input value="${query.code}" id="code" name="code" maxlength="20"/></td>
					<td><input type="image" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/sys/Dictvalue!list.do'"/></td>
				</tr>	
		      </table>
		      </div>
		    </div>
		  </div>
		
		<div class="gridTable">
		<table width="100%" border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
			  	<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				<th>序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="code" ><%=Dictvalue.ALIAS_CODE%></th>
				<th sortColumn="value" ><%=Dictvalue.ALIAS_VALUE%></th>
				<th sortColumn="dicitem_id" ><%=Dictvalue.ALIAS_DICTITEM_ID%></th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td><c:if test="${item.dictitem.editf=='0'}"><input type="checkbox" name="items" value="id=${item.id}&dictitemId=${item.dictitemId}&"></c:if></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><a href="${ctx}/sys/Dictvalue!show.do?id=${item.id}&"><c:out value='${item.code}'/></a>&nbsp;</td>
				<td><c:out value='${item.value}'/>&nbsp;</td>
				<td><c:out value='${item.dictitem.name}'/>&nbsp;</td>
				<td>
				<c:if test="${item.dictitem.editf=='0'}">
				<a href="${ctx}/sys/Dictvalue!edit.do?id=${item.id}&dictitemId=${item.dictitemId}&nodetype=${nodetype}"> 修改</a>
				</c:if>
				</td>
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
		
		<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</div>
	<div class="mainbox-bot"><img src="<c:url value="images/mainbox03.gif"/>" width="7" height="7" /></div><!-- 下圆角边线 -->	
	</form>
</body>


