<%@ page import="com.opendata.organiz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%> 维护</title>

	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">	
	<style type="text/css">
		<!--
		html,body {height:100%;_overflow-x:hidden;_margin-right:16px;}
		-->
	</style>
	<script type="text/javascript"
		src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm', '${page.thisPageNumber}', '${page.pageSize}', '${pageRequest.sortColumns}');
		});
	</script>
	
	<script type="text/javascript">
	// 添加功能
	function addToList(id,name){
		if(window.parent.document.getElementById("ids").value == ""){
			window.parent.document.getElementById("ids").value = id;
		} else {
			// 重复的要去掉
			var temp = window.parent.document.getElementById("ids").value;
			if(temp.indexOf(id) != -1) {
				
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
			
			window.parent.document.getElementById("ids").value = window.parent.document.getElementById("ids").value + "," + id;
		}
		
		// 显示
		/*
		window.parent.document.getElementById("userList").innerHTML = 
			window.parent.document.getElementById("userList").innerHTML + "<span id='"+id+"'>" + name + "&nbsp;<input type='text' name='sortNum' style='width:30px;height:13px;'/>&nbsp;<a onclick=\"delItem('"+id+"')\" href='#'>X</a>&nbsp;&nbsp;</span>";
		*/
		window.parent.document.getElementById("userList").innerHTML = 
			window.parent.document.getElementById("userList").innerHTML + "<div class='iframe_name_box' id='" + id + "'><p class='iframe_name_text'>" + name + "&nbsp;<input type='text' name='sortNum' style='width:30px;height:18px;'/></p><p class='iframe_name_close'><a onclick=\"delItem('" + id + "')\"><img src='${ctx}/images/component/open_textboxclose.gif' width='11' height='11' /></a></p></div>";
	}
	</script>
</rapid:override>

<rapid:override name="content">
<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm"
		action="<c:url value="/organiz/Organization!choiceUserList.do?partitionId=${partitionId}"/>" method="post"
		style="display: inline;">

		<!-- 查询块 -->
		<div class="search" id="search" style="height: 25px;overflow: hidden;padding-top: 0px;">
		   <div class="search-form">
		   <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<td class="tdLabel"><%=User.ALIAS_USERNAME%></td>		
					<td><input value="${query.username}" id="username" name="username" maxlength="20" style="width: 100px;"/></td>
					
					<%-- 
					<td class="tdLabel"><%=User.ALIAS_ABLEDFLAG%></td>		
					<td>
						<select name="abledFlag">
							<option value="">--请选择--</option>
							<option value="0" <c:if test="${abledFlag eq '0' }">selected="selected"</c:if>>启用</option>
							<option value="1" <c:if test="${abledFlag eq '1' }">selected="selected"</c:if>>禁用</option>
						</select>
					</td>
					--%>
					<td><input type="image" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/organiz/Organization!choiceUserList.do?partitionId=${partitionId}'"/></td>
				</tr>	
		      </table>
		    </div>
		    </div>
		</div>
		<div class="gridTable">
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr height="20px;">
			  	<!-- 
			  	<th><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
			  	-->
				<th>序号</th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="username" ><%=User.ALIAS_USERNAME%></th>
				<th sortColumn="dept_id" ><%=User.ALIAS_DEPTS%></th>
	
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
		  	  	<%-- 
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
		  	  	--%>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><c:out value='${item.username}'/>&nbsp;</td>
				<td><c:out value='${item.deptsString}'/>&nbsp;</td>
				<td>
					<a href="javascript:void(0);" onclick="javascript:addToList('${item.id}', '${item.username }');"> 添加</a>
				</td>
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
		
		<simpletable:compToolbar page="${page}"></simpletable:compToolbar>
		</div>
	</form>
	
	<div id="flash_message" align="center" title="提示信息" style="display:none;padding-top: 4px;background-color: #EEFFFF;">
		当前记录已选中！
	</div>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>

