<%@page import="com.opendata.organiz.model.*" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=Organization.TABLE_ALIAS%> 维护</title>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">	
	<style type="text/css">
		<!--
		html,body {height:100%;_overflow-x:hidden;_margin-right:16px;}
		-->
	</style>
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<script type="text/javascript">
	
	$(function() {
		$("#dialog").dialog({
	        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 移动',
	        autoOpen: false,
	        width: 400,
	        //height: 276,
	        resizable: false,
	        modal: true,
	        autoResize: true,
	        overlay: {
	               opacity: 0.5,
	               background: "black"
	           }
	    });
	});
	
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
		function add(pid, org_type){
			location.href = "${ctx}/organiz/Organization!create.do?id=" + pid + "&org_type=" + org_type;
		}
		
		function move(pid, itemid) {
			openDialog('${ctx}/organiz/Organization!move.do?id=' + itemid + '&parentOrganizationId=' + pid);
		}
	</script>
</rapid:override>

<rapid:override name="content">
	<body class="mainbody">
	
	

	<%-- 
	${pid } | ${organizationModel.type }
	--%>
	
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm" method="post" style="display: inline;">

	<!-- 内容区开始 -->
	<!-- 上圆角边线 -->
	<%-- 
	<div class="mainbox-top" style="margin-right: 0px;"><img src="<c:url value="images/mainbox01.gif"/>" width="7" height="7" /></div>
	--%>
	<div class="mainbox" style="margin-right:0px;border: 0px;">
		
		 
		  
		<div class="gridTable">
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th>序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="name" height="20"><%=Organization.ALIAS_NAME%></th>
				<th sortColumn="code" ><%=Organization.ALIAS_CODE%></th>
				<th sortColumn="type" ><%=Organization.ALIAS_TYPE%></th>
				<th sortColumn="sequence" ><%=Organization.ALIAS_SEQUENCE%></th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${listByPartition}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${1 + status.index}</td>
				
				<td>
				<a href="${ctx}/organiz/Organization!show.do?id=${item.id}&parentid=${pid }&org_type=${organizationModel.type }">
				<c:out value='${item.name}'/>
				</a>&nbsp;
				</td>
				
				<td><c:out value='${item.code}'/>&nbsp;</td>
				<td><c:out value='${item.typeString}'/>&nbsp;</td>
				<td><c:out value='${item.sequence}'/>&nbsp;</td>

			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	    </div>
	</div>
	<div class="mainbox-bot"><img src="<c:url value="images/mainbox03.gif"/>" width="7" height="7" /></div><!-- 下圆角边线 -->	
	</form>
	
	<div id="dialog" style="overflow: hidden;">
	<iframe id="addSit" frameborder="0" marginheight="0" scrolling="auto" marginwidth="0" width="400" height="300"></iframe>
	</div>
	
	
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>