<%@ page import="com.opendata.organiz.model.Station" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
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
	</script>
	
	<script type="text/javascript">
		// 添加功能
		function addToList(id, name){
			if(window.parent.document.getElementById("ids").value == ""){
				// 设置ID
				window.parent.document.getElementById("ids").value = id;
				// 设置NAME
				window.parent.document.getElementById("names").value = name;
			} else {
				// 重复的要去掉
				var temp = window.parent.document.getElementById("ids").value;
				if(temp.indexOf(id) != -1) {
					
					// 提示
					$(function() {
						$( "#flash_message" ).dialog({width:70, height:50, draggable: false, resizable: false, show: "Bounce", hide: "puff" });
						// remove title bar
						//$(".ui-dialog-titlebar").hide();
						setTimeout(function() {
							$( "#flash_message" ).dialog( "close" );
						}, 2000 );
					});
					
					return;
				}
				// 设置ID
				window.parent.document.getElementById("ids").value = window.parent.document.getElementById("ids").value + "," + id;
				// 设置NAME
				window.parent.document.getElementById("names").value = window.parent.document.getElementById("names").value + "," + name;
			}
			// 显示
			window.parent.document.getElementById("selectedHTML").innerHTML = 
				window.parent.document.getElementById("selectedHTML").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text'>" + name + "</p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "', '" + name + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
		}
	</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm" action="<c:url value="/organiz/User!stationList.do"/>" method="post" style="display: inline;">
		<!-- 查询块 -->
		<div class="search" id="search" style="height: 25px;overflow: hidden;padding-top: 0px;">
		   <div class="search-form">
		   <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<td class="tdLabel"><%=Station.ALIAS_NAME%></td>		
					<td><input value="${query.name}" name="name" maxlength="20" style="width: 100px;"/></td>
					<td><input type="image" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/organiz/User!stationList.do'"/></td>
				</tr>	
		      </table>
		    </div>
		    </div>
		</div>
		<div class="gridTable">
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr height="20px;">
				<th width="35" align="center">序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th><%=Station.ALIAS_NAME%></th>
				<th><%=Station.ALIAS_CODE%></th>
	
				<th width="40" align="center">操作</th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><c:out value='${item.name}'/>&nbsp;</td>
				<td><c:out value='${item.code}'/>&nbsp;</td>
				<td>
				<a href="javascript:void(0);" onclick="addToList('${item.id}', '${item.name }');"> 添加</a>
				</td>
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
		<!-- 分页 -->
		<simpletable:compToolbar page="${page}"></simpletable:compToolbar>
		</div>
	</form>
	
	<div id="flash_message" align="center" title="提示信息" style="display:none;padding-top: 4px;background-color: #EEFFFF;">
		当前记录已选中！
	</div>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="/base.jsp"%>
