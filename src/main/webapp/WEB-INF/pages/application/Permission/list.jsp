<%@page import="com.opendata.application.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>应用功能入口维护</title>
	<link href="${ctx}/${pattern}/css/main.css" rel="stylesheet"
		type="text/css" />
	<link href="${ctx}/styles/jquery.ui.theme.css" type="text/css"
		rel="stylesheet" />
	<script src="${ctx}/scripts/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/scripts/jquery-ui-1.8.9.custom.min.js"
		type="text/javascript"></script>
	<script src="${ctx}/scripts/My97DatePicker/WdatePicker.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	<script src="${ctx}/scripts/app.js" type="text/javascript"></script>
<script src="${ctx}/scripts/stmartFloat/smartFloat.js"
			type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

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
			document.forms.listForm.action="${ctx}/application/Permission!create.do";
			document.forms.listForm.submit();
		//	location.href ='${ctx}/application/Permission!create.do?applicationId=${query.applicationId}&queryParentId=${query.parentId}';
		}
		function applicationList(){
		   window.parent.location.href='${ctx}/application/Application!list.do';
		}
		$(function() {
			$("#moveDialog").dialog({
		        title: '<img src="${ctx}/images/main_ico14.gif"  width="16" height="16" align="absmiddle" /> 移动',
		        autoOpen: false,
		        width: 320,
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
		
	</script>
	</head>
<%
	if (request.getParameter("flag") != null) {
		request.setAttribute("flag", request.getParameter("flag"));
	}
%>
	<body>
		<input type="hidden" value="0" id="state" />
	
			<!-- 内容区开始 -->
			<div class="main">
				<div class="maintit">
				<h2>
					<img src="${ctx}/${pattern}/images/tabicon.gif" width="16"
						height="16" align="absmiddle" />
					应用功能入口维护
				</h2>
				<h3>
					<a href="#" onclick="history.back(-1)">返回 &gt;&gt;</a>
				</h3>
			</div>
			
			<div class="centent">
			
				<div class="search">
					<form id="queryForm" name="queryForm" method="post" action="${ctx}/application/Permission!list.do">
						<!-- 
						<input type="hidden" value="${query.applicationId}" id="applicationId" name="query.applicationId" />
						<input type="hidden" value="${query.parentId}" id="parentId" name="query.parentId" />
						 -->
						<label>
							入口编号：
							<input value="${query.code}" id="code" name="query.code" maxlength="100" class="" />

						</label>
						<label>
							入口名称：
							<input value="${query.name}" id="name" name="query.name" maxlength="100" class="" />

						</label>
						<label>
							<input type="submit" value="检 索" class="btn_search"
								onMouseOver="this.className='btn_search_over'"
								onMouseOut="this.className='btn_search'" />
						</label>
					</form>
					<div class="clear"></div>
				</div>
				
				
				<div class="shop" id="shop">
					<p class="left">
						<input type="button" class="but_shop"  onclick="add('${ctx}/application/Permission!add.do',document.listForm);" value="添加" />
				          <input type="button" class="but_shop"  onclick="edit('${ctx}/application/Permission!edit.do','items',document.listForm);" value="修改" />
				          <input type="button" class="but_shop"  onclick="batchDelete('${ctx}/application/Permission!delete.do','items',document.listForm);" value="删除" />
          
						<input type="button" class="but_shop"
							onclick="applicationList();"
							value="返回应用列表" />
					</p>
					<p class="right">
						<select name="sortColumns" id="sortColumns" class="font12"
							onchange="sortColumns(this.value,document._pageForm_)">
							<option value="ts">
								--默认排序--
							</option>
							<option value="code"
								<c:if test="${query.sortColumns == 'code' }">selected="selected"</c:if>>
								入口编号
							</option>
							<option value="name"
								<c:if test="${query.sortColumns == 'name' }">selected="selected"</c:if>>
								入口名称
							</option>
							<option value="version"
								<c:if test="${query.sortColumns == 'version' }">selected="selected"</c:if>>
								URL
							</option>
							<option value="sequence"
								<c:if test="${query.sortColumns == 'sequence' }">selected="selected"</c:if>>
								排序号
							</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<jsp:include flush="true" page="/commons/toppagebar.jsp">
							<jsp:param name="target" value="/application/Permission!list.do" />
						</jsp:include>
					</p>
					<div class="clear"></div>
				</div>
			</div>
			
				<form id="listForm" name="listForm" method="post" action="${ctx}/application/Permission!list.do">
				
						<span>
		 <repeatsubmit:uniqueKey/>
		<c:forEach var="obj" items="${_pageBar_.parameter }" varStatus="vs">
			<input type="hidden" name="${obj.key}" value="${obj.value}"/>
		</c:forEach>
		</span>
						
					<table cellpadding="0" cellspacing="0" border="0" class="uiTable">
						<thead>

							<tr>
								<th>
									<input type="checkbox"
										onclick="setAllCheckboxState('items',this.checked)">
								</th>
								<th>
									序号
								</th>
								<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
								<th sortColumn="code">入口编号</th>
								<th sortColumn="name">入口名称</th>
								<th sortColumn="url">URL</th>
								<th sortColumn="sequence">排序号</th>

								<th>
									操作
								</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${page.result}" var="item" varStatus="status">
								<tr class="${status.count % 2 == 0 ? 'jg' : ''}">
									<td>
										<input type="checkbox" name="items"
											value="id=${item.id}&applicationId=${item.applicationId}&queryParentId=${query.parentId}">
									</td>
									<td>
										${page.thisPageFirstElementNumber + status.index}
									</td>
									<td>
										<a href="${ctx}/application/Permission!show.do?id=${item.id}&"><c:out
												value='${item.code}' />&nbsp;</a>
									</td>
									<td>
										<c:out value='${item.name}' />
										&nbsp;
									</td>
									<td>
										<c:out value='${item.url}' />
										&nbsp;
									</td>
									<td>
										<c:out value='${item.sequence}' />
										&nbsp;
									</td>
									<td>
										<a
											href="${ctx}/application/Permission!edit.do?id=${item.id}&query.applicationId=${item.applicationId}&query.parentId=${query.parentId}">
											修改</a>
										<c:if test="${model.parentPermission.type!='1'  }">
		   			 |<a href="javascript:openDialogById('${ctx}/application/Permission!toMove.do?id=${item.id}','moveDialog','move')">
												移动</a>
										</c:if>
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
					</form>
					<div class="page">
					<jsp:include flush="true" page="/commons/pagebar.jsp">
						<jsp:param name="target" value="/application/Permission!list.do" />
					</jsp:include>
				</div>
				</div>
			</div>
		<div id="moveDialog" style="overflow: hidden;">
			<iframe id="move" frameborder="0" marginwidth="0" marginheight="0"
				scrolling="no" width="320" height="115"></iframe>
		</div>
		<!-- 
		<c:if test="${flag eq 'refresh' }">
			<script type="text/javascript">
				(function() {
					window.parent.leftFrame.location.href = "${ctx}/application/Permission!leftTree.do?applicationId=${query.applicationId}&query.parentId=${query.parentId}";
				})();
			</script>
		</c:if>
		 -->
	</body>
	
</html>

<%@ include file="/commons/messages.jsp" %>
