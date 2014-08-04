<%@ page import="com.opendata.organiz.model.*" %>
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
		$(function() {
			$("#dialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> ',
		        autoOpen: false,
		        width: 600,
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
			window.simpleTable = new SimpleTable('queryForm', '${page.thisPageNumber}', '${page.pageSize}','${pageRequest.sortColumns}');
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
		function confirm(){
			document.getElementById('queryForm').submit();
		}
	</script>
</rapid:override>

<rapid:override name="content">
	<body class="mainbody">
	<input type="hidden" value="0"  id="state"/>
	<form id="queryForm" name="queryForm"
		action="<c:url value="/sys/System!configSynchronous.do"/>" method="post"
		style="display: inline;">

	<!-- systemid -->
	<input type="hidden" name="systemId" value="${systemId }" />

	<!-- 内容区开始 -->
	<div class="mainbox" style="margin-right: 0px;">
		<div class="mainsubnav">
	    <div class="m-title" onclick="toggleContent()"><span><img src="<c:url value="images/main_ico04.gif"/>" width="16" height="16" align="absmiddle" /> 查询</span></div>
	    
	    <div class="m-nav">
	    <a href="javascript:confirm();"><img src="<c:url value="images/main_ico05.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 确定</a> 
	    <a onclick="window.parent.closeDialog();"><img src="<c:url value="images/main_ico06.gif"/>" width="14" height="15" border="0" align="absmiddle" /> 取消</a>
	    </div>
		</div>
		<!-- 查询块 -->
		<div class="search" id="search" style="display: none;">
		   <div class="search-tit"><img src="<c:url value="images/searchico.jpg"/>" width="30" height="31" align="absmiddle" /> 查询</div>
		   <div class="search-form">
		   <div class="queryPanel">
		      <table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>	
					<td class="tdLabel"><%=User.ALIAS_USERNAME%></td>		
					<td><input value="${query.username}" id="username" name="username" maxlength="20"  class=""/></td>
					<td><input type="image" src="<c:url value="images/cx.gif"/>" onclick="getReferenceForm(this).action='${ctx}/organiz/User!list.do'"/></td>
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
				<th sortColumn="username" ><%=User.ALIAS_USERNAME%></th>
				<th sortColumn="sex" ><%=User.ALIAS_SEX%></th>
				<th sortColumn="phone" ><%=User.ALIAS_PHONE%></th>
				<th sortColumn="dept_id" ><%=User.ALIAS_DEPTS%></th>
			  </tr>
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td><input type="checkbox" name="items" value="id=${item.id}&" <c:if test="${fn:indexOf(selectedUser, item.id) != -1 }">checked="checked"</c:if>></td>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><c:out value='${item.username}'/>&nbsp;</td>
				<td><c:out value='${item.sexString}'/>&nbsp;</td>
				<td><c:out value='${item.phone}'/>&nbsp;</td>
				<td><c:out value='${item.deptsString}'/>&nbsp;</td>
			  </tr>
		  	  </c:forEach>
		  </tbody>
		</table>
		
		<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
		</div>
	</div>
	</form>
</body>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>

