<%@page import="com.opendata.calendar.model.*" %>
  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<rapid:override name="head">
	<title><%=SysCalendar.TABLE_ALIAS%> 维护</title>
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
			window.simpleTable = new SimpleTable('queryForm','${page.thisPageNumber}','${page.pageSize}','${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>
<rapid:override name="content">
	<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm" action="<c:url value="/calendar/SysCalendar!list.do"/>" method="post" style="display: inline;">
	<!-- 内容区开始 -->
	<div class="mainbox-top"><img src="<c:url value="images/mainbox01.gif"/>" width="7" height="7" /></div><!-- 上圆角边线 -->
	<div class="mainbox">
		<div class="mainsubnav">
		    <div class="m-title" onclick="toggleContent()"><span><img src="<c:url value="images/main_ico04.gif"/>" width="16" height="16" align="absmiddle" /> 查询</span></div>
		    <div class="m-nav"><a href="javascript:windowLocation('${ctx}/calendar/SysCalendar!create.do');"><img src="<c:url value="images/main_ico05.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 添加</a> 
		    <a href="javascript:batchEdit('${ctx}/calendar/SysCalendar!edit.do','items',document.forms.queryForm)"><img src="<c:url value="images/main_ico07.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 修改</a>
		    <a href="javascript:batchDelete('${ctx}/calendar/SysCalendar!delete.do','items',document.forms.queryForm)"><img src="<c:url value="images/main_ico06.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 删除</a></div>
		  </div>
		  <!-- 查询块 -->
		  <div class="search" id="search">
		    <div class="search-tit"><img src="<c:url value="images/searchico.jpg"/>" width="30" height="31" align="absmiddle" /> 查询</div>
		    <div class="search-form">
		    <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<td class="tdLabel"><%=SysCalendar.ALIAS_DAY%></td>		
					<td>
						<input value="${query.day}" id="day" name="day" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysCalendar.ALIAS_MONTH%></td>		
					<td>
						<input value="${query.month}" id="month" name="month" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysCalendar.ALIAS_REMARK%></td>		
					<td>
						<input value="${query.remark}" id="remark" name="remark" maxlength="500"  class=""/>
					</td>
					<td class="tdLabel"><%=SysCalendar.ALIAS_STATE%></td>		
					<td>
						<input value="${query.state}" id="state" name="state" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td><input type="image" id="imageField" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/calendar/SysCalendar!list.do'"/></td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysCalendar.ALIAS_SYS_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.sysDateBegin}' pattern='<%=SysCalendar.FORMAT_SYS_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=SysCalendar.FORMAT_SYS_DATE%>'})" id="sysDateBegin" name="sysDateBegin"   />
						<input value="<fmt:formatDate value='${query.sysDateEnd}' pattern='<%=SysCalendar.FORMAT_SYS_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=SysCalendar.FORMAT_SYS_DATE%>'})" id="sysDateEnd" name="sysDateEnd"   />
					</td>
					<td class="tdLabel"><%=SysCalendar.ALIAS_WEEK%></td>		
					<td>
						<input value="${query.week}" id="week" name="week" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysCalendar.ALIAS_YEAR%></td>		
					<td>
						<input value="${query.year}" id="year" name="year" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td><input type="image" id="imageField" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/calendar/SysCalendar!list.do'"/></td>
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
				<th sortColumn="day" ><%=SysCalendar.ALIAS_DAY%></th>
				<th sortColumn="month" ><%=SysCalendar.ALIAS_MONTH%></th>
				<th sortColumn="remark" ><%=SysCalendar.ALIAS_REMARK%></th>
				<th sortColumn="state" ><%=SysCalendar.ALIAS_STATE%></th>
				<th sortColumn="sysDate" ><%=SysCalendar.ALIAS_SYS_DATE%></th>
				<th sortColumn="week" ><%=SysCalendar.ALIAS_WEEK%></th>
				<th sortColumn="year" ><%=SysCalendar.ALIAS_YEAR%></th>
	
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><c:out value='${item.day}'/>&nbsp;</td>
				<td><c:out value='${item.month}'/>&nbsp;</td>
				<td><c:out value='${item.remark}'/>&nbsp;</td>
				<td><c:out value='${item.state}'/>&nbsp;</td>
				<td><c:out value='${item.sysDateString}'/>&nbsp;</td>
				<td><c:out value='${item.week}'/>&nbsp;</td>
				<td><c:out value='${item.year}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/calendar/SysCalendar!show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/calendar/SysCalendar!edit.do?id=${item.id}&"><img src="<c:url value="images/main_ico07.gif"/>" width="16" height="16" border="0" align="absmiddle" /> 修改</a>
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
</rapid:override>
<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>

